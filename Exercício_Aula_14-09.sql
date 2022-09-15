create database aeroportos;
use aeroportos;

create table aeroporto
(CODA char(3) not null,
NOMEA varchar(20) not null, 
CIDADE varchar(50) not null, 
PAIS char(2) not null,
constraint PK_AEROPORTO primary key(CODA));
insert into aeroporto values ('poa','salgado filho','porto alegre','BR');
insert into aeroporto values ('gru','guarulhos','sao paulo','BR');
insert into aeroporto values ('gal','galeao','rio de janeiro','BR');
insert into aeroporto values ('rom','int de rome','roma','IT');
insert into aeroporto values ('stu','int de stutgart','stutgart','AL');
insert into aeroporto values ('gau','charles de gaulle','paris','FR');
insert into aeroporto values ('mun','int de munique','munique','AL');

create table voo
(CODV char(5) not null, 
ORIGEM char(3) not null, 
DEST char(3) not null,
HORA int not null,
constraint PK_VOO primary key(CODV),
constraint FK_AER_VOOORIG foreign key (ORIGEM) references aeroporto (CODA),
constraint FK_AER_VOODEST foreign key (DEST) references aeroporto (CODA));
insert into voo values ('RG230','gru','poa','7');
insert into voo values ('RG330','gru','rom','11');
insert into voo values ('RG430','poa','gru','14');
insert into voo values ('RG530','gru','gau','17');
insert into voo values ('RG531','gau','gru','11');
insert into voo values ('VS100','gru','rom','14');
insert into voo values ('VS150','rom','gru','7');
insert into voo values ('LF200','gru','stu','8');
insert into voo values ('LF210','stu','mun','17');
insert into voo values ('KL400','gal','stu','14');

create table piloto
(CODP char(3) not null,
NOMEP varchar(10) not null,
SALARIO int not null, 
GRATIFICACOES int not null, 
TEMPO int not null, 
PAIS char(2) not null,
COMPANHIA varchar(10) not null,
constraint PK_PILOTO primary key(CODP));
insert into piloto values ('p11','joao', 3000, 200, 5,'BR','tam');
insert into piloto values ('p13','pedro', 2000, 100, 5,'BR','tam');
insert into piloto values ('p12','paulo', 3000, 200, 3,'BR','tam');
insert into piloto values ('p21','antonio', 1500, 300, 7,'BR','gol');
insert into piloto values ('p22','carlos', 5000, 200, 10,'BR','gol');
insert into piloto values ('p31','hanz', 5000, 1000, 6,'AL','lufthansa');
insert into piloto values ('p41','roel', 5000, 2000, 5,'NL','klm');

create table escala
(CODV char(5) not null, 
DATA date not null,
CODP char(3),
AVIAO varchar(10) not null,
constraint PK_ESCALA primary key(CODV, DATA),
constraint FK_PILOTO_ESCALA foreign key (CODP) references piloto (CODP),
constraint FK_VOO_ESCALA foreign key (CODV) references voo (CODV));
insert into escala values('RG230','2014-05-01','p11','777');
insert into escala values('RG230','2014-06-01','p11','777');
insert into escala values('VS100','2014-05-01','p21','A-320');
insert into escala values('LF200','2014-05-01','p31','777');
insert into escala values('RG330','2014-06-01','p12','777');
insert into escala values('RG330','2014-07-01','p12','A-320');
insert into escala values('RG530','2014-05-01','p12','A-320');
insert into escala values('LF200','2014-06-01','p31','A-320');
insert into escala values('KL400','2014-05-01','p41','A-320');
insert into escala values('LF210','2014-05-01','p31','A-320');
insert into escala values('VS150','2014-06-01','p21','A-320');

-- Exercicio 1a.
SELECT aeroporto.CIDADE, aeroporto.PAIS 
FROM aeroporto 
LEFT OUTER JOIN `voo` ON aeroporto.CODA = voo.DEST
WHERE voo.CODV = 'RG230';

-- Exercicio 1b.
SELECT escala.CODV, piloto.NOMEP, escala.AVIAO, piloto.COMPANHIA
FROM escala
LEFT OUTER JOIN `piloto` ON escala.CODP = piloto.CODP;

-- Exercicio 1c.
SELECT escala.CODV, escala.DATA, voo.HORA
FROM escala 
LEFT OUTER JOIN `voo` ON escala.CODV = voo.CODV
LEFT OUTER JOIN `aeroporto` ON voo.DEST = aeroporto.CODA
WHERE (aeroporto.PAIS = 'AL') OR (aeroporto.Pais = 'IT');

-- Exercicio 1d.
SELECT MIN(piloto.SALARIO), MAX(piloto.SALARIO), AVG(piloto.SALARIO)
FROM piloto
WHERE piloto.PAIS = 'BR';

-- Exercicio 2a.
SELECT piloto.COMPANHIA
FROM piloto
GROUP BY piloto.SALARIO
HAVING piloto.SALARIO < 2000;

-- Exercicio 2b.
SELECT piloto.COMPANHIA
FROM piloto
LEFT OUTER JOIN `escala` ON piloto.CODP = escala.CODP
GROUP BY piloto.COMPANHIA
HAVING COUNT(DISTINCT escala.AVIAO) = 1;

-- Exercicio 3a.
SELECT NOMEP
FROM PILOTO
WHERE COMPANHIA IN
(SELECT COMPANHIA
FROM PILOTO
GROUP BY COMPANHIA
HAVING COUNT(CODP) > 1);

-- Exercicio 3b.
SELECT NOMEP
FROM PILOTO
WHERE SALARIO < (SELECT AVG(SALARIO) FROM PILOTO);