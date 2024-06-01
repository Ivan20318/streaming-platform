CREATE INDEX idx_username ON Users(username);

CREATE INDEX idx_title_upload_date ON Videos(title, upload_date);

CREATE INDEX idx_email_prefix ON Users(email(10));
