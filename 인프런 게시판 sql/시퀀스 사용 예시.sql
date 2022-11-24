SELECT * FROM my_web_dev_study.mvc_board;

-- 시퀀스 생성
-- 엄밀하게 따지면 sequences 테이블에 name값이 mvc_board이고, currval은 0인 데이터 하나를 추가(레코드 추가)
call create_sequence('mvc_board');

call create_sequence('system');

insert into mvc_board(bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) values 
(nextval('mvc_board'), 'name','title','contents',0, currval('mvc_board'),0,0);

select * from (select A.* ,Rownum Rnum from (select *from board order by ref desc ,re_stop asc)A) 
where Rnum >= ? and Rnum <= ?

select * from (select A.*, @ROWNUM:=@ROWNUM+1 AS rowNum FROM 
(selct * from board order by ref desc, re_step asc) A ) where @ROWNUM > 1 and @ROWNUM <= 10)

SELECT * FROM ( SELECT A.*, @rownum:=@rownum + 1 rownum FROM (SELECT @rownum:=0) r , 
board A ORDER BY ref DESC, re_stop ASC) A ) WHERE @rownum > 1 AND @rownum <= 10) 

SELECT * FROM (SELECT T.*, @rownum:=@rownum+1 rownum 
FROM (SELECT @rownum:=0) r, (select *from board order by ref desc ,re_step ASC) T) A WHERE rownum > 1 AND rownum <= 10;

