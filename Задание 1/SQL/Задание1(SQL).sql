1) ����� ���������� L2B ��� ���� �����������, � ������� ����������� ��� MOW. ��� ������� ������������ ����������� ��� ���������.

SELECT n."From", n."To", n.l2b
FROM newtable n 
WHERE ("From" LIKE 'MOW' OR "To" LIKE 'MOW') AND segments != 0

2) ���������� ���-3 ������� � ���������� ��������� ��������� L2B �� ���� ������������, ��� ��� ������������.

SELECT p.city, sum(l2b) AS "sum l2b"
FROM (SELECT n."From" AS city, l2b
	FROM newtable n
	UNION all
	SELECT n."To" AS city, l2b
	FROM newtable n) AS p -- ���������, ������������ ������ �� ������ � ������� � ������ �������
GROUP BY p.city
ORDER BY sum(l2b) DESC
LIMIT 3