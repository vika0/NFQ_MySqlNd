--PRATYBOS
--1
create database Books;

--2
use Books;
-- Copy Books(3) file

--3
--a) Papildykite autorių lentelę įrašais.
select * from Authors;
insert into Authors(name) values("Jonas Biliunas");
insert into Authors(name) values("Liudas Vasaris");

--b) Papildykite knygų lentelę, įrašais apie knygas, kurių autorius įrašėte prieš tai.
select * from Books;
insert into Books (bookId, authorId, title, year) values("9", "8", "Brisiaus galas", "1905");
insert into Books (bookId, authorId, title, year) values("10", "9", "Altorių Šešėly", "1933");

--c) Išrinkite knygų informaciją prijungdami autorius iš autorių lentelės.
select `Authors`.name, `Books`.title 
from `Authors`, `Books` 
where `Authors`.authorId=`Books`.authorId;


--d) Pakeiskite vienos knygos autorių į kitą.
select author, case when authorId = '8' then 'Liudas Vasaris' when authorId = '9' then 'Jonas Biliunas' end from Books;

--e) Suskaičiuokite kiek knygų kiekvieno autoriaus yra duomenų bazėje (įtraukdami autorius kurie neturi knygų, bei neitraukdami šių autorių).
select author, count(*) from Books group by author;
select author, count(*) from Books where author!='NULL' group by author;

--f) Pašalinkite jūsų suvestus autorius.
delete from Authors where authorid=9;
delete from Authors where authorid=10;

--g) Pašalinkite knygas, kurios neturi autorių.
delete from Books where author IS NULL;

--4
--a) Suskirstyti knygas į žanrus.
alter table Books add column gendre  varchar(30);
update Books set gendre='Horror' where authorId='1';
update Books set gendre='Self help' where authorId='2';
update Books set gendre='Comedy' where authorId='4';
update Books set gendre='Romance' where authorId='6';
update Books set gendre='Drama' where authorId='7';
select * from Books order by gendre;

--b) Knygos gali turėti vieną ir daugiau autorių.
create table More(bookId,authorId);
insert into More (bookId, authorId) values("1","2");
insert into More (bookId, authorId) values("2","7");

--c) Sutvarkyti duomenų bazės duomenis, jei reikia papildykite naujais.
insert into Authors (name) values ("Mister X");
insert into Books (authorId, title,  year, author, gendre) values("10", "How to live?", "2016", "Mister X", "Self help");

--d) Išrinkite visas knygas su jų autoriais. (autorius, jei jų daugiau nei veinas atskirkite kableliais)
alter table Books add column MoreAuthors varchar(30);
update Books temp1 inner join More temp2 on temp1.bookId=temp2.bookId set temp1.MoreAuthors = temp1.author;

--e) Papildykite knygų lentelę, kad galetumėte išsaugoti orginalų knygos pavadinimą. (Pavadinime išsaugokite, lietuviškas raides kaip ą,ė,š ir pan.)
ALTER TABLE Books CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
insert into Books (authorId, title,  year, author, gendre) values("10", "Lietuvių kalba", "2016", "Kalbininkė rašytoja", "Self help");

--5. Paruoškite duomenų bazės kopiją.
-- Exit from mysql
mysqldump -P 3000 -u root -h 127.0.0.1 -proot Books  > dump.sql

