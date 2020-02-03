Feature: stateful mock server

Background:
* configure cors = true

Scenario: pathMatches('/healthcheck')
    * def response = { id: '02164398092', name: 'Camila Salaberry Paula', dtBirth: '19/05/1990' }

Scenario: pathMatches('/dinosaurfamily/list')
    * def response = [ { id: '02164398092', name: 'Fran da Silva Sauro', dtBirth: '19/05/1990' }, { id: '88776977099', name: 'Dino da Silva Sauro', dtBirth: '22/01/1960' }, { id: '10740694049', name: 'Baby da Silva Sauro', dtBirth: '05/11/2006' }, { id: '95136972076', name: 'Charlene da Silva Sauro', dtBirth: '05/11/1965' }, { id: '35593692076', name: 'Robert da Silva Sauro', dtBirth: '31/06/1995' } ] 
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }

Scenario: pathMatches('/dinosaurfamily/search/id') && paramValue('id') == '02164398092'
    * def response = { id: '02164398092', name: 'Fran da Silva Sauro', dtBirth: '19/05/1990' }
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }
Scenario: pathMatches('/dinosaurfamily/search/id') && paramValue('id') == '88776977099'
    * def response = { id: '88776977099', name: 'Dino da Silva Sauro', dtBirth: '22/01/1960' }
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }

Scenario: pathMatches('/dinosaurfamily/search/id') && paramValue('id') == '10740694049'
    * def response = { id: '10740694049', name: 'Baby da Silva Sauro', dtBirth: '05/11/2006' }
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }

Scenario: pathMatches('/dinosaurfamily/search/id') && paramValue('id') == '95136972076'
    * def response = { id: '95136972076', name: 'Charlene da Silva Sauro', dtBirth: '05/11/1965' }
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }  

Scenario: pathMatches('/dinosaurfamily/search/id') && paramValue('id') == '35593692076'
    * def response = { id: '35593692076', name: 'Robert da Silva Sauro', dtBirth: '31/06/1995' } 
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }  

Scenario:
    # catch-all
    * def responseStatus = 404
    * def responseHeaders = { 'Content-Type': 'text/html; charset=utf-8' }
    * def response = <html><body>Not Found</body></html>