--a) Papildykite autorių lentelę įrašais.
select * from Authors;
insert into Authors(name) values("Jonas Biliunas");
insert into Authors(name) values("Liudas Vasaris");

--b) Papildykite knygų lentelę, įrašais apie knygas, kurių autorius įrašėte prieš tai.
select * from Books;
insert into Books (bookId, authorId, title, year) values("9", "8", "Brisiaus galas", "1905");
insert into Books (bookId, authorId, title, year) values("10", "9", "Altorių Šešėly", "1933");

--c) Išrinkite knygų informaciją prijungdami autorius iš autorių lentelės.
alter table Books add column author varchar(30);
update Books temp1 inner join Authors temp2 on temp1.authorId=temp2.authorid set temp1.author = temp2.name;

--d) Pakeiskite vienos knygos autorių į kitą.
select author, case when authorId = '8' then 'Liudas Vasaris' when authorId = '9' then 'Jonas Biliunas' end from Books;

--e) Suskaičiuokite kiek knygų kiekvieno autoriaus yra duomenų bazėje (įtraukdami autorius kurie neturi knygų, bei neitraukdami šių autorių).
select author, count(*) from Books group by author;
select author, count(*) from Books where author!='NULL' group by author;

--f) Pašalinkite jūsų suvestus autorius.
delete from Books where bookId=9;
delete from Books where bookId=10;

--g) Pašalinkite knygas, kurios neturi autorių.
delete from Books where author IS NULL;
