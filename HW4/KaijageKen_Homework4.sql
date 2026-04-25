-----------Ken Kaijage Homework 4--------------

---Question 1.

SELECT DISTINCT LIBRARY AS LibraryName
       ,ADDRESS || ',' ||' ' ||CITY || ', IA ' || ZIP AS FULLAddress
FROM LIBRARIES 
WHERE ADDRESS LIKE '%Main St%'
;

---Question 2.

SELECT DISTINCT LibraryID
    ,GrantDate
    ,TO_CHAR(Amount, '$999,999,999') AS Amount
FROM GRANTS
WHERE Building = 1
ORDER BY Amount DESC 
FETCH FIRST 5 ROWS ONLY
;

---Question 3.
SELECT DISTINCT L.LIBRARY AS LibraryName
    ,EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM G.GrantDate) AS GrantAgeYears
FROM LIBRARIES L 
JOIN GRANTS G 
ON L.LIBRARYID = G.LIBRARYID 
WHERE G.BUILDING = 1 
AND G.Amount <= 10000
;

---Question 4.
SELECT DISTINCT L.Library AS LibraryName
    ,COALESCE(H.Library, 'None') As HeadLibraryName
    ,L.Website AS LibraryWebsite
FROM LIBRARIES L
JOIN 
(
    SELECT LibraryID
    FROM CITIES
    GROUP BY LibraryID
    HAVING COUNT(*) > 1
)C
ON L.LibraryID = C.LibraryID
LEFT JOIN LIBRARIES H 
ON L.BranchOf = H.LibraryID
WHERE L.WEBSITE IS NOT NULL
ORDER BY COALESCE(H.Library, 'None') DESC
;




