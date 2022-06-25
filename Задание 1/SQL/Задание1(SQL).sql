1) Найти показатель L2B для всех направлений, в которых встречается код MOW. При расчете игнорировать направления без Сегментов.

SELECT n."From", n."To", n.l2b
FROM newtable n 
WHERE ("From" LIKE 'MOW' OR "To" LIKE 'MOW') AND segments != 0

2) Определить топ-3 городов с наибольшим суммарным значением L2B по всем направлениям, где они представлены.

SELECT p.city, sum(l2b) AS "sum l2b"
FROM (SELECT n."From" AS city, l2b
	FROM newtable n
	UNION all
	SELECT n."To" AS city, l2b
	FROM newtable n) AS p -- подзапрос, объединяющий данные по вылету и прилету в единую таблицу
GROUP BY p.city
ORDER BY sum(l2b) DESC
LIMIT 3