--What grades are stored in the database?

SELECT
Id,
[Name] AS 'Grade Level'
FROM Grade

--What emotions may be associated with a poem?

SELECT
Id,
[Name] AS 'Emotion'
FROM Emotion

--How many poems are in the database?

SELECT
Count (p.Id) AS PoemCount
FROM Poem p


--Sort authors alphabetically by name. What are the names of the top 76 authors?

SELECT TOP 76
a.Name
FROM Author a
ORDER BY a.Name

--Starting with the above query, add the grade of each of the authors.

SELECT TOP 76
a.Name,
g.Name
FROM Author a
JOIN Grade g on g.Id = a.GradeId
ORDER BY a.Name

--Starting with the above query, add the recorded gender of each of the authors.

SELECT TOP 76
a.Name,
gr.Name,
ge.Name
FROM Author a
JOIN Grade gr on gr.Id = a.GradeId
JOIN Gender ge on ge.Id = a.GradeId
ORDER BY a.Name

--What is the total number of words in all poems in the database?

SELECT
SUM (p.WordCount)  AS 'Total Words'
FROM Poem p

--Which poem has the fewest characters?

SELECT TOP 1
p.CharCount 'Lowest Character Count'
FROM Poem p
ORDER BY p.CharCount

--How many authors are in the third grade?

SELECT
Count (au.Id) AS 'Authors in 3rd Grade'
FROM Author au
JOIN Grade gr on gr.Id = au.GradeId
WHERE gr.Name = '3rd Grade'

--How many authors are in the first, second or third grades?

SELECT
Count (au.Id) AS 'Authors in 1st, 2nd, or 3rd Grade'
FROM Author au
JOIN Grade gr on gr.Id = au.GradeId
WHERE gr.Name = '3rd Grade'
OR gr.Name = '2nd Grade'
OR gr.Name = '1st Grade'

--What is the total number of poems written by fourth graders?

SELECT
COUNT (p.Id) AS 'Poems By 4th Graders'
FROM Poem p
JOIN Author au on au.Id = p.AuthorId
JOIN Grade gr on gr.Id = au.GradeId
WHERE gr.Name = '4th Grade'

--How many poems are there per grade?

SELECT
COUNT (p.Id) AS 'Number of Poems',
gr.Name AS 'Grade'
FROM Poem p
JOIN Author au on au.Id = p.AuthorId
JOIN Grade gr on gr.Id = au.GradeId
GROUP BY (gr.Name)

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)

SELECT
COUNT (au.Id) AS 'Number of Authors',
gr.Name AS 'Grade'
FROM Author au
LEFT JOIN Grade gr on gr.Id = au.GradeId
GROUP BY (gr.Name)
ORDER BY gr.Name

--What is the title of the poem that has the most words?

SELECT TOP 1
p.Title,
p.WordCount
FROM Poem p
ORDER BY p.WordCount DESC

--Which author(s) have the most poems? (Remember authors can have the same name.)

SELECT
au.Id,
au.Name,
COUNT (p.Id) AS 'Number of Poems'
FROM Author au
JOIN Poem p on p.AuthorId = au.Id
GROUP BY au.Id, au.Name
ORDER BY COUNT(p.Id) DESC

--How many poems have an emotion of sadness?
--How many poems are not associated with any emotion?
--Which emotion is associated with the least number of poems?
--Which grade has the largest number of poems with an emotion of joy?
--Which gender has the least number of poems with an emotion of fear?