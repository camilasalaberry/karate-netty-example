function fn() {
  var env = karate.env; // get system property 'karate.env'
  var ambiente;

  karate.log("karate.env system property was:", env);
  if (!env) {
    env = "dev";
  }
  var config = {
    mockurl: "http://localhost:8001",
    env: env,
    protocol: "http"
  };

  return config;
}
