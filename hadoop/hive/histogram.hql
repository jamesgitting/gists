-- Create CTE and apply our conditions.
WITH data AS (
	SELECT
		<GROUPING_FIELD_1>,
		<GROUPING_FIELD_2>,
		HISTOGRAM_NUMERIC(<NUMERIC_FIELD>, <N_BINS>) AS histos
	FROM
		t_uxa.expense_reports
	WHERE
		<FIELD> = <CONDITION>
		AND TO_DATE(<DATE_FIELD>) BETWEEN <DATE> AND <DATE>
	GROUP BY
		<GROUPING_FIELD_1>,
		<GROUPING_FIELD_2>
)

-- Explode the resulting array struct for easier viewing
SELECT
	<GROUPING_FIELD_1>,
	<GROUPING_FIELD_2>,
	histo
FROM
	data LATERAL VIEW EXPLODE(histos) exploded AS histo;

