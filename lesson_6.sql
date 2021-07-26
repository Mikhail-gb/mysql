-- Домашнее задание

-- Задание 2
-- Кто отправил больше всех сообщений пользователю получившему больше всех сообщений))
SELECT from_user_id, to_user_id, count(*) AS count_messages
FROM messages
WHERE to_user_id = (
	SELECT to_user_id
	FROM messages
	GROUP BY to_user_id
	ORDER BY count(*) DESC
	LIMIT 1
)
GROUP BY from_user_id
ORDER BY count_messages DESC
LIMIT 1;


-- Задание 3
WITH users as (SELECT user_id FROM profiles
				ORDER BY birthday
				LIMIT 10)
SELECT count(*) FROM posts_likes
WHERE post_id IN (
		SELECT id FROM posts
		WHERE user_id IN (SELECT * FROM users)
);

-- задание 4
SELECT
	(SELECT gender 
	FROM profiles 
	WHERE profiles.user_id = posts_likes.user_id
	) AS gender,
	count(*) AS count_likes
FROM posts_likes
GROUP BY gender
HAVING gender != 'x'
ORDER BY count_likes DESC
LIMIT 1;

-- задание 5
SELECT
	concat(first_name, ' ', last_name) AS name,
	(SELECT count(*) FROM posts_likes WHERE posts_likes.user_id = users.id) +
	(SELECT count(*) FROM messages WHERE messages.from_user_id = users.id) +
	(SELECT count(*) FROM communities_users WHERE communities_users.user_id = users.id) +
	(SELECT count(*) FROM posts WHERE posts.user_id = users.id) AS count_actions
FROM users
ORDER BY count_actions
LIMIT 1;
