DELIMITER //

CREATE TRIGGER before_insert_user
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Users WHERE email = NEW.email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists.';
    END IF;
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_insert_video
AFTER INSERT ON Videos
FOR EACH ROW
BEGIN
    UPDATE Categories SET video_count = video_count + 1 WHERE category_id = NEW.category_id;
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_subscription
BEFORE UPDATE ON Subscriptions
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Price must be non-negative.';
    END IF;
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_update_video
AFTER UPDATE ON Videos
FOR EACH ROW
BEGIN
    IF OLD.category_id IS NOT NULL THEN
        UPDATE Categories SET video_count = video_count - 1 WHERE category_id = OLD.category_id;
    END IF;

    IF NEW.category_id IS NOT NULL THEN
        UPDATE Categories SET video_count = video_count + 1 WHERE category_id = NEW.category_id;
    END IF;
END; //

DELIMITER ;