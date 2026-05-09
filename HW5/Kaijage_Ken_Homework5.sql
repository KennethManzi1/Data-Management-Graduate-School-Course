-----------Ken Kaijage Homework 5--------------

---Question 1.

SELECT SEASON
FROM EPISODE 
WHERE TO_CHAR(AIRDATE, 'MM') IN ('12', '01', '02')

MINUS 

SELECT SEASON
FROM EPISODE 
WHERE TO_CHAR(AIRDATE, 'MM') IN ('06', '07', '08')
;

---Question 2.

SELECT DISTINCT STATE 
FROM LOCALE 
WHERE LOCALEID NOT IN 
(
    SELECT DISTINCT LOCALEID
    FROM RESTAURANT
)
ORDER BY STATE


---Question 3.

SELECT r.RESTAURANT AS RESTAURANT_NAME
    ,r.WEBSITE
    ,CASE
        WHEN r.CUISINE IN ('American', 'Barbeque') THEN 'CLASSIC'
        WHEN r.CUISINE IN ('Argentinian', 'Venezuelan') THEN 'Latin'
        WHEN r.CUISINE IN ('Swiss', 'Polish') THEN 'European'
        ELSE 'Other'
    END AS CUISINE_CATEGORY
    ,'Season ' || e.Season || ', Episode ' || e.Episode || ': ' || e.Title AS EPISODE_FEATURED

FROM RESTAURANT r
JOIN APPEARANCE a
ON r.RestaurantID = a.RestaurantID
JOIN EPISODE e 
ON a.EpisodeID = e.EpisodeID
WHERE r.Rating = 5
ORDER BY r.RESTAURANT
;


---Question 4.
SELECT 
    ROW_NUMBER() OVER (PARTITION BY State ORDER BY (Housing / Income) DESC) AS H_RANK
    ,CITY
    ,STATE
    ,TO_CHAR(Population, 'FM999,999,999') AS POPULATION
    ,TO_CHAR(ROUND((Housing / Income) * 100), 'FM99') || '%' AS HOUSING_COST_RATIO
 FROM LOCALE 
 ORDER BY STATE, HOUSING_COST_RATIO
 ;





