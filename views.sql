CREATE VIEW UserSubscriptions AS
SELECT u.user_id, u.username, u.email, s.subscription_type, s.price
FROM Users u
JOIN Subscriptions s ON u.subscription_id = s.subscription_id;

CREATE VIEW VideoCategories AS
SELECT v.video_id, v.title, v.description, c.category_name
FROM Videos v
JOIN Categories c ON v.category_id = c.category_id;

CREATE VIEW CommentsView AS
SELECT c.comment_id, u.username, v.title, c.comment_text, c.comment_date
FROM Comments c
JOIN Users u ON c.user_id = u.user_id
JOIN Videos v ON c.video_id = v.video_id;