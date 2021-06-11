select 
	sar.id,    
    ar.chapter,
    ar.article,
    sar.name as sub_article,
    ifnull((SELECT plan_sum FROM mydb.plan_cost where sub_articles_id = sar.id order by dateplan desc limit 1),0) as plan_sum	
from mydb.sub_articles sar
join (
SELECT 
	art.id as id,
	ch.name as chapter,
	art.name as article
FROM mydb.article AS art
LEFT JOIN mydb.chapter ch ON ch.id = art.chapter_id
) ar on ar.id=sar.article_id;

select
	saba.id,
	saba.name as sub_article,    
    (SELECT plan_sum FROM mydb.plan_cost
		where sub_articles_id = saba.id order by dateplan desc limit 1) as plan_sum
from mydb.sub_articles saba;

SELECT * FROM mydb.sub_articles;