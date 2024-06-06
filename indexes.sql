CREATE INDEX idx_username ON Users(username);

CREATE INDEX idx_video_title_description ON Videos(title(255), description(255));

CREATE INDEX idx_email_prefix ON Users(email(10));