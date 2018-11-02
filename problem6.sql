-- Part A

SELECT DISTINCT s.major, AVG(s.age)
FROM student s, enrolled e 
WHERE s.snum = e.snum AND s.standing <> NULL 
GROUP BY s.major, s.standing;

SELECT s.standing, AVG(s.age)
FROM student s 
WHERE s.standing <> NULL
GROUP BY s.standing;

-- Part B

SELECT DISTINCT c.room, COUNT(f.deptid)
FROM class c, faculty f
WHERE c.fid = f.fid AND c.room IS NOT NULL 
GROUP BY c.room;

-- Part C

SELECT DISTINCT c.room, f.deptid
FROM class c, faculty f
WHERE c.fid = f.fid
HAVING COUNT(f.deptid) >= 2
GROUP BY c.room, f.deptid;