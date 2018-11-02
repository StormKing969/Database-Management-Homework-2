--[5.4 part1]

SELECT DISTINCT e.ename, e.age 
FROM emp e, works w, dept d 
WHERE w.did=d.did AND e.eid=w.eid AND d.dname='Software' AND e.eid IN (
      	SELECT w2.eid 
        FROM works w2, dept d2 
        WHERE d2.dname='Hardware' AND w2.did=d2.did
    );

--[5.4 part3]

SELECT DISTINCT e.ename 
FROM emp e, works w, dept d
WHERE e.salary > ALL (
	SELECT MAX(d2.budget)
	FROM dept d2
	WHERE d2.did=d.did
);

--[5.4 part6]

SELECT DISTINCT d.managerid
FROM dept d
GROUP BY d.managerid HAVING SUM(d.budget) > 5000000;