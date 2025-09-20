package runners;

import com.intuit.karate.junit5.Karate;

class EndToEndTestRunner {

    @Karate.Test
    Karate runAll() {
        return Karate.
                run("../endtoend/usercreation.feature")
                .tags("@usercreation").relativeTo(getClass());
    }
}