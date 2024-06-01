CREATE OR REPLACE FUNCTION before_insert_videos()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Users WHERE user_id = NEW.user_id) THEN
        RAISE EXCEPTION 'User does not exist';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_videos
BEFORE INSERT ON Videos
FOR EACH ROW
EXECUTE FUNCTION before_insert_videos();

CREATE OR REPLACE FUNCTION after_insert_videos()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO LogTable(action, table_name, user_id, timestamp)
    VALUES('INSERT', 'Videos', NEW.user_id, NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_videos
AFTER INSERT ON Videos
FOR EACH ROW
EXECUTE FUNCTION after_insert_videos();

CREATE OR REPLACE FUNCTION before_update_comments()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.content IS NULL OR NEW.content = '' THEN
        RAISE EXCEPTION 'Comment content cannot be empty';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_update_comments
BEFORE UPDATE ON Comments
FOR EACH ROW
EXECUTE FUNCTION before_update_comments();

CREATE OR REPLACE FUNCTION after_update_comments()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO LogTable(action, table_name, user_id, timestamp)
    VALUES('UPDATE', 'Comments', NEW.user_id, NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_update_comments
AFTER UPDATE ON Comments
FOR EACH ROW
EXECUTE FUNCTION after_update_comments();
