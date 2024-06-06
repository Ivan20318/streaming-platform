CREATE ROLE db_admin;

CREATE ROLE table_editor;

CREATE ROLE column_viewer;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
GRANT db_admin TO 'admin_user'@'localhost';

CREATE USER 'editor_user'@'localhost' IDENTIFIED BY 'password';
GRANT table_editor TO 'editor_user'@'localhost';

CREATE USER 'viewer_user'@'localhost' IDENTIFIED BY 'password';
GRANT column_viewer TO 'viewer_user'@'localhost';

GRANT ALL PRIVILEGES ON streaming_platform.* TO 'admin_user'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON streaming_platform.Users TO 'editor_user'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON streaming_platform.Videos TO 'editor_user'@'localhost';

GRANT SELECT (username, email) ON streaming_platform.Users TO 'viewer_user'@'localhost';
GRANT SELECT (title, description) ON streaming_platform.Videos TO 'viewer_user'@'localhost';