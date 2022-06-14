/*This lists out each database, the files for each database, the file size for each file, as well as the total
of all files for each database.
This requires that each database (and their total size) is listed multiple times (once for each file).*/

/*We can use it for - SQL, SQL Server  how to, mssql, t-sql.*/


SELECT
    d.name AS 'Database',
    m.name AS 'File',
    m.size,
    m.size * 8/1024 'Size (MB)',
    SUM(m.size * 8/1024) OVER (PARTITION BY d.name) AS 'Database Total',
    m.max_size
FROM sys.master_files m
INNER JOIN sys.databases d ON
d.database_id = m.database_id;
