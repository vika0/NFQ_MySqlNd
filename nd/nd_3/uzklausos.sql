--1. 3 select'ai:

--1.1
--išrenka vieną techniką ir visus jo objektus
--surušiuoja pagal objektų numerius
select kkTechnicianId, objectId  from JobsRegister
where JobsRegister.kkTechnicianId = 224
group by objectId;
--laiku palyginimai:
--	be index	su index
--	0.12		0.63

--1.2
--paima pavadinimus, kurie prasideda su a raide, jei
--JobsRegisterMaterialId lygus materialId ir surušiuoja pagal name
select name from JobsRegister_Materials, Materials
where JobsRegister_Materials.JobsRegisterMaterialId = Materials.materialId
and name LIKE 'a%' group by name;
--laiku palyginimai:
--	be index	su index
--	0.14		0.00

--1.3
--paima pavadinimus, kurie turi raidę R, jei
--JobsRegisterServiceId lygus serviceId ir surušiuoja pagal name
select name, shortName from JobsRegister_Services, Services
where JobsRegister_Services.JobsRegisterServiceId = Services.serviceId
and shortName like '%R%' group by name;
--laiku palyginimai:
--	be index	su index
--	0.09		0.00

--2. 2 update'ai:

--2.1 sum
update Materials m join
(select sum(case when Materials.unit='vnt' then Materials.cost else 0 end) as suma
from JobsRegister_Materials, Materials group by Materials.cost) as a
set m.Materials=a.suma
where JobsRegister_Materials.JobsRegisterMaterialId = Materials.materialId;
--2.2

--3. 2 delete'ai:
--3.1
delete from JobsRegister
where JobsRegister.kkTechnicianId between 100 and 1000
--	be index	su index
--	3.27		1.24
--3.2
delete from JobsRegister_Materials
where JobsRegister_Materials.materialId = 8041
--	be index	su index
--	0.35		0.12

--4 insert
insert into  JobsRegister(kkTechnicianId) values('9999')
--	be index	su index
--	0.10		0.06
