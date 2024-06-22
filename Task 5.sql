use task3;
CREATE TABLE hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE submissions (
    submission_id INT PRIMARY KEY,
    hacker_id INT,
    submission_date DATE,
    FOREIGN KEY (hacker_id) REFERENCES hackers(hacker_id)
);
INSERT INTO hackers (hacker_id, name) VALUES
(1, 'Sumit'),
(2, 'Anjali'),
(3, 'Yashi');

INSERT INTO submissions (submission_id, hacker_id, submission_date) VALUES
(101, 1, '2016-03-01'),
(102, 2, '2016-03-01'),
(103, 3, '2016-03-01'),
(104, 1, '2016-03-01'),
(105, 2, '2016-03-02'),
(106, 3, '2016-03-02'),
(107, 1, '2016-03-02'),
(108, 2, '2016-03-03'),
(109, 3, '2016-03-03'),
(110, 1, '2016-03-03');

SELECT 
    submission_date AS date,
    COUNT(DISTINCT hacker_id) AS unique_hackers,
    hacker_id AS hacker_with_max_submissions,
    name AS hacker_name,
    max_submissions
FROM (
    SELECT 
        submission_date,
        hacker_id,
        name,
        COUNT(*) AS max_submissions
    FROM submissions
    JOIN hackers USING (hacker_id)
    WHERE submission_date BETWEEN '2016-03-01' AND '2016-03-15'
    GROUP BY submission_date, hacker_id
) AS sub_counts
JOIN (
    SELECT 
        submission_date,
        MAX(max_submissions) AS max_submissions
    FROM (
        SELECT 
            submission_date,
            hacker_id,
            COUNT(*) AS max_submissions
        FROM submissions
        WHERE submission_date BETWEEN '2016-03-01' AND '2016-03-15'
        GROUP BY submission_date, hacker_id
    ) AS max_counts
    GROUP BY submission_date
) AS max_submissions_per_day
ON sub_counts.submission_date = max_submissions_per_day.submission_date
AND sub_counts.max_submissions = max_submissions_per_day.max_submissions
ORDER BY date;

