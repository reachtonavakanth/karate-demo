package endtoend;
import com.intuit.karate.junit5.Karate;


public class UserCreationTestRunner {
    @Karate.Test
    Karate reqResTests() {
        return Karate.run("usercreation").relativeTo(getClass());
    }

}
