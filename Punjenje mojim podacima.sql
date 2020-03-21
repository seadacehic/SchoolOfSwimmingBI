use SkolaPlivanjaBI_final

insert into dbo.Drzava(Naziv)
values('BiH'),('Hrvatska'),('Srbija')

select * from dbo.Grad

insert into dbo.Regija(DrzavaID,Naziv)
values(1,'HNK'),(1,'KS'),(1,'TK'),(1,'ZE-DO'),(1,'USK'),(2,'Splitsko-dalmatinska')

insert into dbo.Grad(RegijaID,Naziv)
values(2,'Mostar'),(3,'Sarajevo'),(4,'Tuzla'),(5,'Zenica'),(6,'Bihac'),(7,'Split')

alter table dbo.Grupe
alter column Vrsta nvarchar(50) not null

insert into dbo.Grupe(Naziv,Uzrast)
values ('Aerobik','18 +'),
('Plivaonica – Skola plivanja za neplivace','4 - 6 g'),
('Plivaonica – Skola plivanja za neplivace','7 - 15 g'),
('Plivaonica – Skola plivanja za neplivace','15 + g'),
('Skola plivanja za plivace','6+'),
('Erazmus,pripreme i korigovanje','15+'),
('Aerobik','15+')

alter table dbo.VrstaTreninga
alter column Naziv nvarchar(50) not null

alter table dbo.Bazeni
alter column Opis nvarchar(100) null

alter table dbo.Treneri
alter column Email nvarchar(100) null

insert into dbo.Bazeni(Dimenzije,Opis,GradID)
values
('15x20 m','Bazen Malisani, dubine 2m',1),
('50x20 m','Bazen Klinci, dubine 1,5m',1),
('50x20 m','Olimpijski bazen',1),
('50x100 m','Olimpijski bazen 2',1),
('50x200 m','Olimpijski bazen 3',1),
('10x25 m','Rekreacijski bazen',1),
('20x200 m','Rekreacijski bazen',1)

insert into dbo.VrstaTreninga(Naziv,Cijena)
values ('Grupni trening djeca','65 KM'),
('Grupni trening odrasli','100 KM'),
('Polu-privatni trening','130 KM'),
('Privatni trening','200 KM')

use SkolaPlivanjaBI_final