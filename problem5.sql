--[5.2 part1]

SELECT DISTINCT p.pname
FROM parts p, suppliers s, catalog c
WHERE p.pid = c.pid AND s.sid = c.sid;

--[5.2 part4]

SELECT DISTINCT 
	p.pname
FROM 
	parts p, suppliers s, catalog c
WHERE 
	s.sname='Acme Widget Suppliers' AND c.pid=p.pid AND c.sid=s.sid AND NOT EXISTS (
		SELECT *
		FROM catalog d, suppliers f
		WHERE p.pid = d.pid AND d.sid = f.sid AND f.sname <> 'Acme Widget Suppliers'
	);


--[5.2 part5]

SELECT DISTINCT c.sid
FROM suppliers s, catalog c
WHERE c.sid = s.sid AND c.cost > ALL (
	SELECT AVG(c1.cost)
	FROM catalog c1, suppliers s1
	WHERE c1.sid = s1.sid
);


--[5.2 part7]

SELECT DISTINCT s.sid
FROM suppliers s, catalog c, parts p
WHERE p.color='Red' AND s.sid = c.sid AND p.pid = c.pid;