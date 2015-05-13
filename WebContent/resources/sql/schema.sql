drop database if exists kurierflexdb;
CREATE DATABASE IF NOT EXISTS kurierflexdb;
use kurierflexdb;

CREATE TABLE IF NOT EXISTS uzytkownicy (
idUzytkownik int AUTO_INCREMENT,
imie varchar(30) not null,
nazwisko varchar(45) not null,
adres varchar(100) not null,
kodPocztowy varchar(50) not null,
miasto varchar (50) not null,
nrTelefonu varchar(9) not null,
login varchar(45) not null unique,
haslo varchar(255) not null,
aktywnosc boolean default true,
dataZalozenia datetime,
PRIMARY KEY (idUzytkownik,login)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;


CREATE TABLE IF NOT EXISTS paczka (
idPaczka int AUTO_INCREMENT,
statusZamowienia ENUM('odebrana od nadawcy', 'w sortowni', 'paczka dotarła do terminala', 'przekazana kurierowi', 'doręczona', 'oczekująca'),
wartoscCalkowitaZl  float default null,
gabaryt ENUM('A','B','C') not null,
dataZlozeniaZam datetime not null,
dataDostarczenia datetime,
imieOdbiorcy varchar(30) not null,
nazwiskoOdbiorcy varchar(30) not null,
adresOdbiorcy varchar(30) not null,
kodPocztowyOdbiorcy varchar(30) not null,
miastoOdbiorcy varchar(30) not null,
nrTelefonuOdbiorcy varchar(10) not null,
idKurier int default null,
idUzytkownik int not null,
PRIMARY KEY (idPaczka),
FOREIGN KEY (idKurier) 
        REFERENCES uzytkownicy(idUzytkownik),
FOREIGN KEY (idUzytkownik)
		REFERENCES uzytkownicy(idUzytkownik)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS historiaPaczki(
idHistoria int AUTO_INCREMENT,
status ENUM('odebrana od nadawcy', 'w sortowni', 'paczka dotarła do terminala', 'przekazana kurierowi', 'doręczona', 'oczekująca') not null,
czasZmiany datetime not null,
idPaczka int not null,
PRIMARY KEY (idHistoria),
FOREIGN KEY (idPaczka) 
		REFERENCES paczka(idPaczka)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS `uzytkownik_uprawnienia` ( 
idUzytkownikUprawnienia int AUTO_INCREMENT,
login varchar(45) not null, 
uprawnienie ENUM('ROLE_ADMIN', 'ROLE_USER'),
PRIMARY KEY (idUzytkownikUprawnienia),
FOREIGN KEY (login)
		REFERENCES uzytkownicy(login)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

DELIMITER $$
drop trigger if exists zmiana_statusu$$
create trigger zmiana_statusu after update on paczka
for each row
begin
	if new.statusZamowienia is not null then
		insert into historiaPaczki values (default,new.statusZamowienia,current_timestamp,new.idPaczka);
	end if;
end;$$

DELIMITER $$
drop trigger if exists zmiana_statusu2$$
create trigger zmiana_statusu2 before update on paczka
for each row
begin
	if new.statusZamowienia <> old.statusZamowienia AND new.statusZamowienia <> "doręczona" then
		set new.idKurier = null;
	end if;
end;$$

DELIMITER $$
drop trigger if exists dodawanie_paczki$$
create trigger dodawanie_paczki after insert on paczka
for each row
begin
	insert into historiaPaczki values (default,new.statusZamowienia,current_timestamp,new.idPaczka);
end;$$

