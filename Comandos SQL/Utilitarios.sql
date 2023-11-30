/*****************Econtrar tamanho da base de dados em PostgreSQL *****************/
SELECT pg_size_pretty(pg_database_size('TccBaseEntrega'));