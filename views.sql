CREATE VIEW VideoAuthors AS
SELECT v.video_id, v.title, v.description, v.upload_date, u.username
FROM Videos v
JOIN Users u ON v.user_id = u.user_id;

CREATE VIEW VideoComments AS
SELECT c.comment_id, c.video_id, c.content, c.comment_date, u.username
FROM Comments c
JOIN Users u ON c.user_id = u.user_id;

CREATE VIEW UserRolesView AS
SELECT u.user_id, u.username, r.role_name
FROM Users u
JOIN UserRoles ur ON u.user_id = ur.user_id
JOIN Roles r ON ur.role_id = r.role_id;
