BEGIN;

INSERT INTO Videos (user_id, title, description) VALUES (1, 'Sample Video', 'This is a sample video');
INSERT INTO Comments (video_id, user_id, content) VALUES (1, 1, 'Great video!');
INSERT INTO Comments (video_id, user_id, content) VALUES (1, 2, 'I agree, nice video!');

COMMIT;
