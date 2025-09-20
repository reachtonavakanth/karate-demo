function fn() {
  var config = {};

  // Default base URLs
  config.baseUrls = {
    mockApi: 'https://mock.apidog.com/m1/1050837-1038269-default/',
    reqresApi: 'https://reqres.in/api/',
  };

  // Switch URLs based on environment

    //karate.env is a special built-in variable in Karate.
    //It reads the environment value that you pass from the command line or your IDE.
    //  Example: If you run mvn test -Dkarate.env=qa, then karate.env = "qa".
    //If you don’t set it, karate.env is undefined.

  var env = karate.env; // read the environment
  if (!env) env = 'test1'; // default to test1

  if (env == 'test1') {
    config.baseUrls.mockApi = 'https://mock.apidog.com/m1/1050837-1038269-default/';
   config.baseUrls.reqresApi= 'https://reqres.in/api/';
    config.authToken= "kD8sF1LqR9pXeH-vTqNwJbZcO3uVmYf4G2aSiKj0QhLrPn5BtEoCxUy8WdM6gA==";
    config.headers = {
        'Content-Type': 'application/json'
      };

  } else if (env == 'uat1') {
    config.baseUrls.mockApi = 'https://mock.apidog.com/m1/1050837-1038269-default/';
    config.baseUrls.reqresApi= 'https://reqres.in/api/';
    config.authToken= "kD8sF1LqR9pXeH-vTqNwJbZcO3uVmYf4G2aSiKj0QhLrPn5BtEoCxUy8WdM6gA==";
    config.headers = {
        'Content-Type': 'application/json'
      };

  }


  return config;
}