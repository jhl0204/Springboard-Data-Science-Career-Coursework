
/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

SELECT * 
FROM Facilities
WHERE membercost = 0
LIMIT 0 , 30

Answer: 
Badminton Court
Table Tennis
Snooker Table
Pool Table

/* Q2: How many facilities do not charge a fee to members? */

SELECT COUNT( * ) 
FROM Facilities
WHERE membercost = 0
LIMIT 0 , 30

Answer: 4 facilities


/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT sub.facid, sub.name as facility_name, sub.membercost as member_cost, sub.monthlymaintenance as monthly_maintenance

FROM (SELECT * 
	  FROM `Facilities` 
	  WHERE membercost != 0 ) as sub
WHERE sub.membercost < sub.monthlymaintenance * 0.2


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

SELECT * 
FROM Facilities as f
WHERE f.facid IN (1, 5) 


/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

SELECT name as facility_name, 
	   monthlymaintenance as monthly_maintenance, 
       CASE WHEN f.monthlymaintenance < 100 THEN 'cheap'
			WHEN f.monthlymaintenance > 100 THEN 'expensive' END AS	cost_category
FROM Facilities as f


/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

SELECT firstname, surname
FROM Members
WHERE joindate = (SELECT MAX(joindate)
			      FROM Members) 

/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT DISTINCT CONCAT( joined.firstname,  ' ', joined.surname ) AS full_name, joined.fac_name

FROM (
SELECT b.bookid, f.facid, f.name AS fac_name, m.memid, m.firstname, m.surname
FROM Bookings b
LEFT JOIN Facilities f ON b.facid = f.facid
LEFT JOIN Members m ON m.memid = b.memid
WHERE m.memid !=0
) AS joined
WHERE joined.fac_name LIKE "Tennis%" 
ORDER BY 1


/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

SELECT f.name as facility_name, CONCAT(m.firstname, ' ', m.surname) as full_name, 
	   CASE WHEN b.memid = 0 THEN f.guestcost * slots 
			WHEN b.memid != 0 THEN f.membercost * slots END as total_cost
			
FROM Bookings b
LEFT JOIN Facilities f
ON b.facid = f.facid
LEFT JOIN Members m
ON b.memid = m.memid 
WHERE LEFT(b.starttime, 10) = '2012-09-14' AND 
	  CASE WHEN b.memid = 0 THEN f.guestcost * slots 
		   WHEN b.memid != 0 THEN f.membercost * slots END > 30
ORDER BY 3 DESC


/* Q9: This time, produce the same result as in Q8, but using a subquery. */
/* CASE-WHEN statement needs to be in a subquery to be able to access it by its column name
Otherwise, need to write the whole CASE-WHEN statement for in order to do comparisions (WHERE Clause) */

SELECT fac_name, full_name, total_cost
	    
FROM (
SELECT f.name AS fac_name,
	   CONCAT(m.firstname, ' ', m.surname) as full_name,
       CASE WHEN b.memid = 0 THEN f.guestcost * b.slots  
            WHEN b.memid != 0 THEN f.membercost * b.slots END as total_cost 
FROM Bookings b
LEFT JOIN Facilities f ON b.facid = f.facid
LEFT JOIN Members m ON m.memid = b.memid
WHERE LEFT(b.starttime, 10) = '2012-09-14'
) AS joined
WHERE total_cost > 30
ORDER BY 3 DESC



/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT fac_name, SUM(total_cost) as revenue
	    
FROM (
SELECT f.name AS fac_name,
       CASE WHEN b.memid = 0 THEN f.guestcost * b.slots  
            WHEN b.memid != 0 THEN f.membercost * b.slots END as total_cost 
FROM Bookings b
LEFT JOIN Facilities f ON b.facid = f.facid
LEFT JOIN Members m ON m.memid = b.memid
) AS joined
GROUP BY 1
HAVING revenue < 1000 
ORDER BY 2 DESC 

