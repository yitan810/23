-- Better2022Authors query

SELECT p1.articleAuthor AS authorName, p1.articleCount2021, p2.articleCount2022
FROM ProlificIn2021View p1, ProlificIn2022View p2
WHERE p1.articleAuthor = p2.articleAuthor
GROUP BY p1.articleAuthor, p1.articleCount2021, p2.articleCount2022
HAVING p1.articleCount2021 < p2.articleCount2022;

-- output of the query before deletions
/*
   authorname    | articlecount2021 | articlecount2022 
-----------------+------------------+------------------
 Lucius Malfoy   |                3 |                6
 Ragnar Lothbrok |                5 |                6
(2 rows)
*/

-- SQL statments that delete the tuples
-- DELETE FROM Articles WHERE editionDate = DATE '2021-06-13' AND articleNum = 10;
-- DELETE FROM Articles WHERE editionDate = DATE '2021-06-13' AND articleNum = 1;

-- Output of the query after delections
/*
   authorname    | articlecount2021 | articlecount2022 
-----------------+------------------+------------------
 Ragnar Lothbrok |                4 |                6
*/