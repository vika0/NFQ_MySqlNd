use Books;
select * from Authors;
insert into Authors(name) values("Jonas Biliunas");
insert into Authors(name) values("Liudas Vasaris");
select * from Books;
insert into Books (bookId, authorId, title, year) values("9", "8", "Brisiaus galas", "1905");
insert into Books (bookId, authorId, title, year) values("10", "9", "Altorių Šešėly", "1933");
select `Authors`.name, `Books`.title 
from `Authors`, `Books` 
where `Authors`.authorId=`Books`.authorId;
select author, case when authorId = '8' then 'Liudas Vasaris' when authorId = '9' then 'Jonas Biliunas' end from Books;
select author, count(*) from Books group by author;
select author, count(*) from Books where author!='NULL' group by author;
delete from Authors where authorid=9;
delete from Authors where authorid=10;
delete from Books where author IS NULL;
alter table Books add column gendre  varchar(30);
update Books set gendre='Horror' where authorId='1';
update Books set gendre='Self help' where authorId='2';
update Books set gendre='Comedy' where authorId='4';
update Books set gendre='Romance' where authorId='6';
update Books set gendre='Drama' where authorId='7';
select * from Books order by gendre;
create table More(bookId,authorId);
insert into More (bookId, authorId) values("1","2");
insert into More (bookId, authorId) values("2","7");
insert into Authors (name) values ("Mister X");
insert into Books (authorId, title,  year, author, gendre) values("10", "How to live?", "2016", "Mister X", "Self help");
alter table Books add column MoreAuthors varchar(30);
update Books temp1 inner join More temp2 on temp1.bookId=temp2.bookId set temp1.MoreAuthors = temp1.author;
ALTER TABLE Books CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
insert into Books (authorId, title,  year, author, gendre) values("10", "Lietuvių kalba", "2016", "Kalbininkė rašytoja", "Self help");

