CREATE TABLE IF NOT EXISTS house_price AS (
    SELECT * FROM read_csv_auto('data/hemnet_data_clean.csv')
)