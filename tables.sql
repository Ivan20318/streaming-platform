CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_type VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    subscription_id INT,
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_name VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE PlaylistVideos (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    comment_text TEXT NOT NULL,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

--Add some information to the table

INSERT INTO Subscriptions (subscription_type, price) VALUES
('Basic', 9.99),
('Standard', 14.99),
('Premium', 19.99);

INSERT INTO Users (username, email, password, subscription_id) VALUES
('user1', 'user1@example.com', 'password1', 1),
('user2', 'user2@example.com', 'password2', 2),
('user3', 'user3@example.com', 'password3', 3);

INSERT INTO Categories (category_name) VALUES
('Movies'),
('TV Shows'),
('Documentaries');

INSERT INTO Videos (title, description, category_id) VALUES
('Movie 1', 'Description for Movie 1', 1),
('TV Show 1', 'Description for TV Show 1', 2),
('Documentary 1', 'Description for Documentary 1', 3);

INSERT INTO Playlists (playlist_name, user_id) VALUES
('My Favorites', 1),
('Watch Later', 2),
('Top Picks', 3);

INSERT INTO PlaylistVideos (playlist_id, video_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Comments (user_id, video_id, comment_text) VALUES
(1, 1, 'Great movie!'),
(2, 2, 'Loved this episode!'),
(3, 3, 'Very informative.');