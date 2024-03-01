CREATE TABLE SPECIALIZARI(
ID_SPECIALIZARE INT PRIMARY KEY,
NUME_SPECIALIZARE VARCHAR2(50) NOT NULL unique
);
CREATE TABLE judete
(
ID_JUDET INT PRIMARY KEY,
NUME_JUDET VARCHAR2(50) NOT NULL unique
);
CREATE TABLE orase(
ID_ORAS INT PRIMARY KEY,
ID_JUDET INT NOT NULL,
NUME_ORAS VARCHAR2(50) NOT NULL,
FOREIGN KEY (ID_JUDET) REFERENCES judete (ID_JUDET)
);

CREATE TABLE Strazi(
ID_STRADA INT PRIMARY KEY,
NUME_STRADA VARCHAR2(50) NOT NULL,
ID_ORAS INT NOT NULL,
FOREIGN KEY (ID_ORAS) REFERENCES orase (ID_ORAS)
);
CREATE TABLE SPITALE
(
ID_SPITAL INT PRIMARY KEY,
ID_STRADA INT NOT NULL,
NUME_SPITAL VARCHAR2(100) NOT NULL,
NUMAR_PATURI INT DEFAULT 20,
FOREIGN KEY (ID_STRADA) REFERENCES Strazi(ID_STRADA)
);

CREATE TABLE MEDICI(
ID_MEDIC INT PRIMARY KEY,
ID_SPECIALIZARE INT,
ID_SPITAL INT,
NUME VARCHAR2(50) NOT NULL,
PRENUME VARCHAR2(50) NOT NULL,
SALARIU INT DEFAULT 2500,
DATA_ANGAJARI DATE DEFAULT  SYSDATE,
FOREIGN KEY (ID_SPECIALIZARE) REFERENCES SPECIALIZARI(ID_SPECIALIZARE),
FOREIGN KEY (ID_SPITAL) REFERENCES  SPITALE (ID_SPITAL)
);

CREATE TABLE Domicilii(
ID_DOMICILIU INT PRIMARY KEY,
ID_STRADA INT NOT NULL ,
NUMAR INT not null,
BLOC INT default NULL,
APARTAMENT INT default NULL,
SCARA VARCHAR(1) default NULL,
FOREIGN KEY(ID_STRADA) REFERENCES Strazi(ID_STRADA)
);


CREATE TABLE Joburi
(
    ID_JOB INT PRIMARY KEY,
    NUME_DOMENIU VARCHAR2(100) NOT NULL
);

CREATE TABLE BOLI_SPECIFICE(
    ID_BOALA INT PRIMARY KEY,
    NUME_BOALA VARCHAR2(100) NOT NULL unique,
    OBSERVATII VARCHAR2(100) DEFAULT NULL
);
CREATE TABLE JOB_PREDISPUSI_BOLI(
    ID_BOALA INT,
    ID_JOB INT,
    FOREIGN KEY (ID_BOALA) REFERENCES BOLI_SPECIFICE(ID_BOALA),
    FOREIGN KEY (ID_JOB) REFERENCES Joburi (ID_JOB),
    PRIMARY KEY (ID_JOB,ID_BOALA)
);

CREATE TABLE PACIENTI(
    ID_PACIENT INT PRIMARY KEY,
    ID_DOMICILIU INT NOT NULL,
    ID_JOB INT DEFAULT NULL,
    NUME VARCHAR2(50) NOT NULL ,
    PRENUME VARCHAR2(50) NOT NULL,
    FOREIGN KEY (ID_JOB) REFERENCES Joburi(ID_JOB),
    FOREIGN KEY (ID_DOMICILIU) REFERENCES Domicilii (ID_DOMICILIU)

);

CREATE TABLE TIP_RETETE(
    ID_TIP INT PRIMARY KEY,
    NUMELE_TIPULUI VARCHAR2(50) NOT NULL
);
CREATE TABLE RETETE(
  ID_RETETA INT PRIMARY KEY,
  TIP_RETETA INT,
  DATA_ELIBERARII DATE DEFAULT SYSDATE,
  FOREIGN KEY (TIP_RETETA) REFERENCES TIP_RETETE(ID_TIP)
);
CREATE TABLE MEDICAMENTE(
    ID_MEDICAMENT INT PRIMARY KEY,
    TIP_RETETA INT,
    NUME_MEDICAMENT VARCHAR2(100) NOT NULL,
    FOREIGN KEY (TIP_RETETA) REFERENCES TIP_RETETE(ID_TIP)
);
CREATE TABLE RETETA_CONTINE_MEDICAMENTE(
    ID_MEDICAMENT INT,
    ID_RETETA INT,
    FOREIGN KEY (ID_MEDICAMENT) REFERENCES MEDICAMENTE(ID_MEDICAMENT),
    FOREIGN KEY (ID_RETETA) REFERENCES RETETE(ID_RETETA),
    PRIMARY KEY (ID_RETETA,ID_MEDICAMENT)
);
CREATE TABLE ISTORIC_PACIENTI(
    ID_ISTORIC INT PRIMARY KEY,
    ID_PACIENT INT NOT NULL ,
    ID_MEDIC INT NOT NULL ,
    ID_RETETA INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_PACIENT) REFERENCES PACIENTI(ID_PACIENT),
    FOREIGN KEY (ID_MEDIC) REFERENCES  MEDICI(ID_MEDIC),
    FOREIGN KEY (ID_RETETA) REFERENCES RETETE(ID_RETETA)
);
create or replace type Lista as varray(20) of number(2);
alter table RETETE
add Lista_Medicamente Lista;



select * from judete;
create sequence  seq_istoric
start with 1
increment by 1;

insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Alba');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Arad');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Arges');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Bacau');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Bihor');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Bistrita-Nasaud');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Botosani');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Brasov');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Braila');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Bucuresti');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Buzau');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Caras-Severin');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Calarasi');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Cluj');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Constanta');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Covasna');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Dambovita');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Dolj');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Galati');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Giurgiu');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Gorj');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Harghita');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Hunedoara');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Ialomita');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Iasi');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Ilfov');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Maramures');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Mehedinti');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Mures');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Neamt');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Olt');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Prahova');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Satu Mare');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Salaj');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Sibiu');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Suceava');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Teleorman');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Timis');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Tulcea');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Vaslui');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Valcea');
insert into judete(id_judet, nume_judet)VALUES (seq_judet.nextval, 'Vrancea');
COMMIT ;
select * from judete;




insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Strada Stefan cel Mare'); -- Bucuresti si Vaslui, Braila
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Soseaua Mihai Bravu'); -- Bucuresti
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Strada Hrisovului'); -- Bucuresti
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Strada Exercitiu'); -- Pitesti
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Strada Nicolae Iorga'); -- Pitesti, Bucuresti, Bacau
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Strada Mihail Kogalniceanu'); -- Vaslui,Arad
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Strada Grivitei'); -- Bucuresti, Braila
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Strada Titu Maiorescu'); -- Voluntari
insert into Strazi(id_strada, nume_strada) values (seq_strada.nextval,'Bulevardul Incoronarii'); -- Alba Iulia

DROP TABLE judete  cascade constraints;
DROP TABLE SPECIALIZARI cascade constraints;
DROP TABLE orase  cascade constraints;
DROP TABLE Strazi cascade constraints;
DROP TABLE STRADA_IN_ORAS cascade constraints;
DROP TABLE SPITALE cascade constraints;
DROP TABLE MEDICI cascade constraints;
DROP TABLE Domicilii cascade constraints;
DROP TABLE Joburi cascade constraints;
DROP TABLE BOLI_SPECIFICE cascade constraints;
DROP TABLE JOB_PREDISPUSI_BOLI cascade constraints;
DROP TABLE PACIENTI cascade constraints;
DROP TABLE TIP_RETETE cascade constraints;
DROP TABLE RETETE cascade constraints;
DROP TABLE MEDICAMENTE cascade constraints;
DROP TABLE RETETA_CONTINE_MEDICAMENTE cascade constraints;
DROP TABLE ISTORIC_PACIENTI cascade constraints;

INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Arges'), 'Pitesti');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Alba'), 'Alba Iulia');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Bacau'), 'Bacau');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Arad'), 'Arad');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Bihor'), 'Oradea');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Botosani'), 'Botosani');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Bistrita-Nasaud'), 'Bistrita');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Braila'), 'Braila');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Brasov'), 'Brasov');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Satu Mare'), 'Satu Mare');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Caras-Severin'), 'Resita');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Calarasi'), 'Calarasi');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Prahova'), 'Ploiesti');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Cluj'), 'Cluj-Napoca');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Bucuresti'), 'Bucuresti');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Constanta'), 'Constanta');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Buzau'), 'Buzau');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Dambovita'), 'Targoviste');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Covasna'), 'Sfantu Gheorghe');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Dolj'), 'Craiova');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Gorj'), 'Targu Jiu');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Harghita'), 'Miercurea Ciuc');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Hunedoara'), 'Deva');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Ialomita'), 'Slobozia');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Iasi'), 'Iasi');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Ilfov'), 'Voluntari');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Maramures'), 'Baia Mare');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Mehedinti'), 'Drobeta-Turnu Severin');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Mures'), 'Targu Mures');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Neamt'), 'Piatra Neamt');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Olt'), 'Slatina');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Salaj'), 'Zalau');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Sibiu'), 'Sibiu');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Valcea'), 'Ramnicu Valcea');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Vrancea'), 'Focsani');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Suceava'), 'Suceava');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Teleorman'), 'Alexandria');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Timis'), 'Timisoara');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Tulcea'), 'Tulcea');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Vaslui'), 'Vaslui');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Galati'), 'Galati');
INSERT INTO orase (ID_ORAS,ID_JUDET, nume_oras) VALUES (seq_oras.nextval,(SELECT ID_JUDET FROM judete WHERE nume_judet = 'Giurgiu'), 'Giurgiu');
Commit;
select * from orase;
delete orase;



-- Arad
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Arad'), 'Bulevardul Revoluției');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Arad'), 'Strada Vasile Goldis');

-- Arges
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Pitesti'), 'Bulevardul Nicolae Balcescu');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Pitesti'), 'Strada Alexandru Odobescu');

-- Alba Iulia
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Alba Iulia'), 'Bulevardul Regele Ferdinand');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Alba Iulia'), 'Strada Avram Iancu');

-- Bacau
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bacau'), 'Bulevardul Unirii');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bacau'), 'Strada Mihai Eminescu');

-- Bistrita-Nasaud
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bistrita'), 'Bulevardul Decebal');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bistrita'), 'Strada Liviu Rebreanu');

-- Bihor
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Oradea'), 'Bulevardul Dacia');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Oradea'), 'Strada Republicii');

-- Botosani
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Botosani'), 'Bulevardul Mihai Eminescu');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Botosani'), 'Strada Stefan cel Mare');

-- Brasov
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Brasov'), 'Bulevardul Eroilor');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Brasov'), 'Strada Republicii');


-- Buzau
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Buzau'), 'Bulevardul Independentei');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Buzau'), 'Strada Mihai Viteazu');
-- Braila
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Braila'), 'Bulevardul Dorobantilor');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Braila'), 'Strada Mihail Kogalniceanu');

-- Bucuresti
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bucuresti'), 'Bulevardul Unirii');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bucuresti'), 'Calea Victoriei');

-- Caras-Severin
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Resita'), 'Bulevardul 1 Decembrie');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Resita'), 'Strada Avram Iancu');

-- Calarasi
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Calarasi'), 'Bulevardul Dorobantilor');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Calarasi'), 'Strada 1 Mai');

-- Cluj
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Cluj-Napoca'), 'Bulevardul Eroilor');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Cluj-Napoca'), 'Strada Horea');

-- Constanta
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Constanta'), 'Bulevardul Mamaia');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Constanta'), 'Strada Tomis');


-- Dolj
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Craiova'), 'Bulevardul Carol I');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Craiova'), 'Strada Madona Dudu');

-- Galati
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Galati'), 'Bulevardul Dorobantilor');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Galati'), 'Strada Eroilor');
-- Covasna
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Sfantu Gheorghe'), 'Bulevardul Mihai Viteazu');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Sfantu Gheorghe'), 'Strada Nicolae Balcescu');

-- Dambovita
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Targoviste'), 'Bulevardul Carol I');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Targoviste'), 'Strada Matei Basarab');


-- Giurgiu
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Giurgiu'), 'Bulevardul Unirii');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Giurgiu'), 'Strada Eroilor');


-- Harghita
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Miercurea Ciuc'), 'Bulevardul Harghita');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Miercurea Ciuc'), 'Strada Unirii');
-- Gorj
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Targu Jiu'), 'Bulevardul Ecaterina Teodoroiu');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Targu Jiu'), 'Strada General Magheru');

-- Hunedoara
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Deva'), 'Bulevardul 1 Decembrie');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Deva'), 'Strada Mihai Eminescu');

-- Ialomita
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Slobozia'), 'Bulevardul Independentei');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Slobozia'), 'Strada Mihail Kogalniceanu');

-- Maramures
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Baia Mare'), 'Bulevardul Republicii');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Baia Mare'), 'Strada Mihai Viteazu');

-- Iasi
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Iasi'), 'Bulevardul Stefan cel Mare');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Iasi'), 'Strada Palat');

-- Ilfov
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bucuresti'), 'Bulevardul Pipera');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Bucuresti'), 'Strada Bucuresti');

