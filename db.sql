-- CREATE TABLE IF NOT EXISTS users (
--     user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     username varchar(30) UNIQUE,
--     email varchar(255) UNIQUE
-- );

-- CREATE TABLE IF NOT EXISTS posts (
--     post_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     user_id int REFERENCES users(user_id),
--     title varchar(255) NOT NULL,
--     body text NOT NULL,
--     created_at timestamp DEFAULT current_timestamp
-- );

-- INSERT INTO users (username, email)
-- VALUES  ('calcur', 'caleb@calebcurry.com'),
--         ('avataylor', 'ava.taylor@gmail.com'),
--         ('emma95', 'emma@gmail.com');

-- SELECT * FROM users;

-- INSERT INTO posts (user_id, title, body)
-- VALUES  (1, 'Will Postgres reuse IDs?', 'I am confused on IDENTITY'),
--         (1, 'How does a FK work?', 'I heard it was important, please give me more info.'),
--         (2, 'Should I get my masters degree?', 'currently i am in middleschool');

-- SELECT * FROM posts;


-- SELECT * FROM posts, users
-- WHERE users.user_id = posts.user_id;

-- SELECT * FROM posts
-- INNER JOIN users
-- ON posts.user_id = users.user_id;

-- SELECT * FROM users
-- INNER JOIN posts
-- ON users.user_id = posts.post_id;

-- SELECT users.username, posts.title, posts.body
-- FROM users
-- INNER JOIN posts
-- ON users.user_id = posts.user_id;

-- SELECT username, title, body
-- FROM users
-- INNER JOIN posts
-- ON users.user_id = posts.user_id;

-- INSERT INTO posts (title, body)
-- VALUES ('orphaned row', 'i have no poster');

-- SELECT u.username, p.title, p.body
-- FROM users as u
-- INNER JOIN posts as p
-- ON u.user_id = p.user_id;

-- SELECT * FROM posts;

-- CREATE OR REPLACE VIEW post_summary AS
--     SELECT u.username, p.title, p.body
--     FROM users as u
--     INNER JOIN posts as p
--     ON u.user_id = p.user_id;

-- SELECT * FROM post_summary;

--CREATE INDEX ON posts(user_id);

--EXPLAIN SELECT * FROM post_summary;

--DROP INDEX posts_user_id_idx;

-- DELETE FROM users
-- WHERE user_id = 2;

-- ALTER TABLE posts
-- DROP CONSTRAINT posts_user_id_fkey;
 
-- ALTER TABLE posts
-- ADD FOREIGN KEY (user_id)
-- REFERENCES users(user_id)
-- ON DELETE CASCADE;

-- DELETE FROM users
-- WHERE user_id=3;

-- ALTER TABLE posts
-- ALTER COLUMN user_id DROP NOT NULL;

-- ALTER TABLE posts
-- DROP CONSTRAINT posts_user_id_fkey,
-- ADD FOREIGN KEY (user_id)
-- REFERENCES users(user_id)
-- ON DELETE SET NULL;

-- DELETE FROM USERS
-- WHERE user_id = 2;

