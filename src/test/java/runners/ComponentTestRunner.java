package runners;

import com.intuit.karate.junit5.Karate;

class ComponentTestRunner {
    static {
        System.setProperty("karate.output.dir", "target/karate-reports");
    }

    @Karate.Test
    Karate runAll() {

        return Karate.
                run("../mockapi/mockapi.feature", "../mockapi/mockapi2.feature", "../reqres/getUsersByPage.feature")
                .tags("@mockapi,@reqres").relativeTo(getClass());


    }
}