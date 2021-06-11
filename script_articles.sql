SELECT 
	art.id,
	ch.name as chapter,
	art.name as article
FROM mydb.article AS art
LEFT JOIN mydb.chapter ch ON ch.id=art.chapter_id
ORDER BY chapter,article;

SELECT * FROM mydb.article;