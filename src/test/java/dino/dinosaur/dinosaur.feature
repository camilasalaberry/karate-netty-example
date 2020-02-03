Feature: Dinosaur Family
As an human
I want to research about members of the dinosaur family
To learn more about this series that marked the 80/90s

Background: 
* def listDinosaur = '/dinosaurfamily/list'
* def searchDinosaur = '/dinosaurfamily/search/id'
* url mockurl
Scenario: It should be possible to list all members of the dinosaur family
    Given path listDinosaur
    When method GET
    Then status 200
    And match response == [ { id: '02164398092', name: 'Fran da Silva Sauro', dtBirth: '19/05/1990' }, { id: '88776977099', name: 'Dino da Silva Sauro', dtBirth: '22/01/1960' }, { id: '10740694049', name: 'Baby da Silva Sauro', dtBirth: '05/11/2006' }, { id: '95136972076', name: 'Charlene da Silva Sauro', dtBirth: '05/11/1965' }, { id: '35593692076', name: 'Robert da Silva Sauro', dtBirth: '31/06/1995' } ] 

Scenario: It must be possible to search for a dinosaur by id
    Given url mockurl
    And path searchDinosaur
    And params {id:'02164398092'}
    When method GET
    Then status 200
    And match response == { id: '02164398092', name: 'Fran da Silva Sauro', dtBirth: '19/05/1990' }

Scenario Outline: It must be possible to search for dinosaur by id <id> and validate the entire body of the response
    Given url mockurl
    And path searchDinosaur 
    And params {id:'#(id)'}
    When method GET
    Then status 200
    And match response == <resposta>
 Examples:
    |id        | resposta                                                                    |
    |02164398092|{ id: '02164398092', name: 'Fran da Silva Sauro', dtBirth: '19/05/1990' }    |
    |88776977099|{ id: '88776977099', name: 'Dino da Silva Sauro', dtBirth: '22/01/1960' }    |
    |10740694049|{ id: '10740694049', name: 'Baby da Silva Sauro', dtBirth: '05/11/2006' }    |
    |95136972076|{ id: '95136972076', name: 'Charlene da Silva Sauro', dtBirth: '05/11/1965' }|
    |35593692076|{ id: '35593692076', name: 'Robert da Silva Sauro', dtBirth: '31/06/1995' }  |


    Scenario Outline: It must be possible to search for dinosaur by id <id> and validate name and date of birth
    Given url mockurl
    And path searchDinosaur
    And params {id:'#(id)'}
    When method GET
    Then status 200
    And match response.name == <name>
    And match response.dtBirth == <date_of_birth>
 Examples:
    |id        | name                |date_of_birth|
    |02164398092|'Fran da Silva Sauro'| '19/05/1990'    |
    |88776977099|'Dino da Silva Sauro'|  '22/01/1960'   |
    |10740694049|'Baby da Silva Sauro'|  '05/11/2006'   |
    |95136972076|'Charlene da Silva Sauro'| '05/11/1965'|    
    |35593692076|'Robert da Silva Sauro'|  '31/06/1995' |


    Scenario: Dino must be a member of the family
    Given url mockurl
    And path listDinosaur
    When method GET
    Then status 200
    * print response
    And match response[1].name contains 'Dino da Silva Sauro'
