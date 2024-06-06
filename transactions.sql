START TRANSACTION;

INSERT INTO Videos (title, description, category_id) VALUES ('New Video', 'Description for new video', 1);

UPDATE Categories SET video_count = video_count + 1 WHERE category_id = 1;

COMMIT;