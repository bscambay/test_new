SELECT * 
	FROM pg_stat_activity 
	WHERE datname = 'postgres';
ALTER DATABASE postgres RENAME TO gold