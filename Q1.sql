/*
Q1. Work with the sharing bike dataset: Sharing_Bike.db
*/

/*
 A. (4 pts) Considering the holidays, write a SQL code to calculate the total count of casual users and the
total count of registered users in each holiday of 2012.
 */

/*
 First I look at holidays aspect, if there is any cluster of days.
 */
SELECT dteday, holiday
FROM Calendar
WHERE holiday = 1;

/*
 Because there is no cluster of days, we can make the hypothesis that each day of holiday is a period of holidays.
 Therefore, we can group by day to group by holidays
 */

SELECT bike.dteday,sum(casual) as total_casual, sum(registered) as total_registered
FROM bike
JOIN Calendar C on bike.dteday = C.dteday
WHERE C.holiday = 1
GROUP BY bike.dteday;


/*
B. (4 pts) Considering 24 hours in a day, write a SQL code to calculate the average count of casual users
and the average count of registered users for each hour.
 */
/*
 Display of total number of bikes used divided by the number of days in the database for each hour.
 */
SELECT hr,(sum(casual)/COUNT ( DISTINCT dteday )) as average_total_casual_by_hour,
       (sum(registered)/COUNT ( DISTINCT dteday )) as average_total_registered_by_hour
FROM bike
GROUP BY hr;
/*
C. (4 pts) Output the top 20 dates of the highest total counts of casual users in 2012 with a SQL code.
*/
SELECT dteday, sum(casual) as total
FROM bike
GROUP BY dteday
ORDER BY total DESC
LIMIT 20;