-- CREATE TABLE IF NOT EXISTS users (
--     user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     username varchar(30) UNIQUE NOT NULL,
--     email varchar(255) UNIQUE NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS users_pii (
--     user_id int PRIMARY KEY REFERENCES users(user_id),
--     full_name varchar(50) NOT NULL,
--     address varchar(255) NOT NULL
-- )

-- INSERT INTO users (username, email)
-- VALUES  ('colob', 'colob@gmail.com'),
--         ('sam123', 'sam@gmail.com'),
--         ('Trey', 't@gmail.com');

-- SELECT * FROM users;

-- INSERT INTO users_pii
-- values (2, 'Sam Antha', '123 Count St');

-- SELECT email, username, address, full_name FROM users
-- INNER JOIN users_pii
-- ON users.user_id = users_pii.user_id;


-- CREATE TABLE IF NOT EXISTS categories (
--     category_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name varchar(255) NOT NULL UNIQUE
-- );


-- CREATE TABLE IF NOT EXISTS posts (
--     post_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--    -- user_id int REFERENCES users(user_id),
--     title varchar(255) NOT NULL,
--     body text NOT NULL,
--     created_at timestamp DEFAULT current_timestamp,
--     category_id int REFERENCES categories(category_id)
-- );

-- INSERT INTO posts (title, body, category_id)
-- VALUES  ('Will Postgres reuse IDs?', 'I am confused on IDENTITY', 2),
--         ('How does a FK work?', 'I heard it was important, please give me more info.', 2),
--         ('Should I get my masters degree?', 'currently i am in middleschool', 1);

-- SELECT title, body, name FROM posts
-- INNER JOIN categories
-- ON posts.category_id = categories.category_id;

-- SELECT category_id FROM categories WHERE name = 'career';

-- UPDATE posts
-- SET category_id = (SELECT category_id FROM categories WHERE name = 'career')
-- WHERE post_id = 1;

-- INSERT INTO categories (name)
-- VALUES ('meta');

-- ALTER TABLE posts
-- DROP COLUMN category_id;

-- DROP TABLE categories;

-- ALTER TABLE posts
-- ADD COLUMN category varchar(255) CHECK (category IN ('career', 'code', 'off topic'))

-- UPDATE posts
-- SET category = 'codes'
-- WHERE post_id = 1;

-- SELECT username, title, body FROM posts
-- LEFT JOIN users
-- ON posts.user_id = users.user_id;

-- UPDATE posts
-- SET user_id = NULL
-- WHERE post_id = 1;

-- ALTER TABLE posts
-- DROP CONSTRAINT posts_user_id_fkey,

-- ADD FOREIGN KEY (user_id)
-- REFERENCES users (user_id)
-- ON DELETE SET NULL;

-- DELETE FROM users
-- WHERE user_id = 1;

-- CREATE VIEW all_posts AS
--     SELECT u.username, p.title, p.body FROM posts AS P
--     LEFT JOIN users AS u
--     ON p.user_id = u.user_id;

-- SELECT * FROM all_posts;

-- CREATE VIEW orphaned_posts AS
--     SELECT * FROM posts
--     WHERE user_id IS NULL;

-- SELECT * FROM orphaned_posts;

-- CREATE TABLE referrals (
--     referral_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     referrer_id int REFERENCES users(user_id),
--     referred_id int UNIQUE REFERENCES users(user_id)
-- );

-- INSERT INTO referrals(referrer_id, referred_id)
-- VALUES (1, 2), (1, 3);

-- SELECT * FROM referrals;

-- CREATE TABLE IF NOT EXISTS users (
--     user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     username varchar(30) UNIQUE,
--     email varchar(255) UNIQUE,
--     referred_by int REFERENCES users(user_id)

-- );

-- INSERT INTO users (username, email, referred_by)
-- VALUES  ('calcur', 'caleb@calebcurry.com', NULL),
--         ('avataylor', 'ava.taylor@gmail.com', 1),
--         ('emma95', 'emma@gmail.com', 1);

-- SELECT * FROM users;

-- CREATE VIEW referrals AS
--     SELECT referred.username, referred.email, referrer.username as referred_by
--     FROM users as referred
--     LEFT JOIN users as referrer
--     ON referred.referred_by = referrer.user_id;

-- SELECT username, email, referred_by FROM referrals;

-- CREATE TABLE comments (
--     comment_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     user_id int NOT NULL REFERENCES users(user_id),
--     post_id int NOT NULL REFERENCES posts(post_id),
--     body text NOT NULL,
--     created_at timestamp NOT NULL DEFAULT current_timestamp
-- );

-- INSERT INTO comments (user_id, post_id, body)
-- VALUES (1, 2, 'yea'), (3, 2, 'nice post');


-- INSERT INTO comments (user_id, post_id, body, created_at)
-- VALUES 
-- (1, 2, 'That is very interesting. I completely agree with your point.', '2023-05-01 14:35:28'),
-- (3, 1, 'Thanks for sharing. This was a great read.', '2023-04-15 08:45:37'),
-- (2, 3, 'Very insightful post. I learned a lot.', '2023-03-21 16:17:46'),
-- (1, 1, 'I never thought about it that way before. Thanks for the new perspective.', '2023-02-28 09:26:55'),
-- (3, 2, 'I am looking forward to more posts like this one.', '2023-01-20 18:30:04'),
-- (2, 2, 'Good point. I completely agree.', '2023-04-10 13:33:28'),
-- (1, 3, 'Interesting perspective. Thanks for sharing.', '2023-03-15 11:45:37'),
-- (2, 1, 'This was very enlightening. Keep up the good work.', '2023-02-21 12:17:46'),
-- (3, 1, 'I look forward to your next post.', '2023-01-28 10:26:55'),
-- (1, 2, 'Very well-written post. I enjoyed reading this.', '2023-05-30 19:30:04'),
-- (2, 3, 'Thanks for the insights. I learned a lot from your post.', '2023-04-20 15:35:28'),
-- (3, 2, 'I agree with your points. Looking forward to your next post.', '2023-03-25 14:45:37'),
-- (1, 1, 'Great perspective. I never thought of it that way.', '2023-02-23 17:17:46'),
-- (2, 3, 'Good post. I look forward to more from you.', '2023-01-31 18:26:55'),
-- (3, 1, 'Thanks for sharing your thoughts. I enjoyed reading this.', '2023-05-15 20:30:04');


-- CREATE VIEW latest_comments AS
--     SELECT users.username, posts.title AS "post title", posters.username AS "post author", comments.body, comments.created_at FROM comments
--     INNER JOIN users ON comments.user_id = users.user_id
--     INNER JOIN posts ON comments.post_id = posts.post_id
--     INNER JOIN users as posters ON posts.user_id = posters.user_id
--     ORDER BY comments.created_at DESC
--     LIMIT 5;

-- SELECT * FROM latest_comments;


-- CREATE TABLE follows (
--     follow_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     user_id int NOT NULL REFERENCES users(user_id),
--     following_id int NOT NULL REFERENCES users(user_id),
--     UNIQUE (user_id, following_id)
-- );

-- INSERT INTO follows (user_id, following_id)
-- VALUES (1, 2), (1, 3), (2, 1), (3, 2);

-- SELECT follows.user_id, users.username as "follows" FROM follows
-- JOIN users ON follows.following_id = users.user_id
-- WHERE follows.user_id=1;

-- SELECT * FROM follows;
-- SELECT * FROM users;

--calcur follows avataylor
--calcur follows emma95
--avataylor follows calcur
--emma95 follows avataylor

--avataylor followed by calcur
--avataylor followed by ema95
--calcur folloed by avataylor
--emma95 followed by calcur

-- CREATE VIEW following AS
--     SELECT u1.username AS username, u2.username AS follows
--     FROM follows AS f
--     JOIN users AS u1 ON f.user_id = u1.user_id 
--     JOIN users AS u2 ON f.following_id = u2.user_id;

-- CREATE VIEW followers AS
--     SELECT u1.username AS username, u2.username AS "followed by"
--     FROM follows AS f
--     JOIN users AS u1 ON f.following_id = u1.user_id 
--     JOIN users AS u2 ON f.user_id = u2.user_id;

-- SELECT * FROM following
-- WHERE username='avataylor';


-- CREATE TABLE follows2 (
--     user_id int NOT NULL REFERENCES users(user_id),
--     following_id int NOT NULL REFERENCES users(user_id),
--     PRIMARY KEY (user_id, following_id);
-- )

-- INSERT INTO follows2 (user_id, following_id)
-- VALUES (1, 2), (1, 3), (2, 1), (3, 2);

-- CREATE VIEW followers2 AS
--     SELECT u1.username AS username, u2.username AS "followed by"
--     FROM follows2 AS f
--     JOIN users AS u1 ON f.following_id = u1.user_id 
--     JOIN users AS u2 ON f.user_id = u2.user_id;

-- SELECT * FROM followers2
-- WHERE username='avataylor';

-- SELECT * FROM follows2
-- WHERE user_id = 1 AND following_id = 2;

-- CREATE TABLE follow_notifications (
--     notification_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     follow_id int NOT NULL REFERENCES follows(follow_id),
--     notification_text varchar(255) NOT NULL
-- );

-- INSERT INTO follow_notifications(follow_id, notification_text)
-- VALUES (1, 'oh my goodness look who followed who');

-- CREATE TABLE follow_notifications2 (
--     notification_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     user_id int NOT NULL,
--     following_id int NOT NULL,
--     notification_text varchar(255) NOT NULL,
--     FOREIGN KEY (user_id, following_id) REFERENCES follows2(user_id, following_id)
-- );

-- INSERT INTO follow_notifications2(user_id, following_id, notification_text)
-- VALUES (1, 2, 'oh my goodness look who followed who');
-- CREATE TABLE accounts (
--     account_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     amount decimal(15, 2) NOT NULL
-- );

-- INSERT INTO accounts (amount) VALUES (1000.00), (1000.00);
-- CREATE OR REPLACE PROCEDURE transfer(
--     from_account_id INT,
--     to_account_id INT,
--     transfer_amount NUMERIC
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN

--     UPDATE accounts
--     SET amount = amount - transfer_amount
--     WHERE account_id = from_account_id;

--     UPDATE accounts
--     SET amount = amount + transfer_amount
--     WHERE account_id = to_account_id;

-- END;
-- $$

CALL transfer(1, 2, 200);