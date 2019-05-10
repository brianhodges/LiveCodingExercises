-- FYI - Used LOWER() in multiple queries (Figured it was best practice to not trust casing)

-- 1) List all of the movies ordered alphabetically

SELECT * 
FROM movies m
ORDER BY m.title

-- 2) List the three oldest people from oldest to youngest.

SELECT * 
FROM people p
ORDER BY p.birthdate
LIMIT 3

-- 3) List all of the people who have directed a movie.

SELECT DISTINCT p.*
FROM people p
INNER JOIN mtm_credits mc ON p.Id = mc.person_id
INNER JOIN roles r ON mc.role_id = r.id
WHERE LOWER(r.role) = LOWER('Director')

-- 4) Which director has directed the most movies in our database?

SELECT p.*,
       (
        SELECT COUNT(*)
        FROM mtm_credits mc
        INNER JOIN roles r ON mc.role_id = r.id
        WHERE LOWER(r.role) = LOWER('Director')
          AND person_id = p.id
       ) As 'movie_count'
FROM people p
ORDER BY movie_count DESC
LIMIT 1

-- 5) Which people are both directors and actors?

SELECT DISTINCT p.*
FROM people p
INNER JOIN mtm_credits mc ON p.Id = mc.person_id
WHERE mc.person_id IN (SELECT person_id
                    FROM mtm_credits mc
                    INNER JOIN roles r ON mc.role_id = r.id
                    WHERE r.role = 'Director')
  AND mc.person_id IN
                   (SELECT person_id
                    FROM mtm_credits mc
                    INNER JOIN roles r ON mc.role_id = r.id
                    WHERE r.role = 'Actor')

-- 6) List all of the people who have worked with Ben Affleck.

SELECT p.* 
FROM people p 
INNER JOIN mtm_credits mc ON mc.person_id = p.id 
INNER JOIN movies m ON mc.movie_id = m.id 
WHERE m.id IN (
  SELECT movie_id 
  FROM mtm_credits 
  WHERE person_id IN 
    (SELECT id 
     FROM people 
     WHERE LOWER(name)  = ('Ben Affleck')) 
) AND LOWER(p.name) != ('Ben Affleck')
