# karate-netty-example
Example creating dinossaurs mock api


#### To start the mock server run the following command: 

" java -jar karate-0.9.3.jar -m dino-mock.feature -p 8001 "


#### Then in vscode terminal console, go to the pom.xml folder and run:

" mvn test "

#### The test report will be into the target folder:
- Cucumber report: 
   - /target/cucumber-html-reports/report-feature_dino-dinosaur-dinosaur-feature.html
 
- Karate Report: 
  - /target/surefire-reports/
