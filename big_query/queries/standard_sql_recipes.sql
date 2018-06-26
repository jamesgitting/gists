/*
    Frequently, we'll need to flatten the BigQuery data at different levels of the hierarchy
    as well as mix/match them in the same query.  These are some recipes to achieve that.
*/

-- Datetime Functions
SELECT
    /* Date Format */
    date,
    CONCAT(SUBSTR(date, 0, 4), "-", SUBSTR(date,5,2), "-", SUBSTR(date,7,2)) AS date_formatted,

    /* Hit Timestamps */
    FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SECONDS(CAST(visitStartTime + hit.time/1000 AS INT64))) AS hit_timestamp, -- UTC
    FORMAT_TIMESTAMP("%Y-%m-%d %H:%M:%S", TIMESTAMP_SECONDS(CAST(visitStartTime + hit.time/1000 AS INT64)), "<timezone>") AS hit_timestamp_tz
FROM
    `<database>.ga_sessions_*`,
    UNNEST(hits) AS hit
WHERE
    _TABLE_SUFFIX BETWEEN 'YYYYMMDD' AND 'YYYYMMDD'