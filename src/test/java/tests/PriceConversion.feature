Feature: Currency Conversion
Background:
 * headers Authorization = {'X-CMC_PRO_API_KEY' : 'f57fed44-16c4-4f85-b353-7f4dd84fa9b6'}
 * header Accept = 'application/json'
 
#GTQ to GBP 
  Scenario Outline: Convert "10000000" Guatemalan Quetzal to British pounds
    Given url 'https://pro-api.coinmarketcap.com/v2/tools/price-conversion'
    And param amount = <amount>
    And param id = <fromCCY> 
    And param id = <toCCY> 
    When method get
    Then status 200
    Then print response
    And def price = response.data.quote.USD.price
    * print price
    
    #GBP to DOGE
    Given url 'https://pro-api.coinmarketcap.com/v2/tools/price-conversion'
    And param amount = price
    And param id = <fromCCY>
    And param id = <toCCY>
    Then status 200
    Then print response

    Examples: 
      | S.No | amount   | fromCCY | toCCY |
      |    1 | 10000000 |    3541 |  2791 |
