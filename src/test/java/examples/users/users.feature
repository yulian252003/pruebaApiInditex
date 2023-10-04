@parallel=false
Feature: Crear un usuario en la API Petstore

Background:
  * configure ssl = true
Scenario: Crear un usuario
  Given url 'https://petstore.swagger.io/v2/user'
  And request
  """
  {
    "id": 12311,
    "username": "pedropoarr@hotmail.com",
    "firstName": "PedroiPjaramo",
    "lastName": "Dias",
    "email": "correojg@ejemplo.com",
    "password": "contrasena",
    "phone": "1234567890"
  }
  """
  When method post
  Then status 200


Scenario: Obtener información de un usuario
  Given url 'https://petstore.swagger.io/v2/user/pedropoarr@hotmail.com'
  When method get
  Then status 200
  And match response.firstName == 'PedroiPjaramo'
  And match response.lastName == 'Dias'
  And match response.email == 'correojg@ejemplo.com'
  And match response.password == 'contrasena'
  And match response.phone == '1234567890'
  
