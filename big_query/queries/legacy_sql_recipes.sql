/*
    Frequently, we'll need to flatten the BigQuery data at different levels of the hierarchy
    as well as mix/match them in the same query.  These are some recipes to achieve that.
*/

-- Datetime Functions
SELECT
    /* Date Format */
    date,
    CONCAT(SUBSTR(date, 0, 4), "-", SUBSTR(date,5,2), "-", SUBSTR(date,7,2)) AS date_formatted,

    /* Hit Timestamps - Legacy SQL doesn't seem to support timezone conversions */
    STRFTIME_UTC_USEC(SEC_TO_TIMESTAMP(visitStartTime + hits.time/1000),'%Y-%m-%d %H:%M:%S') AS hit_timestamp -- UTC
FROM
    TABLE_DATE_RANGE([<database>.ga_sessions_], TIMESTAMP('YYYY-MM-DD'), CURRENT_TIMESTAMP())