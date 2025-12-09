{{ config(materialized='table') }}

SELECT
  unique_key, date_ts, year, primary_type, description,
  latitude, longitude, arrest, domestic
FROM {{ ref('stg_crime__cleaned') }}