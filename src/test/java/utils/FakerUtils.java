package utils;

import com.github.javafaker.Faker;

public class FakerUtils {

    private static final Faker faker = new Faker();

    public static String randomFirstName() {
        return faker.name().firstName();
    }

    public static String randomLastName() {
        return faker.name().lastName();
    }

}