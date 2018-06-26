--------------------------------- Database queries ---------------------------------

-- Create Statement (properties are added to 'parameters' field)
CREATE DATABASE IF NOT EXISTS <DATABASE_NAME>

COMMENT 'Simple Comment'

LOCATION '/user/location/db_name.db'

WITH DBPROPERTIES (
    'DESCRIPTION' = 'Short description of what the database contains',
    'MAINTAINER' = 'Maintainer Name',
    'EMAIL' = 'contact@email.com',
    'GITHUB' = 'https://github.com/jamesgitting/gists/',
    'VERSION' = 'If applicable',
    'DATE' = 'Creation date'
);

-- Describe Statement (returns DB metadata including HDFS location)
DESCRIBE DATABASE EXTENDED <DATABASE_NAME>;

-- Drop Statement
DROP DATABASE <DATABASE_NAME>;
DROP DATABASE <DATABASE_NAME> CASCADE; -- Drops tables in addition to database