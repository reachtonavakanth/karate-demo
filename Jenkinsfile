pipeline {
    agent any

    tools {
        jdk 'JDK-21'
        maven 'maven-3.9.11'
    }

    parameters {
        choice(
            name: 'ENV',
            choices: ['test1', 'uat1'],
            description: 'Select environment to run'
        )

        choice(
            name: 'RUNNER',
            choices: ['runners.ComponentTestRunner', 'runners.EndToEndTestRunner'],
            description: 'Select the test runner'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/reachtonavakanth/karate-demo.git'
            }
        }

        stage('Build & Test') {
            steps {
                script {
                    // Parse multi-select TAGS from Active Choices parameter (comma-separated string)
                    def selectedTags = params.TAGS.tokenize(',').collect { it.trim() }.findAll { it }
                    def karateTags = selectedTags.collect { "@$it" }.join(',')

                     def cmd = """
                mvn clean test \
                    -Dkarate.env=${params.ENV} \
                    "-Dkarate.options=--tags ${karateTags}" \
                    -Dtest=${params.RUNNER}
            """
                    echo "Running: ${cmd}"
                    sh cmd
                }
            }
        }

        stage('Publish Reports') {
            steps {
                script {
                    try {
                        junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
                    } catch (err) {
                        echo "JUnit XML results not found."
                    }

                    try {
                        publishHTML([
                            allowMissing: true,
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            reportDir: 'target/karate-reports',
                            reportFiles: 'karate-summary.html',
                            reportName: 'Karate HTML Report'
                        ])
                    } catch (err) {
                        echo "Karate HTML report not found."
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                try {
                    publishHTML([
                        allowMissing: true,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'target/karate-reports',
                        reportFiles: 'karate-summary.html',
                        reportName: 'Karate Test Report'
                    ])
                } catch (err) {
                    echo "Post-build: Karate HTML report not found."
                }
            }
        }
    }
}