-- Reference: https://hadoopsters.net/2018/02/04/how-random-sampling-in-hive-works-and-how-to-use-it/
SELECT
	*
FROM
	<TABLE_NAME>
WHERE
	RAND() <= 0.0001
DISTRIBUTE BY
	RAND()
SORT BY
	RAND()
LIMIT 10000
