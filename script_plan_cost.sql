
SELECT 
	plan_sum
FROM mydb.plan_cost
where sub_articles_id = 1
order by dateplan desc
limit 1;

#UPDATE mydb.plan_cost SET comment = CONCAT('Комментарий ',mydb.plan_cost.id);
#UPDATE mydb.plan_cost SET event_id = round(rand()*(10-1)+1);

Select
sum(plan_sum)
From plan_cost
where event_id=6
group by event_id;

SELECT * FROM mydb.plan_cost;