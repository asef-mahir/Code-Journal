/*Problem link: https://www.hackerrank.com/challenges/average-population-of-each-continent/problem
Statement: Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.         
┌─────────────────────────────────────┐     ┌─────────────────────────────────────┐
│              CITY                   │     │            COUNTRY                  │
├─────────────────┬───────────────────┤     ├─────────────────┬───────────────────┤
│ ID              │ INT (Primary Key) │     │ Code            │ VARCHAR(3) (PK)   │
│ NAME            │ VARCHAR(17)       │     │ Name            │ VARCHAR(44)       │
│ COUNTRYCODE     │ VARCHAR(3) (FK)   │     │ Continent       │ VARCHAR(13)       │
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

SELECT Country.continent, FLOOR(AVG(City.population))
FROM Country JOIN City
ON Country.code = City.countrycode
GROUP BY Country.continent;
