-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE unknown_measurements ADD `hmac` TEXT DEFAULT NULL;
ALTER TABLE measurements ADD `hmac` TEXT DEFAULT NULL;

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE unknown_measurements DROP COLUMN `hmac`;
ALTER TABLE measurements DROP COLUMN `hmac`;
