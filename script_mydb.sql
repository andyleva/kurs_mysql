SELECT 
	id,
	name,
	date_event,
	(SELECT CONCAT(name,' ',surname) FROM mydb.lecturer WHERE id= mydb.event.lecturer_id) as lecturer,
	(SELECT name FROM mydb.direction WHERE id= mydb.event.direction_ig) as direction,
	comment_event as comment,
	balance(id) as balance
FROM mydb.event
ORDER BY balance;

SELECT 
	id,
	data_payment as data,
	number_paymet as number,
	sum_payment as summa,
    (SELECT name FROM mydb.type_receipt WHERE id=type_receipt_id) as type_receipt
FROM mydb.payment;

SELECT 	
	sum(sum_payment) as summa,
    (SELECT name FROM mydb.type_receipt WHERE id=type_receipt_id) as type_receipt
FROM mydb.payment
GROUP BY type_receipt
ORDER BY summa;

SELECT 
	id,
	data_payment as data,
	number_paymet as number,
	sum_payment as summa,
    (SELECT name FROM mydb.type_receipt WHERE id=type_receipt_id) as type_receipt
FROM mydb.payment
WHERE sum_payment>950000;

SELECT 
	art.id,
	ch.name as chapter,
	art.name as article
FROM mydb.article AS art
LEFT JOIN mydb.chapter ch ON ch.id=art.chapter_id
ORDER BY chapter,article;

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

SELECT 
	plan_sum
FROM mydb.plan_cost
where sub_articles_id = 1
order by dateplan desc
limit 1;

#UPDATE mydb.plan_cost SET comment = CONCAT('Комментарий ',mydb.plan_cost.id);
#UPDATE mydb.plan_cost SET event_id = round(rand()*(10-1)+1);

#explain
SELECT 
	rec.id,
	us.name as user,
	pay.data_payment,
	pay.number_paymet,
    pay.sum_payment,
	fir.name as firma,
	fil.file
FROM mydb.record rec
LEFT JOIN mydb.user us ON us.id = rec.profile_user_id
LEFT JOIN mydb.payment pay ON pay.id = rec.payment_id
LEFT JOIN mydb.firma fir ON fir.id = rec.firma_id
LEFT JOIN mydb.file fil ON fil.id = rec.file_id;

#explain
SELECT 	
    profile_user_id,
    (SELECT name FROM mydb.user WHERE id=record.profile_user_id) as user,
    (SELECT data_payment FROM mydb.payment WHERE id=record.payment_id) as data_paymet,
    (SELECT number_paymet FROM mydb.payment WHERE id=record.payment_id) as number_payment,
    (SELECT sum_payment FROM mydb.payment WHERE id=record.payment_id) as sum_paymet,
    (SELECT name FROM mydb.firma WHERE id=record.firma_id) as firma,
    (SELECT file FROM mydb.file WHERE id=record.file_id) as file    
FROM mydb.record;

#explain
SELECT 	
    profile_user_id,
    (SELECT name FROM mydb.user WHERE id=record.profile_user_id) as user,
    CONCAT('N ', (SELECT number_paymet FROM mydb.payment WHERE id=record.payment_id), ' от ',(SELECT data_payment FROM mydb.payment WHERE id=record.payment_id), ' на сумму: ',  (SELECT sum_payment FROM mydb.payment WHERE id=record.payment_id)) as data_paymet,    
    (SELECT name FROM mydb.firma WHERE id=record.firma_id) as firma,
    (SELECT file FROM mydb.file WHERE id=record.file_id) as file    
FROM mydb.record;


#explain
SELECT 	
    profile_user_id,
    (SELECT name FROM mydb.user WHERE id=record.profile_user_id) as user,       
    (SELECT name FROM mydb.firma WHERE id=record.firma_id) as firma,
    (SELECT file FROM mydb.file WHERE id=record.file_id) as file,
    CONCAT('N ', pay.number_paymet, ' от ', pay.data_payment, ' на сумму ', pay.sum_payment) as Payment
