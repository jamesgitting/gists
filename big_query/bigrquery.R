####################################################################################################
#                                                                                                  #
#                                 General R with BigQuery Examples                                 # 
#                                                                                                  #
####################################################################################################


# Libraries -----------------------------------------------------------------------------------
library(bigrquery)
library(DBI)
library(httr)
library(tidyverse)

# Configuration -------------------------------------------------------------------------------
PROJECT_ID = '<Project>' # https://cloud.google.com/resource-manager/docs/creating-managing-projects
BILLING_ID = '<Billing>' 
DATASET = '<Data>'

# Connection ----------------------------------------------------------------------------------

con <- dbConnect(
  bigrquery::bigquery(),
  project = PROJECT_ID,
  dataset = DATASET,
  billing = BILLING_ID
)

# List Tables in a data set
dbListTables(con)

# Fetch results
dbGetQuery(con, "SELECT * FROM `MY_DATABASE.MY_TABLE`", n = 10)

# Wrap results into a tibble for easier manipulation
# Reference:
#   legacy_sql:   https://cloud.google.com/bigquery/docs/reference/legacy-sql
#   standard_sql: https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators
fetch_data <- function(sql, max_pg = 10, legacy = FALSE, proj = PROJECT_ID){
  results <- as_tibble(query_exec(query = sql,
                                  max_pages = max_pg,
                                  use_legacy_sql = legacy,
                                  project = proj))
  return(results)
}
