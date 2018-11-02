--CS 630 hw 2 Solutions: Problem 4.3 of R&G
--Jinghui Zhou  (student name)
--start up script on topcat or pe07
--connect to dbs3 using sqlplus
--use "set echo on", then run this by "@problem4.sql" 
--exit from sqlplus, then exit again to finish typescript
--"mv typescript problem4.txt" to rename it for delivery
-- Note: all-caps for SQL keywords is not needed
-- But we need to capitalize color names in table parts to match data
--[4.3 part1] Find the names of suppliers who supply some red part.
SELECT DISTINCT s.sname
FROM suppliers s, parts p, catalog c
WHERE p.color='Red' AND c.pid=p.pid AND c.sid=s.sid;

--[4.3 part2]

SELECT DISTINCT s.sid
FROM suppliers s, parts p, catalog c
WHERE p.color='Red' OR p.color='Green' AND c.pid=p.pid AND c.sid=s.sid;

--[4.3 part3]

SELECT DISTINCT s.sid
FROM suppliers s, parts p, catalog c
WHERE p.color='Red' OR s.address='221 Packer Ave' AND c.pid=p.pid AND c.sid=s.sid;

--[4.3 part4]

SELECT DISTINCT s.sid
FROM suppliers s, parts p, catalog c
WHERE p.color='Red' AND c.pid=p.pid AND c.sid=s.sid
INTERSECT
SELECT DISTINCT s.sid
FROM suppliers s, parts p, catalog c
WHERE p.color='Green' AND c.pid=p.pid AND c.sid=s.sid;

--[4.3 part9]

SELECT DISTINCT s.sid, c.sid
FROM catalog s, catalog c
WHERE s.pid = c.pid AND s.sid != c.sid AND s.cost > c.cost;

--[4.3 part10]

SELECT DISTINCT c.pid 
FROM catalog c CROSS JOIN catalog s
WHERE c.sid != s.sid AND c.pid = s.pid;

--[4.3 part11]

SELECT DISTINCT c.pid
FROM suppliers s, catalog c
WHERE s.sname='Yosemite Sham' AND c.sid = s.sid
INTERSECT
SELECT DISTINCT MAX(c.cost)
FROM suppliers s, catalog c
WHERE s.sname='Yosemite Sham' AND c.sid = s.sid;