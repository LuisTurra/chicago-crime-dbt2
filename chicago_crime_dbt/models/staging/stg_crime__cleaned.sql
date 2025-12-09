{{ config(materialized='view') }}

WITH cleaned AS (
  SELECT
    unique_key,
    CAST(date AS TIMESTAMP) as date_ts,
    EXTRACT(YEAR FROM CAST(date AS TIMESTAMP)) as year,
    UPPER(TRIM(primary_type)) as primary_type,
    UPPER(TRIM(description)) as description,
    COALESCE(latitude, -999) as latitude,
    COALESCE(longitude, -999) as longitude,
    CASE WHEN latitude BETWEEN -90 AND 90 AND longitude BETWEEN -88 AND -87.2 THEN 1 ELSE 0 END as valid_location,
    arrest,
    domestic
  FROM {{ ref('stg_crime__raw') }}
  WHERE unique_key IS NOT NULL
    AND date IS NOT NULL
)
SELECT * FROM cleaned WHERE valid_location = 1