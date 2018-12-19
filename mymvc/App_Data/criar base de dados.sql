create database barcos 
on primary (
 NAME='barcosmdf',
 FILENAME='C:\Users\edgar\Documents\2ano\1S\BD1\aluguer barcos\barcos.mdf',
 SIZE=5MB,
 MAXSIZE=UNLIMITED,
 FILEGROWTH=1MB
)
log on(
 NAME='barcosldf',
 FILENAME='C:\Users\edgar\Documents\2ano\1S\BD1\aluguer barcos\barcos.ldf',
 SIZE=5MB,
 MAXSIZE=UNLIMITED,
 FILEGROWTH=1MB
) 

use barcos;

create table clientes (
 idcli int primary key,
 nome varchar(20),
 clube varchar(20),
 instrutor int foreign key references clientes(idcli) 

);

alter table clientes drop column nome;
alter table clientes add nome varchar(20);
alter table clientes alter column nome varchar(20) not null;
alter table clientes alter column clube varchar(20) not null;

select * from clientes; 

create table barcos (
 idbarco int primary key,
 cor varchar(20) not null,
 );
SELECT * FROM barcos;
SELECT * FROM clientes;

create table alugueres (
 idbarco int foreign key references barcos(idbarco)
		on update cascade on delete cascade,
 idcli int foreign key references clientes(idcli)
		on update cascade on delete cascade,
 tempo tinyint check(tempo >=0),
 estado tinyint default(1), 
 constraint pkaluguer primary key(idcli, idbarco),
 --constraint aluguerunico Unique(idcli, idbarco)
);

SELECT * FROM barcos;

alter table barcos add alugado bit default(0);
alter table barcos add precohora money;
alter table barcos add xpto varchar(20);
alter table barcos drop column xpto;
alter table barcos add constraint ph default(10.00) for precohora;
alter table barcos add constraint pu unique (precohora);
alter table barcos add constraint 
		fk1 foreign key (idbarco) references clientes(idcli);

alter table barcos drop constraint fk1;

alter table barcos add bravo varchar(20);
alter table barcos alter column bravo int NOT NULL;
sp_rename 'barcos.bravo', 'charlie', 'column';
sp_rename 'barcos', 'delta';
sp_rename 'delta', 'barcos';

alter table barcos drop column charlie;

select * from clientes;

insert into clientes (idcli, nome, clube, instrutor) VALUES 
	(1, 'José', 'Alfa', NULL),
	(2, 'Ana', 'Bravo', 1),
	(3, 'Rui', 'Alfa', 1),
	(4, 'Maria', 'Charlie', 2),
	(5, 'Luís', 'Alfa', 2);

alter table barcos drop constraint pu;

insert into barcos (idbarco, cor) VALUES
	(1, 'vermelha'),
	(2, 'azul'),
	(3, 'verde');
select * from barcos;
select * from clientes;

insert into alugueres (idcli, idbarco, tempo) VALUES
	(1,2,2),
	(1,3,2),
	(1,1,4),
	(2,2,2),
	(3,2,2),
	(4,1,2),
	(5,2,2),
	(4,2,2);




















