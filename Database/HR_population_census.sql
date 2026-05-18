/*Problem link: https://www.hackerrank.com/challenges/asian-population/problem
Statement: Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.         
┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│              CITY                   │     │            COUNTRY                  │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ ID              │ INT (Primary Key) │     │ Code            │ VARCHAR(3) (PK)   │
│ NAME            │ VARCHAR(17)       │     │ Name            │ VARCHAR(44)       │
│ COUNTRYCODE     │ VARCHAR(3) (FK)   │────▶│ Continent       │ VARCHAR(13)       │
│ DISTRICT        │ VARCHAR(20)       │     │ Region          │ VARCHAR(25)       │
│ POPULATION      │ INT               │     │ SurfaceArea     │ DECIMAL(10,2)     │
└─────────────────┴───────────────────┘     │ IndepYear       │ SMALLINT          │
                                            │ Population      │ INT               │
                                            │ LifeExpectancy  │ DECIMAL(3,1)      │
                                            │ GNP             │ DECIMAL(10,2)     │
                                            │ GNPOld          │ DECIMAL(10,2)     │
                                            │ LocalName       │ VARCHAR(44)       │
                                            │ GovernmentForm  │ VARCHAR(44)       │
                                            │ HeadOfState     │ VARCHAR(32)       │
                                            │ Capital         │ INT               │
                                            │ Code2           │ VARCHAR(2)        │
                                            └─────────────────┴───────────────────┘
*/

SELECT SUM(City.population)
FROM City INNER JOIN Country
ON Country.code = City.countrycode
WHERE Country.continent = "ASIA";