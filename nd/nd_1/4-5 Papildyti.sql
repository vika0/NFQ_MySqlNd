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
mysqldump -u root -p NFQ > New.sql

