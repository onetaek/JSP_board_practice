CREATE TABLE board
(
	num INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	writer VARCHAR(20),
	email VARCHAR(50),
	subject VARCHAR(50),
	poassword VARCHAR(10),
	reg_date DATE,
	ref INT(10),
	re_step  INT(10),
	re_level INT(10),
	readcount INT(10),
	content VARCHAR(500)
)




