USE SkolaPlivanjaBI_final

select vt.Cijena
from dbo.VrstaTreninga as vt

alter table dbo.VrstaTreninga
alter column Cijena decimal(18,2) not null


select CAST(round(Cijena,2) AS decimal(18,2)) as Cijena
from dbo.VrstaTreninga
            

SELECT PlivacID,Ime +' '+  Prezime as 'Ime i prezime'
FROM dbo.Plivaci

SELECT TrenerID,Ime +' '+  Prezime as 'Ime i prezime'
FROM dbo.Treneri

SELECT 0 AS GradID, 
'Nepoznato' AS 'Grad',
'Nepoznato' AS 'Regija',
'Nepoznato' AS 'Drzava'
UNION
SELECT G.GradID,
G.Naziv,
R.Naziv,
D.Naziv
FROM dbo.Grad as G join dbo.Regija as R on 
G.RegijaID=R.RegijaID join dbo.Drzava as D
on R.DrzavaID=D.DrzavaID

SELECT U.UplataID,
DATEPART(MONTH,U.DatumUplate) AS MjesecUplate,
DATEPART(YEAR,U.DatumUplate) AS GodinaUplate,
VT.Naziv
FROM dbo.Uplata as U join dbo.VrstaTreninga as VT
on U.VrstaTreningaID = VT.VrstaTreningaID


SELECT P.PlivacID,
T.TrenerID,
VT.VrstaTreningaID,
--VT.Cijena,
sum(VT.Cijena) as UkupnaZarada
--DATEPART(MONTH,U.DatumUplate) as Mjesec,
--DATEPART(YEAR,U.DatumUplate) as Godina
from dbo.Plivaci as P join dbo.Uplata as U
on P.PlivacID = U.PlivacID join dbo.Treneri as T
on T.TrenerID=U.TrenerID join  dbo.VrstaTreninga as VT
on U.VrstaTreningaID=VT.VrstaTreningaID 
--where DATEPART(MONTH,U.DatumUplate)=7
GROUP BY P.PlivacID,T.TrenerID,VT.VrstaTreningaID,VT.Cijena

-------------------------------------------------------------------
use SkolaPlivanjaBI_DW_final

alter table dbo.DimPlivac
add PlivacAltKey int not null

delete from dbo.DimTrener

alter table dbo.DimTrener
add TrenerAltKey int not null

drop table dbo.DimLokacija

alter table dbo.FactZarada
drop column LokacijaKey

ALTER TABLE dbo.FactZarada   
DROP CONSTRAINT FK_IznosUplata_Lokacija;   
GO  


select * from dbo.DimLokacija
select * from dbo.DimPlivac
select * from dbo.DimTrener
select * from dbo.DimUplata
select * from dbo.FactZarada