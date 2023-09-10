SELECT 
	table_schema AS schema,
	table_name AS view
FROM
	information_schema.views
WHERE
	table_schema NOT IN ('information_schema',
	'pg_catalog')
ORDER BY
	schema ASC,
	view ASC