FROM mydb.record
LEFT JOIN  mydb.payment pay ON pay.id=record.payment_id;

SELECT 
    fc.id,
    fc.summa,
    sa_1.name AS sub_articles_receipt,
    er_1.name AS name_event_receipt,
    fc.comment,
    sa_2.name AS sub_article_charge,
    er_2.name AS name_event_charge
FROM mydb.fact_cost AS fc
    LEFT JOIN mydb.sub_articles sa_1 ON fc.sub_articles_id_receipt = sa_1.id
    LEFT JOIN mydb.sub_articles sa_2 ON fc.sub_articles_id_charge = sa_2.id
    LEFT JOIN mydb.event er_1 ON fc.event_id_receipt = er_1.id
    LEFT JOIN mydb.event er_2 ON fc.event_id_charge = er_2.id
LIMIT 10;

#наполнение данными
#UPDATE mydb.fact_cost SET sub_articles_id_charge = round(rand()*(15-1)+1);
#UPDATE mydb.fact_cost SET event_id_receipt = round(rand()*(10-1)+1);

# с нарастающим итогом оборот по приходу
SET @row_number1=0;
SET @row_sum=0;
SELECT 
	(@row_number1:=@row_number1+1) as rows_number,
    fc.id,
	fc.summa,    
    (@row_sum:=@row_sum+fc.summa) as turnover_receipt, #оборот по приходу
    fc.articles_receipt,
    fc.event_receipt
  FROM (
	Select 
    id,
    summa,
    (SELECT name FROM mydb.sub_articles WHERE id=sub_articles_id_receipt) as articles_receipt,
    (SELECT name FROM mydb.event WHERE id=event_id_receipt) as event_receipt
    from mydb.fact_cost
	Where event_id_receipt=3
	Order by event_receipt, articles_receipt) as fc;
	
# с нарастающим итогом оборот по расходу
SET @row_number1=0;
SET @row_sum=0;
SELECT 
	(@row_number1:=@row_number1+1) as rows_number,
    fc.id,
	-fc.summa,    
    (@row_sum:=@row_sum-fc.summa) as turnover_charge, #оборот по расходу    
    fc.articles_charge,
    fc.event_charge
  FROM (
	Select 
    id,
    summa,
    (SELECT name FROM mydb.sub_articles WHERE id=sub_articles_id_charge) as articles_charge,
    (SELECT name FROM mydb.event WHERE id=event_id_charge) as event_charge
    from mydb.fact_cost
	Where event_id_charge=3
	Order by event_charge, articles_charge) as fc;

#расчет итога по мероприятию вариант 1
Select
	ev.event,
	sum(summa_receipt) as turnover_receipt,
    sum(summa_charge) as turnover_charge,	
    sum(balance) as balance
From (
	Select		
		(SELECT name FROM mydb.event WHERE id=event_id_charge) as event,
		-summa AS summa_charge,
		0 as summa_receipt,
        -summa as balance
	from mydb.fact_cost
	UNION 
	Select		
		(SELECT name FROM mydb.event WHERE id=event_id_receipt) as event,
		0 AS summa_charge,
		summa as summa_receipt,
        summa as balance
	from mydb.fact_cost) as ev
group by event
order by event;

#вариант 2
Select
	ev.id,
    (select name from mydb.direction dr where dr.id=ev.direction_ig group by ev.id) as direction,
	ev.name,    
    (select sum(summa) from mydb.fact_cost fc where fc.event_id_receipt=ev.id group by ev.id) as summa_receipt,
    (select -sum(summa) from mydb.fact_cost fc where fc.event_id_charge=ev.id group by ev.id) as summa_charge,
	((select sum(summa) from mydb.fact_cost fc where fc.event_id_receipt=ev.id group by ev.id) + (select -sum(summa) from mydb.fact_cost fc where fc.event_id_charge=ev.id group by ev.id)) as balance
from mydb.event ev
order by balance;
