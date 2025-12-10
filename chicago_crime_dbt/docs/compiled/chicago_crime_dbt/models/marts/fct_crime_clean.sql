

SELECT
  unique_key, date_ts, year, primary_type, description,
  latitude, longitude, arrest, domestic
FROM `chicago-crime-2025`.`chicago_crime`.`stg_crime__cleaned`