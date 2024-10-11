CREATE TABLE User (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  bio TEXT,
  profile_picture_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  content TEXT,
  post_type ENUM('text', 'image', 'video', 'carousel'),
  media_urls JSON, -- almacenar múltiples URLs de imágenes o videos en un carrusel
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(id)
);


CREATE TABLE Favourites (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  post_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(id),
  FOREIGN KEY (post_id) REFERENCES Posts(id)
);

CREATE TABLE Reposts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  original_post_id INT,
  is_quoted BOOLEAN DEFAULT FALSE,
  quoted_text TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(id),
  FOREIGN KEY (original_post_id) REFERENCES Posts(id)
);

CREATE TABLE Followers (
  follower_id INT,
  followed_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (follower_id, followed_id),
  FOREIGN KEY (follower_id) REFERENCES User(id),
  FOREIGN KEY (followed_id) REFERENCES User(id)
);



