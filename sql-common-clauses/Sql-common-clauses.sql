SELECT id, log_feature `log`, volume vol FROM log_feature lf 

SELECT id, resource_type 
FROM resource_type rt 
ORDER BY id ASC
LIMIT 5

SELECT id, resource_type 
FROM resource_type rt 
ORDER BY id DESC
LIMIT 5

SELECT id, resource_type 
FROM resource_type rt 
ORDER BY id ASC, resource_type DESC
LIMIT 5

SELECT COUNT(*), COUNT(DISTINCT id) id_unique, COUNT(DISTINCT severity_type) severity_type_nunique
FROM severity_type st 

SELECT id, log_feature, volume FROM log_feature lf 
WHERE volume >= 100 AND volume <= 300 AND log_feature = 'feature 201'
ORDER BY volume

print("fix")

