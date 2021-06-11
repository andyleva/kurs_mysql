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


SELECT * FROM mydb.record;