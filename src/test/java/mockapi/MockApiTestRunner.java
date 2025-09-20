package mockapi;
import com.intuit.karate.junit5.Karate;


public class MockApiTestRunner {
    @Karate.Test
    Karate testMocks() {
        return Karate.run("mockapi","mockapi2").relativeTo(getClass());
    }

}
