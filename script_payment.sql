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

SELECT * FROM mydb.payment;