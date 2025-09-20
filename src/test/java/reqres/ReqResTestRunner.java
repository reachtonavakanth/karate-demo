package reqres;
import com.intuit.karate.junit5.Karate;


public class ReqResTestRunner {
    @Karate.Test
    Karate reqResTests() {
        return Karate.run("getUsersByPage").relativeTo(getClass());
    }

}
