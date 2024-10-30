-- Solution using CASE statement

SELECT CASE WHEN translation IS NULL THEN comment ELSE translation END AS output

FROM comments_and_translations;

-- Solution using a built in function

SELECT COALESCE(translation, comment) AS output

FROM comments_and_translations;
