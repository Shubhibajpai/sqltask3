use task3;
CREATE TABLE contests (
    contest_id INT PRIMARY KEY,
    hacker_id INT,
    name VARCHAR(255)
    
);
INSERT INTO contests (contest_id, hacker_id, name) VALUES
(66406, 17973, 'Priti'),
(66556, 79153, 'Anjali'),
(94828, 80275, 'Ravi');

CREATE TABLE colleges (
    college_id INT PRIMARY KEY,
    contest_id INT

);

INSERT INTO colleges (college_id, contest_id) VALUES
(11219, 66406),
(32473, 66556),
(56685, 94828);

CREATE TABLE challenges (
    challenge_id INT PRIMARY KEY,
    
    college_id INT
    
);

INSERT INTO challenges (challenge_id, college_id) VALUES
(18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 56685);
CREATE TABLE view_stats (
    
    challenge_id INT,
    total_views INT,
    total_unique_views INT

);


INSERT INTO view_stats ( challenge_id, total_views, total_unique_views) VALUES
(47127, 26, 19),
( 47127, 15, 14),
( 18765, 43, 10),
(18765,72,13),
(75516,35,17),
(60292,11,10),
(72974,41,15),
(75516,75,11);
CREATE TABLE submission_stats (
	challenge_id INT,
    total_submissions INT,
    total_accepted_submissions INT

);
INSERT INTO submission_stats ( challenge_id, total_submissions, total_accepted_submissions) VALUES
(75516,34,12),
(47127, 27, 10),
(47127, 56, 18),
(75516, 74, 12),
(75516, 83, 8),
(72974, 68, 24),
(72974, 82, 14),
(47127, 28, 11);
SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    COALESCE(SUM(ss.total_submissions), 0) AS total_submissions,
    COALESCE(SUM(vs.total_views), 0) AS total_views,
    COALESCE(SUM(vs.total_unique_views), 0) AS total_unique_views
FROM
    contests c
LEFT JOIN
    challenges ch ON c.contest_id = ch.college_id
LEFT JOIN
    view_stats vs ON ch.challenge_id = vs.challenge_id
LEFT JOIN
    submission_stats ss ON ch.challenge_id = ss.challenge_id
GROUP BY
    c.contest_id,
    c.hacker_id,
    c.name
HAVING
    SUM(ss.total_submissions) > 0
    OR SUM(vs.total_views) > 0
    OR SUM(vs.total_unique_views) > 0
ORDER BY
    c.contest_id;