-- Targu Mures
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Targu Mures'), 'Strada Avram Iancu');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Targu Mures'), 'Strada Unirii');

-- Piatra Neamt
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Piatra Neamt'), 'Bulevardul Decebal');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Piatra Neamt'), 'Strada Stefan cel Mare');

-- Slatina
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Slatina'), 'Bulevardul Republicii');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Slatina'), 'Strada Mihai Viteazu');

-- Ploiesti
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Ploiesti'), 'Bulevardul Independentei');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Ploiesti'), 'Strada Gheorghe Doja');

-- Satu Mare
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Satu Mare'), 'Strada Horea');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Satu Mare'), 'Bulevardul Vasile Lucaciu');
-- Zalau
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Zalau'), 'Bulevardul Mihai Viteazul');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Zalau'), 'Strada Avram Iancu');

-- Sibiu
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Sibiu'), 'Bulevardul Victoriei');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Sibiu'), 'Strada Nicolae Balcescu');

-- Suceava
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Suceava'), 'Bulevardul George Enescu');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Suceava'), 'Strada Stefan cel Mare');

-- Alexandria
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Alexandria'), 'Bulevardul 1 Decembrie');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Alexandria'), 'Strada Alexandru Ioan Cuza');

-- Timisoara
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Timisoara'), 'Bulevardul Revolutiei');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Timisoara'), 'Strada Marasesti');

-- Tulcea
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Tulcea'), 'Bulevardul Republicii');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Tulcea'), 'Strada Isaccei');

-- Vaslui
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Vaslui'), 'Bulevardul Stefan cel Mare');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Vaslui'), 'Strada Cuza Voda');

-- Ramnicu Valcea
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Ramnicu Valcea'), 'Bulevardul General Praporgescu');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Ramnicu Valcea'), 'Strada Calea lui Traian');

-- Focsani
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Focsani'), 'Bulevardul Unirii');
INSERT INTO Strazi (id_strada,id_oras, nume_strada) VALUES (seq_strada.nextval,(SELECT id_oras FROM orase WHERE nume_oras = 'Focsani'), 'Strada Cuza Voda');

Commit;
select * from Strazi;
-- Primele 20 de inserturi
select * from Domicilii;

INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (1, 1, 12, 6, 3, 'B');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (2, 2, 45, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (3, 3, 78, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (4, 4, 9, 11, 15, 'G');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (5, 5, 23, 8, 7, 'I');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (6, 6, 56, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (7, 7, 34, 10, 8, 'E');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (8, 8, 67, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (9, 9, 41, 7, 5, 'C');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (10, 10, 14, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (11, 11, 88, 4, 12, 'G');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (12, 12, 27, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (13, 13, 19, 5, 6, 'D');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (14, 14, 52, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (15, 15, 63, 3, 9, 'B');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (16, 16, 72, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (17, 17, 31, 1, 4, 'F');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (18, 18, 49, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (19, 19, 77, 0, 11, 'E');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (20, 20, 22, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (21, 1, 56, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (22, 2, 14, 1, 2, 'B');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (23, 3, 29, 4, 7, 'E');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (24, 4, 8, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (25, 5, 41, 2, 5, 'C');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (26, 6, 63, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (27, 7, 22, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (28, 8, 48, 3, 9, 'D');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (29, 9, 77, 1, 12, 'B');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (30, 10, 33, 5, 4, 'F');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (31, 11, 19, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (32, 12, 58, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (33, 13, 12, 4, 3, 'E');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (34, 14, 27, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (35, 15, 39, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (36, 16, 18, 2, 7, 'G');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (37, 17, 51, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (38, 18, 32, 1, 4, 'A');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (39, 19, 67, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (40, 20, 44, 3, 8, 'B');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (41, 21, 23, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (42, 22, 56, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (43, 23, 11, 4, 6, 'C');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (44, 24, 28, 1, 2, 'D');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (45, 25, 49, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (46, 26, 17, 3, 5, 'E');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (47, 27, 32, 2, 8, 'F');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (48, 28, 22, 4, 6, 'G');
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (49, 29, 14, NULL, NULL, NULL);
INSERT INTO Domicilii (ID_DOMICILIU, ID_STRADA, NUMAR, BLOC, APARTAMENT, SCARA) VALUES (50, 30, 37, 1, 3, 'A');

Commit;
select * from Domicilii;

select Strazi.ID_STRADA,Strazi.NUME_STRADA,o.NUME_ORAS from Strazi
left join orase O on Strazi.ID_ORAS = O.ID_ORAS
where o.NUME_ORAS like 'Bucuresti';

INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (1, 55, 'Spitalul Municipal Targu Mures', 150);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (2, 58, 'Spitalul Judetean Piatra Neamt', 200);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (3, 60, 'Spitalul Municipal Slatina', 180);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (4, 62, 'Spitalul de Urgenta Ploiesti', 250);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (5, 64, 'Spitalul Judetean Satu Mare', 120);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (6, 66, 'Spitalul Municipal Zalau', 100);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (7, 68, 'Spitalul Clinic Judetean de Urgenta Sibiu', 300);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (8, 70, 'Spitalul Judetean Suceava', 180);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (9, 72, 'Spitalul Judetean Alexandria', 150);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (10, 74, 'Spitalul Clinic Judetean de Urgenta Timisoara', 350);
INSERT INTO SPITALE (ID_SPITAL, ID_STRADA, NUME_SPITAL, NUMAR_PATURI) VALUES (11, 53, 'Spitalul Regina Maria', 550);
COMMIT;
select * from SPITALE

INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (1, 'Cardiologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (2, 'Neurologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (3, 'Chirurgie Generală');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (4, 'Dermatologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (5, 'Gastroenterologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (6, 'Endocrinologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (7, 'Hematologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (8, 'Imunologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (9, 'Nefrologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (10, 'Oftalmologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (11, 'Ortopedie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (12, 'Oncologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (13, 'Pediatrie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (14, 'Psihiatrie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (15, 'Radiologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (16, 'Reumatologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (17, 'Urologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (18, 'Pneumologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (19, 'Genetica Medicala');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (20, 'Medicina Interna');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (21, 'Medicina de Familie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (22, 'Chirurgie Cardiovasculara');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (23, 'Chirurgie Plastica');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (24, 'Neonatologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (25, 'Geriatrie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (26, 'Otorinolaringologie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (27, 'Medicina de Urgenta');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (28, 'Fiziatrie');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (29, 'Chirurgie Vasculara');
INSERT INTO SPECIALIZARI (ID_SPECIALIZARE, NUME_SPECIALIZARE) VALUES (30, 'Medicina Sportiva');
Commit;
select * from SPECIALIZARI order by ID_SPECIALIZARE;













-- Medic 1
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (103, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Popescu', 'Ion', 3000, TO_DATE('2022-01-15', 'YYYY-MM-DD'));

-- Medic 2
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (2, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Ionescu', 'Ana', 2800, TO_DATE('2022-02-20', 'YYYY-MM-DD'));

-- Medic 3
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (3, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Dumitru', 'Maria', 2600, TO_DATE('2022-03-25', 'YYYY-MM-DD'));

-- Medic 4
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (4, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Georgescu', 'Mihai', 3200, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))));

-- Medic 5
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (5, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Mihai', 'Diana', 3000, TO_DATE('2022-05-15', 'YYYY-MM-DD'));

-- Medic 6
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (6, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Stanescu', 'Gabriel', 2800, TO_DATE('2022-06-20', 'YYYY-MM-DD'));

-- Medic 7
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (7, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Cristea', 'Ana-Maria', 2600, TO_DATE('2022-07-25', 'YYYY-MM-DD'));

-- Medic 8
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (8, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Gheorghe', 'Ioan', 3200, TO_DATE('2022-08-10', 'YYYY-MM-DD'));

-- Medic 9
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (9, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Iancu', 'Elena', 3000, TO_DATE('2022-09-15', 'YYYY-MM-DD'));

-- Medic 10
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (10, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)), 'Vasilescu', 'Andrei', 2800, TO_DATE('2022-10-20', 'YYYY-MM-DD'));

INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(11, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Voicu', 'Roxana', 2905,TO_DATE('2023-03-9', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(12, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Coman', 'Alexandrina', 3652,TO_DATE('2011-06-2', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(13, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dragomir', 'Sorin', 3322,TO_DATE('2015-08-25', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(14, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Florea', 'Robert', 3282,TO_DATE('2004-09-18', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(15, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Bogdan', 'Sorin', 4424,TO_DATE('2005-04-13', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(16, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Frumosu', 'Lavinia', 4094,TO_DATE('2016-06-4', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(17, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Bogdan', 'Silvian', 3333,TO_DATE('2012-09-12', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(18, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Sorin', 'Alexandru', 4529,TO_DATE('2003-07-27', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(19, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Serban', 'George', 3974,TO_DATE('2021-06-17', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(20, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Stefanescu', 'Elena', 4854,TO_DATE('2008-09-7', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(21, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ardelean', 'Ion', 3445,TO_DATE('2015-06-11', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(22, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Tomescu', 'Adela', 3411,TO_DATE('2010-05-26', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(23, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Stanciu', 'Dana', 3843,TO_DATE('2014-07-17', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(24, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ardelean', 'Valentin', 3158,TO_DATE('2022-02-14', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(25, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Radulescu', 'Luminița', 4659,TO_DATE('2005-02-17', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(26, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Sorin', 'Marian', 4817,TO_DATE('2016-01-28', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(27, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Octavian', 'Vasile', 4488,TO_DATE('2006-05-10', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(28, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Badea', 'Loredana', 3054,TO_DATE('2004-08-18', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(29, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Oprea', 'Valeriu', 4585,TO_DATE('2012-01-7', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(30, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Cretu', 'Elena', 3790,TO_DATE('2001-09-5', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(31, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Gheorghita', 'Alina', 3407,TO_DATE('2015-04-22', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(32, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Grosu', 'Teodora', 3449,TO_DATE('2017-01-23', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(33, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Oprea', 'Andrei', 4755,TO_DATE('2002-08-26', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(34, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dobre', 'Alexandrina', 3712,TO_DATE('2012-04-18', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(35, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Sava', 'Răzvan', 3034,TO_DATE('2020-09-24', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(36, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Cretu', 'Sorin', 4438,TO_DATE('2004-09-20', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(37, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Tomescu', 'Radu', 3945,TO_DATE('2016-06-15', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(38, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Nistor', 'Anca', 3981,TO_DATE('2018-02-21', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(39, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ghitescu', 'Marius', 3703,TO_DATE('2012-08-19', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(40, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ardelean', 'Eduard', 4983,TO_DATE('2021-07-19', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(41, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Lucian', 'Octavian', 4889,TO_DATE('2015-05-8', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(42, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Valentin', 'Elena', 3779,TO_DATE('2021-04-1', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(43, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Aurelian', 'Elena', 3454,TO_DATE('2018-07-27', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(44, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ghitescu', 'Alexandra', 3975,TO_DATE('2006-07-1', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(45, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ghitescu', 'Radu', 4478,TO_DATE('2014-03-4', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(46, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Burlacu', 'Marian', 4078,TO_DATE('2005-05-22', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(47, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Victor', 'Tudor', 2806,TO_DATE('2018-02-17', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(48, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dima', 'Monica', 4888,TO_DATE('2011-02-19', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(49, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Cretu', 'Alex', 4331,TO_DATE('2021-01-27', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(50, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Popescu', 'Daniela', 3376,TO_DATE('2016-03-23', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(51, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Stanciu', 'Paul', 3838,TO_DATE('2023-06-22', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(52, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ionita', 'Claudiu', 3207,TO_DATE('2010-07-19', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(53, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Sorin', 'Daniela', 3603,TO_DATE('2023-07-26', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(54, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Tanase', 'Bianca', 2830,TO_DATE('2013-02-20', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(55, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Florin', 'Lavinia', 3106,TO_DATE('2023-02-3', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(56, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Gheorghita', 'Emilian', 3424,TO_DATE('2017-03-5', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(57, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Oprea', 'Elena', 3302,TO_DATE('2021-02-14', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(58, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Negreanu', 'Elena', 4028,TO_DATE('2003-09-10', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(59, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Bogdan', 'Bogdan', 4342,TO_DATE('2015-02-17', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(60, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Iliescu', 'Nicolae', 3868,TO_DATE('2006-06-19', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(61, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Florea', 'Daniela', 4229,TO_DATE('2012-01-19', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(62, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Tomescu', 'Ema', 4473,TO_DATE('2014-01-23', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(63, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Eugen', 'Luminița', 3647,TO_DATE('2019-09-20', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(64, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Grosu', 'Alina', 4422,TO_DATE('2009-04-28', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(65, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Balanescu', 'Monica', 4190,TO_DATE('2023-02-16', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(66, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Octavian', 'Florin', 3999,TO_DATE('2021-03-9', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(67, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ghitescu', 'Răzvan', 3359,TO_DATE('2005-01-9', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(68, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Nistor', 'Simona', 3864,TO_DATE('2021-05-14', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(69, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Serban', 'Elena', 3378,TO_DATE('2010-03-20', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(70, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dima', 'Ionel', 2840,TO_DATE('2015-06-14', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(71, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ionita', 'Loredana', 4796,TO_DATE('2011-04-25', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(72, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dumitrache', 'Diana', 3401,TO_DATE('2023-08-2', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(73, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Chiriac', 'Bogdan', 2937,TO_DATE('2000-09-28', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(74, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Florin', 'Andrei', 3731,TO_DATE('2019-09-11', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(75, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dobre', 'Sorin', 4749,TO_DATE('2006-01-12', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(76, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Oprea', 'Teodora', 4581,TO_DATE('2010-07-28', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(77, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Radu', 'Elena', 3035,TO_DATE('2011-05-25', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(78, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Horia', 'Dumitru', 3801,TO_DATE('2022-06-18', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(79, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Rosu', 'Victor', 4837,TO_DATE('2009-02-25', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(80, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Diaconu', 'Ștefan', 2991,TO_DATE('2001-01-6', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(81, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Hagi', 'Elena', 4061,TO_DATE('2001-08-4', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(82, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Vasiliu', 'Luminița', 3784,TO_DATE('2014-05-16', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(83, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Lucian', 'Silvian', 3120,TO_DATE('2014-08-8', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(84, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Frumosu', 'Octavia', 4328,TO_DATE('2003-09-26', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(85, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Lupu', 'Monica', 3541,TO_DATE('2009-08-20', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(86, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Marian', 'Georgiana', 3089,TO_DATE('2016-01-1', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(87, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Zoltan', 'Dorina', 4002,TO_DATE('2020-08-26', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(88, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Vasiliu', 'Anca', 4889,TO_DATE('2001-07-16', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(89, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ciprian', 'Bogdan', 4682,TO_DATE('2007-02-24', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(90, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Vasilescu', 'Alexandru', 4942,TO_DATE('2007-01-12', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(91, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Ionita', 'Alexandru', 3630,TO_DATE('2003-04-27', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(92, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dumitru', 'Ionel', 2865,TO_DATE('2011-04-26', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(93, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Badea', 'Florin', 4998,TO_DATE('2007-09-24', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(94, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dragos', 'Șerban', 4476,TO_DATE('2004-02-3', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(95, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Aurelian', 'Irina', 4128,TO_DATE('2020-03-17', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(96, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Popescu', 'Octavian', 4590,TO_DATE('2006-05-9', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(97, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Dragomir', 'Sebastian', 3776,TO_DATE('2008-02-20', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(98, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Radu', 'Larisa', 3162,TO_DATE('2020-06-10', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(99, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Badea', 'Anca', 3381,TO_DATE('2004-07-15', 'YYYY-MM-DD'));
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI) VALUES
(100, ROUND(DBMS_RANDOM.VALUE(1, 30)), ROUND(DBMS_RANDOM.VALUE(1, 11)),'Voicu', 'Andrei', 4252,TO_DATE('2015-09-20', 'YYYY-MM-DD'));
COMMIT;

select * from MEDICI;

INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (1, 'Programare');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (2, 'Design Grafic');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (3, 'Marketing Digital');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (4, 'Management');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (5, 'Finante');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (6, 'Inginerie Electrica');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (7, 'Resurse Umane');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (8, 'Vanzari');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (9, 'Logistica');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (10, 'Asistenta Medicala');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (11, 'Educatie');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (12, 'Jurnalism');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (13, 'Consultanta IT');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (14, 'Arhitectura');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (15, 'Servicii Clienti');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (16, 'Turism');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (17, 'Proiectare Mecanica');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (18, 'Arte Plastice');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (19, 'Biotecnologie');
INSERT INTO Joburi (ID_JOB, NUME_DOMENIU) VALUES (20, 'Telecomunicatii');
COmmit;
SELECT * FROM Joburi;


-- Inserarea datelor pentru tabela boli_specifice cu date fictive
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (1, 'Gripa', 'Simptome: febra, tuse, oboseala');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (2, 'Raceala', 'Simptome: nas infundat, stranut, dureri de gat');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (3, 'Diabet', 'Necesita gestionarea nivelului de zahar din sange');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (4, 'Hipertensiune', 'Cresterea presiunii arteriale');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (5, 'Osteoporoza', 'Scaderea densitatii osoase');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (6, 'Alergii', 'Reactii exagerate la alergeni specifici');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (7, 'Astm', 'Dificultati in respiratie');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (8, 'Depresie', 'Stare persistenta de tristete');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (9, 'Anxietate', 'Sentimente exagerate de neliniste');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (10, 'Artrita', 'Inflamarea articulatiilor');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (11, 'Parkinson', 'Tulburari motorii si tremuraturi');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (12, 'Cataracta', 'Opacifierea cristalinului ochiului');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (13, 'Diaree', 'Tranzit intestinal rapid');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (14, 'Anemia', 'Scaderea numarului de globule rosii');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (15, 'Epilepsie', 'Tulburari ale activitatii electrice cerebrale');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (16, 'Obstructie Pulmonara', 'Blocarea fluxului de aer in plamani');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (17, 'Leucemie', 'Proliferare anormala a celulelor albe din sange');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (18, 'Insuficienta Renala', 'Scaderea functiei renale');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (19, 'Migrena', 'Dureri de cap severe');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (20, 'Gastrita', 'Inflamarea mucoasei stomacului');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (21, 'Fibromialgie', 'Dureri musculare si oboseala cronica');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (22, 'Hepatita', 'Inflamarea ficatului');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (23, 'Psoriazis', 'Afecțiune a pielii caracterizată prin descuamare');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (24, 'Tiroidita', 'Inflamarea glandei tiroide');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (25, 'Ulcer', 'Leseuni ale mucoasei digestive');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (26, 'Scleroza Multipla', 'Leziuni ale sistemului nervos central');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (27, 'Pancreatita', 'Inflamarea pancreasului');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (28, 'Sindromul Ovarului Policistic', 'Dezechilibru hormonal la femei');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (29, 'Tromboza Venoasa', 'Formarea cheagurilor de sange in vene');
INSERT INTO boli_specifice (ID_BOALA, NUME_BOALA, OBSERVATII) VALUES (30, 'Tuberculoza', 'Bacterie care afectează plămânii');

Commit;
select * from BOLI_SPECIFICE;

-- Inserarea datelor pentru tabela job_predispusi_boli
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (1, 1);  -- Gripa poate fi asociata cu Jobul de Programator
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (1, 8);  -- Gripa poate fi asociata cu Jobul de Vanzari

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (2, 2);  -- Raceala poate fi asociata cu Jobul de Design Grafic
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (2, 5);  -- Raceala poate fi asociata cu Jobul de Finante

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (3, 6);  -- Diabet poate fi asociat cu Jobul de Inginerie Electrica

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (4, 4);  -- Hipertensiune poate fi asociata cu Jobul de Management

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (5, 10); -- Osteoporoza poate fi asociata cu Jobul de Asistenta Medicala
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (5, 11); -- Osteoporoza poate fi asociata cu Jobul de Educatie

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (6, 2);  -- Alergii pot fi asociate cu Jobul de Design Grafic
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (6, 8);  -- Alergii pot fi asociate cu Jobul de Vanzari

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (7, 5);  -- Astm poate fi asociat cu Jobul de Finante
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (7, 6);  -- Astm poate fi asociat cu Jobul de Inginerie Electrica

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (8, 7);  -- Depresie poate fi asociata cu Jobul de Resurse Umane
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (8, 11); -- Depresie poate fi asociata cu Jobul de Educatie

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (9, 1);  -- Anxietate poate fi asociata cu Jobul de Programator
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (9, 8);  -- Anxietate poate fi asociata cu Jobul de Vanzari

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (10, 10);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (10, 13);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (11, 2);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (11, 5);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (12, 12);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (13, 3);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (13, 9);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (14, 8);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (14, 15);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (15, 13);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (15, 16);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (16, 4);  -- Obstructie Pulmonara poate fi asociata cu Jobul de Management
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (16, 7);  -- Obstructie Pulmonara poate fi asociata cu Jobul de Resurse Umane

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (17, 10); -- Leucemie poate fi asociata cu Jobul de Asistenta Medicala
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (17, 13); -- Leucemie poate fi asociata cu Jobul de Consultanta IT

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (18, 14); -- Insuficienta Renala poate fi asociata cu Jobul de Arhitectura
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (18, 19); -- Insuficienta Renala poate fi asociata cu Jobul de Biotecnologie

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (19, 15); -- Migrena poate fi asociata cu Jobul de Servicii Clienti
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (19, 16); -- Migrena poate fi asociata cu Jobul de Turism

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (20, 11); -- Gastrita poate fi asociata cu Jobul de Educatie
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (20, 14); -- Gastrita poate fi asociata cu Jobul de Arhitectura

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (21, 19); -- Fibromialgie poate fi asociata cu Jobul de Biotecnologie
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (21, 20); -- Fibromialgie poate fi asociata cu Jobul de Telecomunicatii


INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (22, 18); -- Hepatita poate fi asociata cu Jobul de Arte Plastice
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (22, 20); -- Hepatita poate fi asociata cu Jobul de Telecomunicatii

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (23, 14);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (23, 19);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (24, 12);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (24, 17);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (25, 5);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (25, 9);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (26, 1);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (26, 13);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (27, 17);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (27, 18);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (28, 9);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (28, 15);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (29, 14);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (29, 20);

INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (30, 3);
INSERT INTO job_predispusi_boli (ID_BOALA, ID_JOB) VALUES (30, 16);

Commit;
select * from JOB_PREDISPUSI_BOLI;
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (1, 'Reteta simpla');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (2, 'Reteta compusa');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (3, 'Reteta electronica');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (4, 'Reteta urgenta');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (5, 'Reteta copii');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (6, 'Reteta cronica');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (7, 'Reteta pentru afectiuni dermatologice');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (8, 'Reteta pentru afectiuni respiratorii');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (9, 'Reteta pentru afectiuni cardiace');
INSERT INTO TIP_RETETE (ID_TIP, NUMELE_TIPULUI) VALUES (10, 'Reteta pentru afectiuni digestive');
Commit;
select * from TIP_RETETE;
select * from MEDICAMENTE;
select * from Retete;

create or replace type Lista as varray(20) of number(2);
alter table RETETE
add Lista_Medicamente Lista;

select * from Pacienti;
select * from ISTORIC_PACIENTI;
SELECT table_name
FROM user_tables
WHERE num_rows = 0;


select * from MEDICAMENTE;
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (1, 3, 'Paracetamol');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (2, 5, 'Ibuprofen');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (3, 2, 'Amoxicilin');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (4, 8, 'Omeprazol');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (5, 1, 'Aspirină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (6, 4, 'Loratadină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (7, 9, 'Captopril');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (8, 6, 'Metformin');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (9, 7, 'Atorvastatină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (10, 10, 'Escitalopram');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (11, 3, 'Diazepam');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (12, 5, 'Ranitidină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (13, 2, 'Ceftriaxonă');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (14, 8, 'Lansoprazol');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (15, 1, 'Naproxen');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (16, 4, 'Desloratadină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (17, 9, 'Enalapril');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (18, 6, 'Gliclazidă');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (19, 7, 'Simvastatină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (20, 10, 'Fluoxetină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (21, 3, 'Clonazepam');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (22, 5, 'Dexametazonă');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (23, 2, 'Azitromicină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (24, 8, 'Pantoprazol');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (25, 1, 'Ibuprofen');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (26, 4, 'Fexofenadină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (27, 9, 'Ramipril');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (28, 6, 'Glibenclamidă');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (29, 7, 'Rosuvastatină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (30, 10, 'Sertralin');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (31, 3, 'Alprazolam');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (32, 5, 'Diclofenac');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (33, 2, 'Ciprofloxacină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (34, 8, 'Esomeprazol');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (35, 1, 'Acetaminofen');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (36, 4, 'Levocetirizină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (37, 9, 'Losartan');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (38, 6, 'Pioglitazonă');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (39, 7, 'Pravastatină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (40, 10, 'Venlafaxină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (41, 3, 'Zolpidem');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (42, 5, 'Meloxicam');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (43, 2, 'Penicilină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (44, 8, 'Rabeprazol');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (45, 1, 'Celecoxib');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (46, 4, 'Bilastină');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (47, 9, 'Perindopril');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (48, 6, 'Repaglinidă');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (49, 7, 'Ezetimib');
INSERT INTO Medicamente (id_medicament, tip_reteta, nume_medicament)VALUES (50, 10, 'Mirtazapin');
commit;
select * from MEDICAMENTE;

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(1, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15, 25, 35, 45));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(2, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(3, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15, 25));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(4, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15, 25, 35));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(5, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(6, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15, 25, 35, 45));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(7, 1, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(5, 15, 25));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(8, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15, 25, 35));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(9, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES
(10, 1, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(5, 15, 25, 35));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(21, 3, TO_DATE('2021-06-15', 'YYYY-MM-DD'), Lista(1, 11, 21, 31, 41));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(22, 3, TO_DATE('2022-07-22', 'YYYY-MM-DD'), Lista(1, 11));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(23, 3, TO_DATE('2022-01-10', 'YYYY-MM-DD'), Lista(1, 11, 21));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(24, 3, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(1, 11, 21, 31));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(25, 3, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(1));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(26, 3, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(1, 11, 21, 31, 41));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(27, 3, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(1, 11, 21));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(28, 3, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(1, 11, 21, 31));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(29, 3, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(1, 11));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(30, 3, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(1, 11, 21, 31));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(31, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16, 26, 36, 46));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(32, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(33, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16, 26));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(34, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16, 26, 36));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(35, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(36, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16, 26, 36, 46));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(37, 4, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(6, 16, 26));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(38, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16, 26, 36));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(39, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(40, 4, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(6, 16, 26, 36));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(41, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12, 22, 32, 42));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(42, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(43, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12, 22));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(44, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12, 22, 32));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(45, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(46, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12, 22, 32, 42));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(47, 5, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(2, 12, 22));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(48, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12, 22, 32));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(49, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(50, 5, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(2, 12, 22, 32));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(51, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18, 28, 38, 48));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(52, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(53, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18, 28));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(54, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18, 28, 38));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(55, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(56, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18, 28, 38, 48));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(57, 6, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(8, 18, 28));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(58, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18, 28, 38));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(59, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(60, 6, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(8, 18, 28, 38));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(61, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19, 29, 39, 49));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(62, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(63, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19, 29));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(64, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19, 29, 39));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(65, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(66, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19, 29, 39, 49));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(67, 7, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(9, 19, 29));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(68, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19, 29, 39));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(69, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(70, 7, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(9, 19, 29, 39));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(71, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14, 24, 34, 44));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(72, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(73, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14, 24));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(74, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14, 24, 34));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(75, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(76, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14, 24, 34, 44));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(77, 8, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(4, 14, 24));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(78, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14, 24, 34));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(79, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(80, 8, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(4, 14, 24, 34));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(81, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17, 27, 37, 47));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(82, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(83, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17, 27));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(84, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17, 27, 37));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(85, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(86, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17, 27, 37, 47));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(87, 9, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(7, 17, 27));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(88, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17, 27, 37));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(89, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(90, 9, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(7, 17, 27, 37));

INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(91, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20, 30, 40, 50));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(92, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(93, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20, 30));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(94, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20, 30, 40));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(95, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(96, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20, 30, 40, 50));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(97, 10, TO_DATE('2022-02-18', 'YYYY-MM-DD'), Lista(10, 20, 30));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(98, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20, 30, 40));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(99, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20));
INSERT INTO Retete (id_reteta, tip_reteta, data_eliberarii, lista_medicamente)
VALUES(100, 10, (TO_DATE('2021-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE * (TO_DATE('2023-12-02', 'YYYY-MM-DD') - TO_DATE('2021-01-01', 'YYYY-MM-DD'))), Lista(10, 20, 30, 40));

commit;
select * from RETETE;

SELECT table_name
FROM user_tables
WHERE num_rows = 0;


select * from PACIENTI;
alter table pacienti
add Data_Nastere date not null;

select * from Domicilii; -- 1-50
select * from Joburi; --1-20

INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(1, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Popescu', 'Ion', TO_DATE('1990-01-15', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(2, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Ionescu', 'Ana', TO_DATE('1985-05-20', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(3, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Vasilescu', 'Maria', TO_DATE('1992-08-10', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(4, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Dumitrescu', 'George', TO_DATE('1988-03-03', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(5, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Radulescu', 'Elena', TO_DATE('1995-11-25', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(6, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Constantinescu', 'Mihai', TO_DATE('1987-06-18', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(7, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Gheorghe', 'Ana', TO_DATE('1993-02-12', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(8, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Stoica', 'Alexandru', TO_DATE('1984-07-30', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(9, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Munteanu', 'Andreea', TO_DATE('1991-09-08', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(10, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Cristea', 'Cristian', TO_DATE('1989-12-05', 'YYYY-MM-DD'));

INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(11, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Georgescu', 'Andrei', TO_DATE('1994-04-22', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(12, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Dinu', 'Elena', TO_DATE('1986-10-15', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(13, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Ilie', 'Ioana', TO_DATE('1997-07-07', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(14, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Voicu', 'Adrian', TO_DATE('1983-12-30', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(15, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Matei', 'Gabriela', TO_DATE('1990-02-18', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(16, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Antonescu', 'Raluca', TO_DATE('1988-05-12', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(17, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Iancu', 'Vlad', TO_DATE('1995-09-25', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(18, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Rosu', 'Laura', TO_DATE('1987-03-07', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(19, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Florescu', 'Catalin', TO_DATE('1992-11-10', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(20, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Mazilu', 'Simona', TO_DATE('1989-06-02', 'YYYY-MM-DD'));

INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(21, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Radu', 'Ana-Maria', TO_DATE('1993-08-14', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(22, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Stefanescu', 'Razvan', TO_DATE('1988-01-27', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(23, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Pavel', 'Elena', TO_DATE('1991-05-05', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(24, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Costin', 'Andreea', TO_DATE('1985-12-18', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(25, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Dragomir', 'Cristian', TO_DATE('1996-10-03', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(26, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Toma', 'Gabriela', TO_DATE('1987-03-21', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(27, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Gavrila', 'Daniel', TO_DATE('1994-06-28', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(28, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Sava', 'Iulia', TO_DATE('1989-09-10', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(29, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Iovan', 'Mirela', TO_DATE('1992-02-13', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(30, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Vlad', 'Silviu', TO_DATE('1986-11-07', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(31, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Neacsu', 'Roxana', TO_DATE('1992-04-05', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(32, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Mihai', 'Victor', TO_DATE('1987-09-18', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(33, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Ivan', 'Diana', TO_DATE('1995-02-10', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(34, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Florea', 'Adrian', TO_DATE('1990-07-23', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(35, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Voinea', 'Andra', TO_DATE('1984-12-06', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(36, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Albu', 'Catalina', TO_DATE('1993-10-21', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(37, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Coman', 'Ionut', TO_DATE('1988-05-14', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(38, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Vasile', 'Raluca', TO_DATE('1991-08-27', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(39, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Dobre', 'Bogdan', TO_DATE('1986-01-30', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(40, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Nita', 'Larisa', TO_DATE('1994-03-03', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(41, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Popa', 'Iuliana', TO_DATE('1989-06-12', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(42, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Marin', 'Eugen', TO_DATE('1994-11-25', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(43, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Stanciu', 'Mihaela', TO_DATE('1992-02-18', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(44, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Apostol', 'Victor', TO_DATE('1987-09-30', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(45, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Dragan', 'Camelia', TO_DATE('1996-04-03', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(46, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Oprea', 'Sebastian', TO_DATE('1988-08-16', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(47, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Pascu', 'Roxana', TO_DATE('1993-01-19', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(48, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Serban', 'George', TO_DATE('1985-12-22', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(49, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Balan', 'Daniela', TO_DATE('1990-03-07', 'YYYY-MM-DD'));
INSERT INTO Pacienti (id_pacient, id_domiciliu, id_job, nume, prenume, data_nastere)
VALUES(50, CEIL(DBMS_RANDOM.VALUE(1, 50)), CEIL(DBMS_RANDOM.VALUE(1, 20)), 'Dima', 'Valentin', TO_DATE('1986-07-15', 'YYYY-MM-DD'));

select * from PACIENTI;









declare
random number(3);
    type tabel is table of number;
    random_retete tabel;
    begin
    random_retete :=tabel();
    for i in 1..100 loop
    random_retete.extend;
    random_retete(i) := i;
end loop;

    for i in 1..100 loop
    random := round(DBMS_RANDOM.VALUE(1,100));
    while random_retete.EXISTS(random) = false loop
    random := round(DBMS_RANDOM.VALUE(1,100));
        end loop;
    insert into ISTORIC_PACIENTI(id_istoric, id_pacient, id_medic, id_reteta)
        values (i,round(DBMS_RANDOM.VALUE(1,50)),round(DBMS_RANDOM.value(1,100)),random_retete(random));
    random_retete.DELETE(random);
        end loop;
    end;

commit;
select * from ISTORIC_PACIENTI;


select * from TIP_RETETE;



select * from MEDICI;





















select * from USER_TABLES;

ALTER TABLE TIP_RETETE RENAME TO TIP_RETETE;
ALTER TABLE Joburi RENAME TO Joburi;
ALTER TABLE Domicilii RENAME TO Domicilii;
ALTER TABLE SPITALE RENAME TO Spitale;
alter table Strazi rename to Strazi;
alter table orase rename to Orase;
alter table judete rename to Judete;

SELECT * FROM;
-- Definirea pachetului SGBD
commit;



drop function SchimbareDatePacient;
drop type number_list;
create or replace type number_list is varray(40) of number;

drop procedure PACIENTISPITALEINFO;

create or replace package Utility is
    type rec is record (
                              codmedic     number,
                              numecomplet  varchar(60),
                              specializare SPECIALIZARI.NUME_SPECIALIZARE%type,
                              spitalul     SPITALE.NUME_SPITAL%type,
                              judetul      judete.NUME_JUDET%type,
                              numeoras     orase.NUME_ORAS%type,totalpacienti number);
            type tabelaMedici is table of rec;

    procedure AfisareIstoricPacient(codpacient ISTORIC_PACIENTI.ID_PACIENT%type);
        procedure BoliJob(codjob number);

        end Utility;

    create or replace package body Utility is
        procedure AfisareIstoricPacient(codpacient ISTORIC_PACIENTI.ID_PACIENT%type)
    is


    istoric_not_found exception;
    pragma exception_init ( istoric_not_found,-20004);
        ---tipuri de date

        type reteta is record( data_eliberarii date, Med Lista,nume_medic varchar(50),specializare SPECIALIZARI.NUME_SPECIALIZARE%type);
          type raport is table of reteta;
        ---variabile

        Istoric raport;
        begin
            select r2.DATA_ELIBERARII,r2.Lista_Medicamente,M.NUME || ' ' || M.PRENUME,s2.NUME_SPECIALIZARE bulk collect into Istoric from ISTORIC_PACIENTI
                   left join RETETE R2 on ISTORIC_PACIENTI.ID_RETETA = R2.ID_RETETA
                   left join MEDICI M on ISTORIC_PACIENTI.ID_MEDIC = M.ID_MEDIC
                   left join SPECIALIZARI S2 on M.ID_SPECIALIZARE = S2.ID_SPECIALIZARE
                       where ID_PACIENT = codpacient;
           if Istoric.COUNT = 0 then
              raise_application_error(-20004,'Nu exista istoricul pacientului!');
           end if;
            for i in 1..Istoric.COUNT  loop
                DBMS_OUTPUT.PUT_Line('Dr. '||Istoric(i).nume_medic||', Specializare: '|| Istoric(i).specializare);
                DBMS_OUTPUT.PUT_LINE('A eliberat in data:' || Istoric(i).data_eliberarii);
                DBMS_OUTPUT.PUT_LINE('Reteta care cuprinde medicamentele: ');
                for medicamente in (select NUME_MEDICAMENT from MEDICAMENTE where ID_MEDICAMENT in (select * from table ( Istoric(i).Med ))) loop
                    DBMS_OUTPUT.PUT_LINE('- '||medicamente.NUME_MEDICAMENT);
                    end loop;
 DBMS_OUTPUT.PUT_LINE('================================');

                end loop;

        end AfisareIstoricPacient;

         procedure BoliJob(codjob number) is
       cursor boli(idj number)    is (select j.NUME_DOMENIU,bs.NUME_BOALA,bs.OBSERVATII from JOB_PREDISPUSI_BOLI p
        inner join Joburi j on p.ID_JOB = j.ID_JOB
        join BOLI_SPECIFICE BS on BS.ID_BOALA = p.ID_BOALA
        where p.ID_JOB = idj);
     type bolitot is record ( domeniu Joburi.NUME_DOMENIU%type,boala BOLI_SPECIFICE.NUME_BOALA%type,obs BOLI_SPECIFICE.OBSERVATII%type);
    dbo bolitot;
    no_boli exception ;
begin
    open boli(codjob);
        fetch boli into dbo;
        if boli%notfound then
            raise no_boli;
        end if;
        DBMS_OUTPUT.PUT_LINE('DOMENIU :'|| DBO.domeniu);
        loop
            DBMS_OUTPUT.PUT_LINE('Nume boala :'|| DBO.boala);
        DBMS_OUTPUT.PUT_LINE('Observatii :'|| DBO.obs);
         fetch boli into dbo;
            exit when boli%notfound;
        end loop;
exception
when no_boli then
    DBMS_OUTPUT.PUT_LINE('Jobul nu are boli specifice!');
    when others then
    DBMS_OUTPUT.PUT_LINE(sqlerrm);

    end BoliJob;
        end Utility;

create or replace package InactiveMedic is

    type meds is record (
        lastreteta date,
        codmedic Medici.Id_medic%type,
        numecomplet varchar(100)
                         );
        type tabela is table of meds;
procedure afisaremediciinactivi(an date, scadere in number);
    end;
create or replace package body InactiveMedic is
function collectallmedic(an date) return tabela is
    medicii tabela:=tabela();

    begin
        select r.DATA_ELIBERARII,medici.ID_MEDIC,Nume || ' ' || Prenume bulk collect into medicii from MEDICI
            join ISTORIC_PACIENTI IP on MEDICI.ID_MEDIC = IP.ID_MEDIC
            join RETETE r on IP.ID_RETETA = r.ID_RETETA
        where r.DATA_ELIBERARII > an;
        return medicii;
        end collectallmedic;


procedure rasplataactivi(medicia tabela) is
    begin
        for i in 1..medicia.count loop
        update MEDICI set SALARIU = salariu+50
        where ID_MEDIC = medicia(i).codmedic;

            end loop;
        for i in 1..medicia.COUNT loop
            DBMS_OUTPUT.PUT_LINE('Am marit cu 50 de lei salariul dr.'|| medicia(i).numecomplet);
            end loop;
    end rasplataactivi;
function scaredesalar(activi tabela,scadere number) return boolean
    is

    begin
       for i in (select * from Medici where ID_MEDIC in (select codmedic from Table ( activi ))) loop
               update MEDICI set SALARIU = salariu - scadere
           where ID_MEDIC = i.ID_MEDIC;
           end loop;
       return true;
       exception
    when others then
        return false;
        end scaredesalar;
procedure afisaremediciinactivi(an date,scadere in number) is
    mediciactivi tabela;
    begin
        mediciactivi:= collectallmedic(an);
        if scadere is not null  then
           if scaredesalar(mediciactivi,scadere) then
               DBMS_OUTPUT.PUT_LINE('Am scazut salarile medicilor inactivi cu '||scadere);
           end if;
        end if;

        for i in (select * from Medici where ID_MEDIC in (select codmedic from Table ( mediciactivi ))) loop
            DBMS_OUTPUT.PUT_LINE('Dr. '||i.NUME || ' ' || i.PRENUME);
            DBMS_OUTPUT.PUT_LINE('A fost inactiv anul acesta');
            end loop;
        rasplataactivi(mediciactivi);
        exception
        when no_data_found then
        DBMS_OUTPUT.PUT_LINE('Toti medicii au fost inactivi');
        end afisaremediciinactivi;


    end InactiveMedic;

    declare
    stringd varchar2(11):=&an;
        datafinal date;
        begin
        datafinal:=to_date(stringd,'YYYY-MM-DD');
            InactiveMedic.afisaremediciinactivi(datafinal,-10);
        end;
create or replace package SGBD is

    --type number_list is varray(40) of number;
 type hospital is record ( Nume SPITALE.NUME_SPITAL%type,codoras orase.ID_ORAS%type,numeOras orase.NUME_ORAS%type);
        type personale is record (NumeComplet varchar2(60),
         datanastere date,
         domeniu Joburi.NUME_DOMENIU%type,
          cod PACIENTI.ID_PACIENT%type);
---ex 6
procedure Raport_Medical(  data_start in date default null,data_finish in date default null,numespital in varchar2 default null,numecomplet in varchar2 default null);
--ex 7
  procedure PacientiSpitaleInfo(an in date default null);
--ex 8
  function SchimbareDatePacient(NumeComplet varchar2, schimbam in varchar2,codnoujob in number, vitoareaadresa Adresa) return varchar2;
        procedure MediciActivi(anul date);
    end SGBD;
create or replace package body SGBD is
procedure Raport_Medical(
    data_start in date default null,
    data_finish in date default null,
    numespital in varchar2 default null,
    numecomplet in varchar2 default null)
 is

    ---exceptii
    incorect_date exception;
    incorect_name exception;
    incorect_hospital exception ;
    type vector_medicamente is varray(10) of MEDICAMENTE.NUME_MEDICAMENT%type; -- am facut vectorul care o sa contina o lista de medicamente
    type reteta_medicamente_rec is record (nume_reteta TIP_RETETE.NUMELE_TIPULUI%type,
                                            medicamente vector_medicamente
                                          ); -- recordul pentru a retine numele retetei si medicamentele asociatie
    type tabel_imbricat_rmr is table of reteta_medicamente_rec; -- o sa retintem intr-un tabel imbricat pentru ca un medic are mai multe retete emise
    type tabel_indexat_mr is table of tabel_imbricat_rmr index by varchar2(50);
    -- tabelul idexat o sa retine cheia: numele complet al medicului
    -- valoare: tabela cu retetele elibererate de el
    tabel_medic_retete tabel_indexat_mr;
    tabel_recorduri tabel_imbricat_rmr ; -- folosim constructor pentru ca e tabel imbricat
    indexx number(3);
    data_start_p  date;
    data_finish_p  date;

    begin
    if data_finish is null then
        data_finish_p := sysdate;
        else
        data_finish_p := data_finish;
    end if;
    if data_start is null then
        data_start_p:=to_date('1999/01/01','YYYY-MM-DD');
        else
        data_start_p := data_start;
    end if;
    DBMS_OUTPUT.PUT_line(data_finish_p ||' start:'|| data_start_p);
    if data_finish - data_start <= 0 then
        Raise incorect_date;

    DBMS_OUTPUT.PUT_LINE(data_start_p);
    DBMS_OUTPUT.PUT_LINE(data_finish_p);
end if;
    for medic in (
        select m.ID_MEDIC,m.nume,m.prenume from MEDICI m
left join SPITALE s on m.ID_SPITAL = s.ID_SPITAL
where ID_MEDIC in (select ID_MEDIC from ISTORIC_PACIENTI) and (numespital is null or numespital = S.NUME_SPITAL)
            ) loop
        indexx :=1;
        tabel_recorduri := tabel_imbricat_rmr();
        for retete_medicamente in (
            select M.NUME || ' ' || M.PRENUME as Complet, R2.Lista_Medicamente, tr.NUMELE_TIPULUI,R2.DATA_ELIBERARII from ISTORIC_PACIENTI ip
                left join MEDICI M on ip.ID_MEDIC = M.ID_MEDIC
                left join RETETE R2 on ip.ID_RETETA = R2.ID_RETETA
                left join TIP_RETETE tr on r2.TIP_RETETA = tr.ID_TIP
            where (M.NUME = medic.NUME and M.PRENUME = medic.PRENUME) and (r2.DATA_ELIBERARII between data_start_p and data_finish_p)
            ) loop
            tabel_recorduri.extend;
            tabel_recorduri(indexx).nume_reteta := retete_medicamente.NUMELE_TIPULUI;
            tabel_recorduri(indexx).medicamente := vector_medicamente();
            tabel_recorduri(indexx).medicamente.extend(retete_medicamente.Lista_Medicamente.COUNT);
            for i in retete_medicamente.Lista_Medicamente.first.. retete_medicamente.Lista_Medicamente.LAST loop
            select NUME_MEDICAMENT into tabel_recorduri(indexx).medicamente(i) from MEDICAMENTE where ID_MEDICAMENT = retete_medicamente.Lista_Medicamente(i);

                end loop;
                indexx := indexx+1;
                end loop;
            if tabel_recorduri.COUNT > 0 then
            tabel_medic_retete(medic.NUME || ' ' || medic.PRENUME) := tabel_recorduri;
            end if;
            end loop;


  if numecomplet is null then

       if tabel_medic_retete.count = 0 then
          raise no_data_found;
      end if;

    for med in (  select ID_MEDIC,nume ||' '||prenume as NumeComplet from MEDICI
where ID_MEDIC in (select ID_MEDIC from ISTORIC_PACIENTI)
                ) loop
        if tabel_medic_retete.EXISTS(med.NumeComplet) then
          DBMS_OUTPUT.PUT_LINE('| Retetele eliberate de Dr.'||med.NumeComplet||' |');
       for i in tabel_medic_retete(med.NumeComplet).first .. tabel_medic_retete(med.NumeComplet).last loop
             DBMS_OUTPUT.PUT_LINE('===========================');
            DBMS_OUTPUT.PUT_LINE('Tipul Retetei: '||tabel_medic_retete(med.NumeComplet)(i).nume_reteta);
            DBMS_OUTPUT.PUT_LINE('Medicamente elibarate: ');
            for j in tabel_medic_retete(med.NumeComplet)(i).medicamente.first ..tabel_medic_retete(med.NumeComplet)(i).medicamente.last loop
            DBMS_OUTPUT.PUT_LINE('- '||tabel_medic_retete(med.NumeComplet)(i).medicamente(j));
            end loop;
            DBMS_OUTPUT.PUT_LINE('===========================');

                end loop;


        end if;

            end loop;
  else
      if tabel_medic_retete.count = 0 then
          raise no_data_found;
      end if;
        if tabel_medic_retete.EXISTS(numecomplet) = false then
            raise incorect_name;
        end if;
         DBMS_OUTPUT.PUT_LINE('| Retetele eliberate de Dr.'||numecomplet||' |');
            for i in tabel_medic_retete(numecomplet).first .. tabel_medic_retete(numecomplet).last loop
             DBMS_OUTPUT.PUT_LINE('===========================');
            DBMS_OUTPUT.PUT_LINE('Tipul Retetei: '||tabel_medic_retete(numecomplet)(i).nume_reteta);
            DBMS_OUTPUT.PUT_LINE('Medicamente elibarate: ');
            for j in tabel_medic_retete(numecomplet)(i).medicamente.first ..tabel_medic_retete(numecomplet)(i).medicamente.last loop
            DBMS_OUTPUT.PUT_LINE('- '||tabel_medic_retete(numecomplet)(i).medicamente(j));
            end loop;
            DBMS_OUTPUT.PUT_LINE('===========================');

                end loop;

  end if;
exception
    when incorect_date then
    DBMS_OUTPUT.PUT_LINE('Intervalul de date in care cautati rapoarte este incorect!');
    when incorect_name then
    DBMS_OUTPUT.PUT_LINE('Numele medicului pentru care doriti sa socateti raportul este gresit!');
    when NO_DATA_FOUND then
        dbms_output.PUT_LINE('Nu exista o reteta eliberata intre datele respecive sau numele spitalului este gresit!');
    when others then
        DBMS_OUTPUT.PUT_LINE('A aparut o alta eroare, va rugam sa contactati staff-ul: Eroare['||SQLERRM||']');
    end Raport_Medical;
 procedure PacientiSpitaleInfo(
an in date default null
)
is

    --cursoare
    cursor domiciliat is (select id_domiciliu,s.ID_ORAS from Domicilii left join Strazi s on s.ID_STRADA = Domicilii.ID_STRADA);
    cursor pacie(dom Domicilii.ID_DOMICILIU%type) is select NUME || ' ' || PRENUME,Data_Nastere,J.NUME_DOMENIU,ID_PACIENT from Pacienti
        left join Joburi J on PACIENTI.ID_JOB = J.ID_JOB
                                                     where dom = ID_DOMICILIU;
    cursor spitale(istoric number_list, domoras Strazi.ID_ORAS%type) is (select s2.NUME_SPITAL,s3.ID_ORAS from Medici m left join SPITALE s2 on m.ID_SPITAL = s2.ID_SPITAL
                                                               left join Strazi s3 on s3.ID_STRADA = s2.ID_SPITAL
                                            where m.ID_MEDIC in (select * from table ( istoric )) and ID_ORAS != domoras);
    --- variabile
    datepersonale personale;
    spit hospital;
    tabelamedici number_list;
    contor number := 0;
    anul_end date;

            --exceptii
    begin
    if an is not null then
        anul_end := add_months(an,12);
    end if;
    select count(*) into contor from retete where an is null or DATA_ELIBERARII between an and anul_end;
    if contor = 0 then
        raise no_data_found;
    end if;
    for dom in domiciliat loop
        open pacie(dom.ID_DOMICILIU);

        loop
             contor :=0;
            fetch pacie into datepersonale;
            exit when pacie%notfound;
            select ID_MEDIC bulk collect into tabelamedici from ISTORIC_PACIENTI IP left join RETETE R2 on R2.ID_RETETA = IP.ID_RETETA where ID_PACIENT = datepersonale.cod and (an is null or r2.DATA_ELIBERARII between an and anul_end); -- medicii care i-au facut ceva pacientului
            --- obtinem spitale din toata tara la care a fost


            open spitale(tabelamedici,dom.ID_ORAS);
            fetch spitale into spit.Nume,spit.codoras;

            if spitale%found then
                DBMS_OUTPUT.PUT_LINE('Nume Complet: '||datepersonale.NumeComplet);
                DBMS_OUTPUT.PUT_LINE('Data de nastere: '|| datepersonale.datanastere);
                DBMS_OUTPUT.PUT_LINE('Domeniu de lucru: '|| datepersonale.domeniu);
                DBMS_OUTPUT.PUT_LINE('Spitalele la care a fost in afara Orasului: ');
                loop

                    exit when spitale%notfound;
                    contor:= contor+1;
                    select NUME_ORAS into spit.numeOras from orase where ID_ORAS = spit.codoras;
                    DBMS_OUTPUT.PUT_LINE('- '||spit.Nume||', '||spit.numeOras || ';');
                    fetch spitale into spit.Nume,spit.codoras;

                end loop;
                DBMS_OUTPUT.PUT_LINE('Total de plata suplimentar:'||contor*100);
             DBMS_OUTPUT.PUT_LINE('===========================');

            end if;
             close spitale;

        end loop;
        close pacie;

    end loop;
exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('Nu exista pacientii pentru anii respectivi!');
    when others then
        DBMS_OUTPUT.PUT_LINE('Contacteaza administatorul si precizeaza codul de eroare! [,'||sqlcode||', '|| SQLERRM||']');
    end PacientiSpitaleInfo;
    function SchimbareDatePacient
(NumeComplet varchar2, schimbam in varchar2,codnoujob in number, vitoareaadresa Adresa)
return varchar2
   is
   -- exceptii


   incorect_nume_judet exception;
          no_job_specified exception ;
          same_domiciliu exception ;
          no_town_street exception ;
          done_job exception ;


       -- tipuri de date


--variabile
       type informatiidomiciliu is record (
           codpacient PACIENTI.ID_PACIENT%type,
           coddomiciliu DOMICILII.Id_domiciliu%type,
           codstrada Strazi.id_strada%type,
           codoras orase.id_oras%type,
           codjob JOBURI.id_job%type
                                          );
       oldinfo informatiidomiciliu;
       iduri number_list :=number_list();
       cod number;
       dom number:=-1;


   begin


       select p.ID_PACIENT,d.ID_DOMICILIU,d.ID_STRADA,s.ID_ORAS,j.ID_JOB into oldinfo from PACIENTI p
       join Domicilii d on d.ID_DOMICILIU = p.ID_PACIENT
       join Strazi s on s.ID_STRADA = d.ID_STRADA
       join joburi J on p.ID_JOB = J.ID_JOB
       where NUME ||' '||Prenume = NumeComplet;


        if schimbam = 'Job' or schimbam is null then
           if codnoujob is null then
                raise no_job_specified;
           end if;
           Utility.BoliJob(oldinfo.codjob);
           update PACIENTI
           set ID_JOB = codnoujob
           where ID_PACIENT = oldinfo.codpacient;
           if schimbam = 'Job' then
               raise done_job;
           end if;


       end if;
       iduri.extend(3);
      iduri:= vitoareaadresa.CODURI();
       if vitoareaadresa.GetStrada() is null or vitoareaadresa.GetOras() is null or vitoareaadresa.GetNumar() is null then
           raise no_town_street;
       end if;


       if iduri(2) = -1 then
           select ID_ORAS+1 into cod from(select * from Orase order by ID_ORAS desc) where ROWNUM=1;


            insert into Orase(id_oras, id_judet, nume_oras) VALUES (cod,iduri(1),vitoareaadresa.GETORAS());
           DBMS_OUTPUT.PUT_LINE('S-a adaugat in baza de date strada: '|| vitoareaadresa.GetOras());


           iduri(2):=cod;
           DBMS_OUTPUT.PUT_LINE('Strada');
            select ID_STRADA+1 into cod from(select * from strazi order by ID_STRADA desc) where ROWNUM=1;
           insert into Strazi(id_strada, nume_strada, id_oras) VALUES (cod,vitoareaadresa.GETSTRADA(),iduri(2));
          DBMS_OUTPUT.PUT_LINE('S-a adaugat in baza de date strada: '|| vitoareaadresa.GetStrada());


           iduri(3):=cod;
       elsif iduri(3) =-1 then --- daca nu exista strada in bd


            select ID_STRADA+1 into cod from(select * from Strazi order by ID_STRADA desc) where ROWNUM=1;
           insert into Strazi(id_strada, nume_strada, id_oras) VALUES (cod,vitoareaadresa.GETSTRADA(),iduri(2));
              DBMS_OUTPUT.PUT_LINE('S-a adaugat in baza de date strada: '|| vitoareaadresa.GetStrada());
            iduri(3):=cod;


           end if;
       --- daca exista strada si orasul, verificam daca exista domiciliul respectiv
           begin
               select ID_DOMICILIU into dom from Domicilii where ID_STRADA = iduri(3)
               and numar = vitoareaadresa.GETNUMAR() and BLOC = vitoareaadresa.GETBLOC() and APARTAMENT = vitoareaadresa.GETAPARTAMENT() and SCARA = vitoareaadresa.GETSCARA();
               if dom = oldinfo.coddomiciliu then
                   raise same_domiciliu;
               end if;
               exception
               when no_data_found then
                   dom := -1;
           end;


           if dom != -1 then
               update PACIENTI set ID_DOMICILIU = dom
               where ID_PACIENT = oldinfo.codpacient;
           else
                 select ID_DOMICILIU+1 into cod from(select * from domicilii order by ID_DOMICILIU desc) where ROWNUM=1;
               insert into Domicilii(id_domiciliu, id_strada, numar,bloc,APARTAMENT,SCARA) VALUES (cod,iduri(3),vitoareaadresa.GETNUMAR(),vitoareaadresa.GETBLOC(),vitoareaadresa.GETAPARTAMENT(),vitoareaadresa.GetScara());
                update PACIENTI set ID_DOMICILIU = cod
               where ID_PACIENT = oldinfo.codpacient;
               end if;


       Utility.AfisareIstoricPacient(oldinfo.codpacient);
    return 'Noua adresa: ' || vitoareaadresa.AFISAREADRESA();
   exception
   when no_data_found then
   return 'Nu exista pacientul in baza de date';
   when too_many_rows then
   return 'Mai multi pacienti cu acelasi nume!';
   when no_town_street then
   return 'Nu putem sa cautam/adaugam o adresa fara Oras/Strada/Numar';
   when same_domiciliu then
   return 'Persoana vrea sa se mute in aceeasi casa';
   when incorect_nume_judet then
   return 'Nu a fost acordat un nume de judet corect, nu s-a schimbat domiciliul!';
   when no_job_specified then
   return 'Nu ai specificat un job, dar vrei sa il schimbi!';
   when done_job then
   return 'Am schimbat cu succes locul de munca al pacientului!';
   when others then
       return sqlerrm;




   end SchimbareDatePacient;
    procedure MediciActivi(anul date)  is
    --- exceptii
    no_active_judet exception;
    no_active_spital exception;
---variabile
        Tabela Utility.tabelaMedici;
        medic Utility.rec;
        multi boolean:=false;
            salariuafis number;
            no_marire number;
    begin

    SELECT M2.ID_MEDIC,M2.NUME ||' '||M2.PRENUME,s5.NUME_SPECIALIZARE,s5.NUME_SPITAL,o.NUME_ORAS,j.NUME_JUDET, COUNT(ip.ID_MEDIC) bulk collect  into Tabela
FROM MEDICI m2
left JOIN (select * from ISTORIC_PACIENTI join RETETE r on ISTORIC_PACIENTI.ID_RETETA = r.ID_RETETA where  DATA_ELIBERARII between anul  and add_months(anul,12)  ) ip ON M2.ID_MEDIC = ip.ID_MEDIC
join SPITALE S5 on S5.ID_SPITAL = M2.ID_SPITAL
join Strazi st on st.ID_STRADA = s5.ID_STRADA
join orase o on o.ID_ORAS = st.ID_ORAS
join judete j on j.ID_JUDET = o.ID_JUDET
join SPECIALIZARI S5 on M2.ID_SPECIALIZARE = S5.ID_SPECIALIZARE
GROUP BY M2.NUME, M2.PRENUME,m2.ID_MEDIC, s5.NUME_SPECIALIZARE,s5.NUME_SPITAL,o.NUME_ORAS,j.NUME_JUDET
order by m2.ID_MEDIC
    ;

select max(totalpacienti) into no_marire from Table(Tabela);
    if no_marire = 0 then
        raise no_data_found;
    end if;
    --- marim salariul celui mai bun din tara
    begin
    select * into medic from Table(Tabela) where totalpacienti = (select max(totalpacienti) from Table(Tabela));
      DBMS_OUTPUT.PUT_LINE('Cel mai activ medic din Tara este Dr. '|| medic.numecomplet);
        DBMS_OUTPUT.PUT_LINE('Lucreaza la spitalul: ' || medic.spitalul);
        update MEDICI set SALARIU = round(salariu +( salariu *(medic.totalpacienti *0.05)))
        where ID_MEDIC = medic.codmedic;
    select SALARIU into salariuafis from MEDICI where ID_MEDIC = medic.codmedic;
     Tabela(medic.codmedic).totalpacienti:= -1;
        DBMS_OUTPUT.PUT_LINE('Noul sau salariu este ' || salariuafis);

    exception
    when too_many_rows then
        multi := true;
    end;
    --- in cazul in care sunt mai multi pe tara atunci coeficientul
    if multi = true then
        DBMS_OUTPUT.PUT_LINE('Mai multi medici se afla la egalitate pentru bonusul pe tara!');
        DBMS_OUTPUT.PUT_LINE('Bonusul a fost redus la 0.05 per 2 pacienti');
        DBMS_OUTPUT.PUT_LINE('Cei mai buni medici din tara sunt:');
        for med in (select * from Table(Tabela) where totalpacienti = (select max(totalpacienti) from Table(Tabela))) loop
                DBMS_OUTPUT.PUT_LINE('Dr. ' || med.numecomplet);
              update MEDICI set SALARIU = round(salariu +( salariu *(med.totalpacienti *(0.05/2))))
             where ID_MEDIC = med.codmedic;
                 select SALARIU into salariuafis from MEDICI where ID_MEDIC = med.codmedic;
                 Tabela(medic.codmedic).totalpacienti:= -1;
        DBMS_OUTPUT.PUT_LINE('Noul sau salariu este ' || salariuafis);
            end loop;
        multi:=false;
    end if;
    for judet in (select * from judete) loop
        begin
            select max(totalpacienti) into no_marire from Table(Tabela) where judetul = judet.NUME_JUDET;
    if no_marire = 0 then
        raise no_active_judet;
    end if;
    select * into medic from Table(Tabela) where totalpacienti = (select max(totalpacienti) from Table(Tabela) where judetul = judet.NUME_JUDET) and judetul = judet.NUME_JUDET;
    DBMS_OUTPUT.PUT_LINE('Cel mai activ medic din '||judet.NUME_JUDET||' este Dr. '|| medic.numecomplet);
        DBMS_OUTPUT.PUT_LINE('Lucreaza la spitalul: ' || medic.spitalul);
        update MEDICI set SALARIU = round(salariu +( salariu *(medic.totalpacienti *0.03)))
        where ID_MEDIC = medic.codmedic;
    select SALARIU into salariuafis from MEDICI where ID_MEDIC = medic.codmedic;
     Tabela(medic.codmedic).totalpacienti:= -1;
        DBMS_OUTPUT.PUT_LINE('Noul sau salariu este ' || salariuafis);
    exception
        when no_active_judet then
            DBMS_OUTPUT.PUT_LINE('Nu exista medici activi in judetul '|| judet.NUME_JUDET);
        multi:=false;
    when no_data_found then
    DBMS_OUTPUT.PUT_LINE('Nu exista medici in Judetul '|| judet.NUME_JUDET );
    when too_many_rows then
        multi := true;
    end;
        if multi = true then
               DBMS_OUTPUT.PUT_LINE('Mai multi medici se afla la egalitate pentru bonusul din judetul '||judet.NUME_JUDET||'!');
             DBMS_OUTPUT.PUT_LINE('Bonusul a fost redus la 0.03 per 2 pacienti');
                 DBMS_OUTPUT.PUT_LINE('Cei mai buni medici din '||judet.NUME_JUDET||' sunt:');
            for med in (select * into medic from Table(Tabela)
                                            where totalpacienti = (select max(totalpacienti) from Table(Tabela) where judetul = judet.NUME_JUDET) and judetul = judet.NUME_JUDET) loop
                        DBMS_OUTPUT.PUT_LINE('Dr. ' || med.numecomplet);
                        update MEDICI set SALARIU = round(salariu +( salariu *(med.totalpacienti *(0.03)/2)))
                         where ID_MEDIC = med.codmedic;
                        select SALARIU into salariuafis from MEDICI where ID_MEDIC = med.codmedic;
                        Tabela(med.codmedic).totalpacienti:= -1;
                        DBMS_OUTPUT.PUT_LINE('Noul sau salariu este ' || salariuafis);
                end loop;
               multi:=false;
        end if;
        end loop;


    --- cei mai bun din spitale
           for spital in (select * from SPITALE) loop
        begin
                    select max(totalpacienti) into no_marire from Table(Tabela) where spitalul = spital.NUME_SPITAL;
    if no_marire = 0 then
        raise no_active_spital;
    end if;
    select * into medic from Table(Tabela) where totalpacienti = (select max(totalpacienti) from Table(Tabela) where spitalul = spital.NUME_SPITAL) and spitalul = spital.NUME_SPITAL;
    DBMS_OUTPUT.PUT_LINE('Cel mai activ medic din '||spital.NUME_SPITAL||' este Dr. '|| medic.numecomplet);
        DBMS_OUTPUT.PUT_LINE('Avand specializarea: ' || medic.specializare);
        update MEDICI set SALARIU = round(salariu +( salariu *(medic.totalpacienti *0.03)))
        where ID_MEDIC = medic.codmedic;
    select SALARIU into salariuafis from MEDICI where ID_MEDIC = medic.codmedic;
     Tabela(medic.codmedic).totalpacienti:= -1;
        DBMS_OUTPUT.PUT_LINE('Noul sau salariu este ' || salariuafis);
    exception
        when no_active_spital then
              multi:=false;
        DBMS_OUTPUT.PUT_LINE('Nu exista medici activi in spitalul ' ||medic.spitalul);
    when no_data_found then
    DBMS_OUTPUT.PUT_LINE('Nu exista medici in Spitalul '|| medic.spitalul );
    when too_many_rows then
        multi := true;
    end;
        if multi = true then
               DBMS_OUTPUT.PUT_LINE('Mai multi medici se afla la egalitate pentru bonusul din'||spital.NUME_SPITAL||'!');
             DBMS_OUTPUT.PUT_LINE('Bonusul a fost redus la 0.02 per 2 pacienti');
                 DBMS_OUTPUT.PUT_LINE('Cei mai buni medici din '||spital.NUME_SPITAL||' sunt:');
            for med in (select * into medic from Table(Tabela)
                                            where totalpacienti = (select max(totalpacienti) from Table(Tabela) where spitalul = spital.NUME_SPITAL) and spitalul = spital.NUME_SPITAL) loop
                        DBMS_OUTPUT.PUT_LINE('Dr. ' || med.numecomplet);
                        update MEDICI set SALARIU = round(salariu +( salariu *(med.totalpacienti *(0.02)/2)))
                         where ID_MEDIC = med.codmedic;
                        select SALARIU into salariuafis from MEDICI where ID_MEDIC = med.codmedic;
                        Tabela(med.codmedic).totalpacienti:= -1;
                        DBMS_OUTPUT.PUT_LINE('Noul sau salariu este ' || salariuafis);
                end loop;
        end if;
        end loop;

    exception
    when No_Data_Found then
        DBMS_OUTPUT.PUT_LINE('Nu exista medici activi in acea perioada!');
       end MediciActivi;
    end SGBD;

create or replace type Adresa as Object(
judet varchar2(50),
oras varchar2(50),
strada varchar2(50),
numar number,
bloc number ,
apartament number,
scara varchar2(2),
 Member function coduri return NUMBER_LIST,
 constructor function Adresa(numejudet varchar2,numeoras varchar2,strada varchar2,p_numar number, bl number, ap number,sc varchar2) return self as result,
member function GetJudet return varchar2,
member function GetOras return varchar2,
member function GetStrada return varchar2,
member function GetNumar return number,
member function GetBloc return number,
member function GetApartament return number,
member function GetScara return varchar2,
member function Afisareadresa return varchar2
);
create or replace type body Adresa as
    constructor function Adresa(numejudet varchar2,numeoras varchar2,strada varchar2,p_numar number, bl number, ap number,sc varchar2) return self as result
        is begin
            self.judet := numejudet;
            self.ORAS:=numeoras;
            self.STRADA:=strada;
            self.NUMAR:=p_numar;
            self.BLOC:=bl;
                self.APARTAMENT:=ap;
            self.SCARA:=sc;
            return;
            end Adresa;


        member function Afisareadresa return varchar2 is
            adresa_completa varchar2(100);
            begin
            if self.JUDET is null or self.STRADA is null or self.ORAS is null or self.NUMAR is null then
                return 'Adresa incompleta!';
            end if;
            adresa_completa:= 'Jud.' || self.JUDET ||', Mun.' || self.ORAS || ', Str.' || self.STRADA || ', nr.' || self.NUMAR;
            if self.APARTAMENT is not null and self.BLOC is not null and self.SCARA is not null then
                adresa_completa:= adresa_completa ||' bl.' || self.BLOC || ' sc.' || self.SCARA || 'ap.' || self.APARTAMENT;
                else
                return adresa_completa;
            end if;
            return adresa_completa;

                end Afisareadresa;
    member function coduri return number_list is
       cod number_list:=number_list();

        begin
            cod.extend(3);


            cod(1):=-1;cod(2):=-1; cod(3):=-1;
        select ID_JUDET into cod(1) from judete where NUME_JUDET = SELF.JUDET;
        select ID_ORAS into cod(2) from orase where NUME_ORAS = SELF.ORAS;
        select ID_STRADA into cod(3) from Strazi where NUME_STRADA = SELF.STRADA;
        return cod;
        exception
            when no_data_found then
            return cod;
        end coduri;

        -- geteri si setteri
 member function GetJudet return varchar2 is
            begin
                return self.judet;
                end GetJudet;
 member function GetOras return varchar2 is
            begin
                return self.oras;
                end GetOras;
member function GetStrada return varchar2 is
    begin
        return self.strada;
        end GetStrada;
member function GetNumar return number is
    begin
        return self.numar;
        end GetNumar;
member function GetBloc return number is
    begin
        return self.bloc;
        end GetBloc;
member function GetApartament return number is
    begin
        return self.apartament;
        end GetApartament;
member function GetScara return varchar2 is
    begin
        return self.scara;
        end GetScara;
    end;
declare
data_startstring varchar2(15) := &data_st;
data_finishstring varchar2(10) :=&data_fi;
data_finish date:=null;
data_start date:=null;
nume_spital varchar(60) := &nume_spit;
    job number;

nume_persoana varchar(50):= &numecautat;
    begin
    data_finish := to_date(data_finishstring,'YYYY-MM-DD');
    data_start:=to_date(data_startstring,'YYYY-MM-DD');
DBMS_OUTPUT.PUT_LINE('Job frumos');
    Utility.Raport_Medical(data_start => data_start, data_finish => data_finish, numespital => nume_spital, numecomplet => nume_persoana);
end;


create or replace package TriggerUtility is
        data_start date;
    data_finish date;
    procedure SchimbaAngajarea(startd varchar2 ,finish varchar2 );
     procedure insertinto;
         procedure insertintologoff;
         procedure InsertCAD;
         procedure inserterrror;
    end TriggerUtility;

    create or replace package body TriggerUtility is
         procedure SchimbaAngajarea(startd varchar2 ,finish varchar2 )
        is
        begin
        data_start := to_date(startd,'YYYY-MM-DD');
        data_finish := to_date(finish,'YYYY-MM-DD');
    end SchimbaAngajarea;
        procedure insertinto
is
    e_logat number;
        type lastlogin is record(ultimalogare UserLogin.ID%type, data_logare timestamp);
        login lastlogin;
        sesiunee varchar(20);
        prima_logare exception;
    begin
       begin
            select ID,DataLogare into login.ultimalogare,login.data_logare from (select ID,DataLogare from UserLogin where UserName = sys.LOGIN_USER() order by ID desc ) where ROWNUM = 1;

        select COUNT(*) into e_logat from UserLogOff where UserName = sys.LOGIN_USER() and ID_Logare = login.ultimalogare and DataDelogare > login.data_logare;
        exception
       when no_data_found then
       login.ultimalogare:=-1;
       end;
        if e_logat>0 or login.ultimalogare =-1 then
            select to_char(sys_context('userenv','sessionid')) into sesiunee from Dual where user = sys.LOGIN_USER();
            DBMS_OUTPUT.PUT_LINE('Sesiune:' ||sesiunee ||' User: '||sys.LOGIN_USER());
            insert into UserLogin(UserLogin.ID, username, nume_bazadate, datalogare,sesiune) values (seq_login.nextval,sys.LOGIN_USER(),sys.DATABASE_NAME(),systimestamp,sesiunee);
        end if;
    end;
     procedure insertintologoff
is
        logoff UserLogin%rowtype;
        inchis number;
            sesiune number;
        begin

                    select * into logoff from (select * from UserLogin where UserName = sys.LOGIN_USER()  order by ID desc) where rownum =1;
                    select count(*) into inchis from UserLogOff where ID_Logare = logoff.ID;
        select sys_context('userenv','sessionid') into sesiune from DUal;
           if logoff.sesiune != sesiune and inchis=0 then
    insert into UserLogOff(id_logare, username, nume_bazadate, datadelogare) values (logoff.ID,sys.LOGIN_USER(),sys.DATABASE_NAME(),systimestamp);
            end if;
    exception
        when no_data_found then
            raise_application_error(-2100,'A aparut o eroare la log off!!');
end insertintologoff;


 procedure InsertCAD
is

   cad UserLogin.ID%type;
begin
     select ID into cad from UserLogin where UserName = sys.LOGIN_USER() order by ID desc FETCH FIRST 1 ROW ONLY ;
    insert into UserCAD(id_logare, tipul, nume_bd, obiect_referit, nume_obiect, data) values
            (cad,sys.SYSEVENT(),sys.DATABASE_NAME(),sys.DICTIONARY_OBJ_TYPE(),sys.DICTIONARY_OBJ_NAME(),systimestamp);

end;
    procedure inserterrror
    is
errorr UserLogin.ID%type;
    erroare varchar2(4020);
    cod varchar2(20);
    text varchar2(2000);
begin
    erroare := DBMS_UTILITY.FORMAT_ERROR_STACK;
    cod := SUBSTR(erroare, INSTR(erroare, 'ORA-', 1), 9);
    text := SUBSTR(erroare,11);


     select ID into errorr from UserLogin where UserName = sys.LOGIN_USER() and rownum <=1 order by ID desc ;

   insert into ErrorLog(id_logare, cod_eroare, eroare, data) values (errorr,cod,text,systimestamp);

end inserterrror;
        end TriggerUtility;

--- Directorii spitalului vor sa verifice intr-un anumit an cati pacienti venit cu urgente in alte spitale fata de cele din localitatea de domiciliu

--- cursor explicit
-- cursor implicit


--- exercitiul 7
--- trebuie bagat in procedura si facut sa verifici pentru o perioada de an 2023-2024

declare
    anulstring varchar(5) := &anul;
    anstart date;
    begin
    anstart:= to_date(anulstring,'YYYY');
    PacientiSpitaleInfo(an => anstart);
end;


---
--- Un pacient doreste
--- sa isi schimbe domiciliul(daca acesta nu exista se adauga un nou domiciliu in baza de date)
--- acesta poate sa vina si cu cerinta de as-i schimba si locul de munca
-- daca pacientul isi schimba locul de munca se elibereaza bolile specifice la locul de munca anterior
--- daca pacientul isi schimba domiciliul se elibereaza tot istoricul ce l-a avut la spital




create or replace


   create or replace

       create or replace function SchimbareDatePacient
(NumeComplet varchar2, schimbam in varchar2,codnoujob in number, vitoareaadresa Adresa)
return varchar2
    is
    -- exceptii

    incorect_nume_judet exception;
           no_job_specified exception ;
           same_domiciliu exception ;
           no_town_street exception ;
           done_job exception ;

        -- tipuri de date

--variabile
        type informatiidomiciliu is record (
            codpacient PACIENTI.ID_PACIENT%type,
            coddomiciliu Domicilii.Id_domiciliu%type,
            codstrada Strazi.id_strada%type,
            codoras orase.id_oras%type,
            codjob Joburi.id_job%type
                                           );
        oldinfo informatiidomiciliu;
        iduri number_list :=number_list();
        cod number;
        dom number:=-1;

    begin

        select p.ID_PACIENT,d.ID_DOMICILIU,d.ID_STRADA,s.ID_ORAS,j.ID_JOB into oldinfo from PACIENTI p
        join Domicilii d on d.ID_DOMICILIU = p.ID_PACIENT
        join Strazi s on s.ID_STRADA = d.ID_STRADA
        join Joburi J on p.ID_JOB = J.ID_JOB
        where NUME ||' '||Prenume = NumeComplet;

         if schimbam = 'Job' or schimbam is null then
            if codnoujob is null then
                 raise no_job_specified;
            end if;
            BoliJob(oldinfo.codjob);
            update PACIENTI
            set ID_JOB = codnoujob
            where ID_PACIENT = oldinfo.codpacient;
            if schimbam = 'Job' then
                raise done_job;
            end if;

        end if;
        iduri.extend(3);
       iduri:= vitoareaadresa.CODURI();
        if vitoareaadresa.GetStrada() is null or vitoareaadresa.GetOras() is null or vitoareaadresa.GetNumar() is null then
            raise no_town_street;
        end if;

        if iduri(2) = -1 then
            select ID_ORAS+1 into cod from(select * from orase order by ID_ORAS desc) where ROWNUM=1;

            insert into orase(id_oras, id_judet, nume_oras) VALUES (cod, iduri(1), vitoareaadresa.GETORAS());
            DBMS_OUTPUT.PUT_LINE('S-a adaugat in baza de date strada: '|| vitoareaadresa.GetOras());

            iduri(2):=cod;
            DBMS_OUTPUT.PUT_LINE('Strada');
             select ID_STRADA+1 into cod from(select * from Strazi order by ID_STRADA desc) where ROWNUM=1;
            insert into Strazi(id_strada, nume_strada, id_oras) VALUES (cod,vitoareaadresa.GETSTRADA(),iduri(2));
           DBMS_OUTPUT.PUT_LINE('S-a adaugat in baza de date strada: '|| vitoareaadresa.GetStrada());

            iduri(3):=cod;
        elsif iduri(3) =-1 then --- daca nu exista strada in bd

             select ID_STRADA+1 into cod from(select * from Strazi order by ID_STRADA desc) where ROWNUM=1;
            insert into Strazi(id_strada, nume_strada, id_oras) VALUES (cod,vitoareaadresa.GETSTRADA(),iduri(2));
               DBMS_OUTPUT.PUT_LINE('S-a adaugat in baza de date strada: '|| vitoareaadresa.GetStrada());
             iduri(3):=cod;

            end if;
        --- daca exista strada si orasul, verificam daca exista domiciliul respectiv
            begin
                select ID_DOMICILIU into dom from Domicilii where ID_STRADA = iduri(3)
                and numar = vitoareaadresa.GETNUMAR() and BLOC = vitoareaadresa.GETBLOC() and APARTAMENT = vitoareaadresa.GETAPARTAMENT() and SCARA = vitoareaadresa.GETSCARA();
                if dom = oldinfo.coddomiciliu then
                    raise same_domiciliu;
                end if;
                exception
                when no_data_found then
                    dom := -1;
            end;

            if dom != -1 then
                update PACIENTI set ID_DOMICILIU = dom
                where ID_PACIENT = oldinfo.codpacient;
            else
                  select ID_DOMICILIU+1 into cod from(select * from Domicilii order by ID_DOMICILIU desc) where ROWNUM=1;
                  insert into Domicilii(id_domiciliu, id_strada, numar,bloc,APARTAMENT,SCARA)VALUES (cod, iduri(3), vitoareaadresa.GETNUMAR(), vitoareaadresa.GETBLOC(), vitoareaadresa.GETAPARTAMENT(), vitoareaadresa.GetScara());
                 update PACIENTI set ID_DOMICILIU = cod
                where ID_PACIENT = oldinfo.codpacient;
                end if;

        AfisareIstoricPacient(oldinfo.codpacient);
        return 'Noua adresa: ' || vitoareaadresa.AFISAREADRESA();
    exception
    when no_data_found then
    return 'Nu exista pacientul in baza de date';
    when too_many_rows then
    return 'Mai multi pacienti cu acelasi nume!';
    when no_town_street then -- da
    return 'Nu putem sa cautam/adaugam o adresa fara Oras/Strada/Numar';
    when same_domiciliu then --da
    return 'Persoana vrea sa se mute in aceeasi casa';
    when incorect_nume_judet then --da
    return 'Nu a fost acordat un nume de judet corect, nu s-a schimbat domiciliul!';
    when no_job_specified then --da
    return 'Nu ai specificat un job, dar vrei sa il schimbi!';
    when done_job then --da
    return 'Am schimbat cu succes locul de munca al pacientului!';
    when others then
        return sqlerrm;


    end SchimbareDatePacient;

declare
    judet varchar2(50):=&jud;
    oras varchar2(50):=&ora;
    stra varchar2(50) := &str;
    numb number:=&nr;
    bloc number:= &bl;
    apt number:=&apt;
    sc varchar(2):=&sc;
    adr Adresa;
    NumeComplet varchar2(50):= &nume;
    moficari varchar2(50) := &mod;
    cod_jod number := &n;
    begin
    adr:= Adresa(judet,oras,stra,numb,bloc,apt,sc);
     DBMS_OUTPUT.PUT_LINE(SchimbareDatePacient(NumeComplet,moficari,cod_jod,adr));
        end;
rollback;
select * from orase;

select * from Strazi;
select * from PACIENTI;
rollback ;
rollback ;
SELECT * FROM all_objects WHERE object_name = 'UTL_MAIL';
select * from ISTORIC_PACIENTI;
select * from orase;



-- exercitiul 9
--Conducerea spitalelor doreste sa vada cei mai activi medici din fiecare spital(activitatea medicului este determinata de numarul de pacienti pecare ii are),
-- daca exista 2 medici care au aceeasi activitate acestia o sa fie rasplatiti daca au specializari.
-- Rasplata o sa fie in functie de urmatoarele:
-- Cel mai activ medic din tara pe luna respectiva o sa primeasca 0.05 per pacient ajutat
-- Cel mai activ medic din judet o sa primeasca 0.03 per pacient ajutat
--- Cel mai activ medic dintr-un spital o sa primeasca 0.02 per pacient ajutat
-- Daca un medic a primit un bonus acesta nu mai poate primii alt bonus mai mic decat cel primit
--- TOO_MANY_ROWS o pot scoate din faptul ca exista o posibilitate ca 2 sau mai multi medici sa indeplineasca conditia pentru un bonus



create or replace

    select * from Medici;
commit;
declare
    anul date := to_date(&an,'YYYY');
begin

    MediciActivi(anul);
    end;
rollback;
-- O procedura stocata care sa


---LMD la nivel de comanda
--- acesti triggeri se folosesc cand nu conteaza informatiile

--LMD la nivel de linie
-- vreau sa verific in tabela de retete corectitudinea datelor introduse:
-- Adica daca eu am tipul x de reteta, iar medicamentele introduse nu corespund cu reteta sa dea eroare
select * from TIP_RETETE;

create or replace procedure VerificareMedicamente(
tip RETETE.TIP_RETETA%type,
lista_medicamente RETETE.Lista_Medicamente%type
)
is
    type verificaremed is record (tipul_retetei_eliberate RETETE.TIP_RETETA%type,
    tip_reteta_medicament MEDICAMENTE.TIP_RETETA%type,
    nume_medicament MEDICAMENTE.NUME_MEDICAMENT%type);
    med verificaremed;
    begin
    med.tipul_retetei_eliberate := tip;

           for i in 1..lista_medicamente.COUNT loop
               select TIP_RETETA,NUME_MEDICAMENT into med.tip_reteta_medicament,med.nume_medicament from MEDICAMENTE where ID_MEDICAMENT = lista_medicamente(i);
               --- daca nu gaseste medicamente o no_data_found o sa fie rezolvat in blocul trigger-ului
               if med.tip_reteta_medicament != med.tipul_retetei_eliberate then
                   raise_application_error(-20003,'Medicamentul '|| med.nume_medicament || 'este eliberat pe o reteta '||med.tip_reteta_medicament ||', dar a fost eliberat pe '||med.tipul_retetei_eliberate);
               end if;
               end loop;
end;
create or replace trigger VerificareRetete
    before insert or update on RETETE
    FOR EACH ROW
    begin
        if inserting then
            VerificareMedicamente(:NEW.TIP_RETETA,:NEW.Lista_Medicamente);
             end if;
        if updating then
             if :NEW.TIP_RETETA != :OLD.TIP_RETETA and :NEW.TIP_RETETA is not null then
            raise_application_error(-20005, 'Nu ai voie sa schimbi tipul retetei dupa ce aceasta a fost inserata!');
             end if;
             if :NEW.Lista_Medicamente is not null then
                VerificareMedicamente(:OLD.TIP_RETETA,:NEW.Lista_Medicamente);
            end if;
        end if;
    exception
        when no_data_found then
         raise_application_error(-20004, 'Medicamentul nu exista in baza de date!');
    end;

select* from USER_TRIGGERS;
--- conducerea spitatileor
-- a decis ca pentru anul 2024 nu mai doresc sa angazeje mai mult de 2 medici pe o acceeasi specializare in acelasi spital
drop trigger PERIOADAANG;
CREATE OR REPLACE TRIGGER angajaremedic
for Insert or Update ON MEDICI compound trigger
type spitalspecializare is record (spital Medici.ID_SPITAL%type, specializare Medici.ID_SPECIALIZARE%type);
    type tabelimpMedici is table of spitalspecializare index by pls_integer;
    Medi tabelimpMedici;
    before statement is
         auxiliar spitalspecializare;
    begin
    for medic in (select * from Medici) loop
        auxiliar.specializare := medic.ID_SPECIALIZARE;
        auxiliar.spital := medic.ID_SPITAL;
        Medi(medic.ID_MEDIC) := auxiliar;
        end loop;

end before statement;
before each row is
    counter number:=0;
    numarpaturi SPITALE.numar_paturi%type;
   numespital SPITALE.NUME_SPITAL%type;
    stradaspital SPITALE.id_spital%type;
    judetspital orase.id_judet%type;
    judete number_list;
    begin
      select NUME_SPITAL,NUMAR_PATURI,ID_STRADA into numespital,numarpaturi,stradaspital from SPITALE where ID_SPITAL = :new.ID_SPITAL;
    if inserting then
            for i in 1..Medi.Count loop
        if Medi(i).specializare = :new.ID_SPECIALIZARE and Medi(i).spital = :new.ID_SPITAL then -- linia 27
        counter := counter+1;
        end if;
        if counter >= ceil(numarpaturi/50)then -- luam cu ceil limita superioara adica daca calculul da 2,5 lasam sa fie 3 locuri
            raise_application_error(-20010,'Sunt prea multe locuri ocupate in spitalul ' || numespital);
        end if;
end loop;

    end if;
      -- in cazul in care un medic se transfera
    if updating then
if :new.ID_SPITAL <>:old.ID_SPITAL then
   SELECT DISTINCT  o.ID_JUDET bulk collect into judete
        FROM ISTORIC_PACIENTI i
    JOIN pacienti p ON p.ID_PACIENT = i.ID_PACIENT
    JOIN Domicilii d ON d.ID_DOMICILIU = p.ID_DOMICILIU
    JOIN Strazi s ON s.ID_STRADA = d.ID_STRADA
    LEFT JOIN orase o ON s.ID_ORAS = o.ID_ORAS
WHERE i.id_medic = :old.ID_MEDIC;
    if sql%notfound then
        raise_application_error(-20012,'Medicul nu are pacienti la activ!!');
    end if;
select o.id_judet into judetspital from Strazi
    join orase o on Strazi.ID_ORAS =o.ID_ORAS where Strazi.ID_STRADA = stradaspital;

    if judete.EXISTS(judetspital) then
      if :new.ID_SPECIALIZARE is not null then
            for i in 1..Medi.Count loop
        if Medi(i).specializare = :new.ID_SPECIALIZARE and Medi(i).spital = :new.ID_SPITAL then
            counter := counter+1;
        end if;
        if counter >= ceil(numarpaturi/50)then -- luam cu ceil limita superioara adica daca calculul da 2,5 lasam sa fie 3 locuri
            raise_application_error(-20010,'Sunt prea multe locuri ocupate in spitalul ' || numespital);
        end if;
        end loop;
        else
           for i in 1..Medi.Count loop
        if Medi(i).specializare = :old.ID_SPECIALIZARE and Medi(i).spital = :new.ID_SPITAL then
            counter := counter+1;
        end if;
        if counter >= ceil(numarpaturi/50)then -- luam cu ceil limita superioara adica daca calculul da 2,5 lasam sa fie 3 locuri
            raise_application_error(-20010,'Sunt prea multe locuri ocupate in spitalul ' || numespital);
        end if;
        end loop;
      end if;
        else
        raise_application_error(-20011,'Medicul nu are pacienti in judetul in care vrea sa se mute');
    end if;
      end if;
 end if;

end before each row;

end;


--- Trigger LMD la nivel de comanda
create or replace package Perioada_angajare is
    data_start date;
    data_finish date;
    procedure SchimbaAngajarea(startd varchar2 ,finish varchar2 );
        end;
create or replace package body Perioada_angajare is

end;
    declare
        stringstar varchar2(11) := &start;
        stringend varchar2(11) :=&end;
    begin
        Perioada_angajare.SchimbaAngajarea(stringstar,stringend);
    end;
INSERT INTO MEDICI (ID_MEDIC, ID_SPECIALIZARE, ID_SPITAL, NUME, PRENUME, SALARIU, DATA_ANGAJARI)
VALUES (102,2,1, 'Marian', 'Ion', 3000, sysdate);
select * from Medici;
create or replace trigger PERIOADAANG
    before insert on MEDICI
    begin
        if sysdate not between Perioada_angajare.data_start and Perioada_angajare.data_finish then
            RAISE_APPLICATION_ERROR(-20005,'Nu poti angaja medici pentru ca nu suntem in perioada de angajare');
        end if;
    end;
select * from RETETE;
--- LDD
create table UserLogin(
ID number primary key ,
UserName varchar2(30),
Nume_BazaDate varchar2(50),
DataLogare timestamp(3)
);
create table UserLogOff(
ID_Logare number,
UserName varchar2(30),
Nume_BazaDate varchar2(50),
DataDelogare timestamp(3),
foreign key (ID_Logare) references UserLogin(ID)
);
create table ErrorLog(
ID_Logare number,
Cod_Eroare varchar2(30),
Eroare varchar2(2000),
Data timestamp(3),
foreign key (ID_Logare) references UserLogin(ID)
);
create table UserCAD(
ID_Logare number,
Tipul varchar2(20),
Nume_BD varchar2(50),
Obiect_Referit varchar2(30),
Nume_Obiect varchar2(30),
data timestamp(3),
foreign key (ID_Logare) references UserLogin(ID)
);
alter table UserLogin add sesiune varchar2(30);

create sequence  seq_login
start with 1
increment by 1;
select * from ErrorLog;

create or replace trigger Login
     after logon on DATABASE
     call TriggerUtility.insertinto;

create or replace trigger Logoff
     before logoff on Database
    call TriggerUtility.insertintologoff;

drop trigger CADSchema;
drop trigger CADSchema;
create or replace trigger CADSchema
    after create or drop or alter on schema
    call TriggerUtility.InsertCAD;



create or replace trigger LoguriErrori
    after servererror on schema
    call TriggerUtility.inserterrror;

SELECT * FROM ALL_ERRORS WHERE NAME = 'CADSCHEMA' AND TYPE = 'TRIGGER' AND OWNER = 'UTILIZATOR';

select * from abc;


select * from UserLogin ;
select * from UserLogOff;
select * from ErrorLog;
select * from UserCAD;

delete UserLogOff;
delete UserCAD;
delete ErrorLog;
delete UserLogin;

select to_char(sys_context('userenv','sessionid')) from DUal where user = sys.LOGIN_USER();


-- sa se modifice salariul unui medic cu codul dat de la tastatura
/*
declare
   cod_medic number:=&cod;
    coeficient number:=&coeficient;
    iesim boolean := false;
    begin
    loop
         update MEDICI
        set SALARIU = salariu * coeficient
        where ID_MEDIC = cod_medic;
        if sql%notfound then
            DBMS_OUTPUT.PUT_LINE('Medicul nu exista!');
            cod_medic:=&cod;
        else
            DBMS_OUTPUT.PUT_LINE('Salariu crescut cu succes!');
            iesim :=true;
        end if;
         exit when iesim = true;
    end loop;


end;*/


