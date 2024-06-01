CREATE ROLE db_admin;
CREATE ROLE table_manager;
CREATE ROLE column_manager;

CREATE USER admin_user WITH PASSWORD 'securepassword';
GRANT db_admin TO admin_user;

CREATE USER table_user WITH PASSWORD 'securepassword';
GRANT table_manager TO table_user;

CREATE USER column_user WITH PASSWORD 'securepassword';
GRANT column_manager TO column_user;

GRANT ALL PRIVILEGES ON DATABASE your_database TO db_admin;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Users, Videos, Comments TO table_manager;

GRANT SELECT (username, email) ON TABLE Users TO column_manager;
