1

-----

Select all fields for all brands in the brands table.

The result set for this query should be every record in the brands table.

-----


SELECT * FROM brands;


==========
2

-----

Select all fields for all car models made by Pontiac in the 
models table. 

The result set should be:
  id   | year  | brand_name |    name
-------+-------+------------+------------
    25 |  1961 | Pontiac    | Tempest
    27 |  1962 | Pontiac    | Grand Prix
    36 |  1963 | Pontiac    | Grand Prix
    42 |  1964 | Pontiac    | GTO
    43 |  1964 | Pontiac    | LeMans
    44 |  1964 | Pontiac    | Bonneville
    45 |  1964 | Pontiac    | Grand Prix
(7 rows)


-----


SELECT * FROM models WHERE brand_name = 'Pontiac' LIMIT 7;


==========
3

-----

Select the brand name and model name for all models made in 
1964 from the models table. 

The result set should be:
 brand_name |    name
------------+-------------
 Chevrolet  | Corvette
 Ford       | Mustang
 Ford       | Galaxie
 Pontiac    | GTO
 Pontiac    | LeMans
 Pontiac    | Bonneville
 Pontiac    | Grand Prix
 Plymouth   | Fury
 Studebaker | Avanti
 Austin     | Mini Cooper
 (10 rows)
 

-----


SELECT brand_name, name FROM models WHERE year=1964 LIMIT 10;


==========
4

-----

Select the model name, brand name, and headquarters for 
the Ford Mustang from the models and brands tables.

The result set should be:
  name   | brand_name | headquarters
---------+------------+--------------
 Mustang | Ford       | Dearborn, MI
 (1 rows)


-----


SELECT models.name,models.brand_name,headquarters FROM brands JOIN models ON models.brand_name=brands.name WHERE models.name='Mustang' LIMIT 1;


==========
7

-----

Select the name of any and all car brands that are not 
discontinued.

The result set should be:
   name
-----------
 Ford
 Chrysler
 Chevrolet
 Cadillac
 BMW
 Buick
 Tesla
(7 rows)


-----


SELECT name FROM brands WHERE discontinued IS NULL LIMIT 7;


==========
12

-----

Modify the query so that it only selects brands that do NOT have any
models in the models table.

The correct result set is:

 name  | founded
-------+---------
 Tesla |    2003
(1 rows)

-----


  SELECT b.name,
         founded
  FROM brands AS b
    LEFT JOIN models AS m
      ON b.name = m.brand_name
  WHERE m.year IS NULL LIMIT 1;


==========
15

-----

Using a subquery, select the name and year of any model whose 
year is the same year that ANY brand was founded.

The result set should be:

   name    | year
-----------+-------
 Imperial  |  1926
 Corvette  |  1954
 Fleetwood |  1954
(3 rows)

-----


SELECT name,year FROM models WHERE year IN (SELECT founded FROM brands) LIMIT 3;