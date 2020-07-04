psql -U postgres -d myapp_development < "chmod 0775 docker-entrypoint-initdb.d/init-database.sh"
psql -U postgres -d myapp_development < "/docker-entrypoint-initdb.d/1_setup.sql"
psql -U postgres -d myapp_development < "/docker-entrypoint-initdb.d/2_setup.sql"
