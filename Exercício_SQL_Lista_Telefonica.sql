CREATE TABLE ASSINANTE (
cd_assinante INT NOT NULL PRIMARY KEY,
nm_assinante VARCHAR(100),
cd_ramo INT NOT NULL,
cd_tipo INT NOT NULL,
cd_end INT NOT NULL
);

CREATE TABLE RAMO_ATIVIDADE (
cd_ramo INT NOT NULL PRIMARY KEY,
ds_ramo VARCHAR(80)
);

CREATE TABLE TIPO_ASSINANTE (
cd_tipo INT NOT NULL PRIMARY KEY,
ds_tipo VARCHAR(80)
);

CREATE TABLE ENDERECO (
cd_endereco INT NOT NULL PRIMARY KEY,
ds_endereco VARCHAR(100),
complemento VARCHAR(50),
bairro VARCHAR(50),
cep VARCHAR(25),
cd_munic INT NOT NULL,
cd_fone INT NOT NULL
);

CREATE TABLE MUNICIPIO (
cd_municipio INT NOT NULL PRIMARY KEY,
ds_municipio VARCHAR(100)
);

CREATE TABLE TELEFONE (
cd_fone INT NOT NULL PRIMARY KEY,
CD_END INT,
ddd INT,
n_fone VARCHAR(50)
); 


ALTER TABLE ASSINANTE ADD CONSTRAINT FK_ASS_RAMO
FOREIGN KEY (cd_ramo) REFERENCES RAMO_ATIVIDADE(cd_ramo) ON DELETE RESTRICT; 

ALTER TABLE ASSINANTE ADD CONSTRAINT FK_ASS_TIPO
FOREIGN KEY (cd_tipo) REFERENCES TIPO_ASSINANTE(cd_tipo) ON DELETE RESTRICT; 

ALTER TABLE ASSINANTE ADD CONSTRAINT FK_ASS_END
FOREIGN KEY (cd_end) REFERENCES ENDERECO(cd_endereco) ON DELETE RESTRICT; 

ALTER TABLE ENDERECO ADD CONSTRAINT FK_END_MUNIC
FOREIGN KEY (cd_munic) REFERENCES MUNICIPIO(cd_municipio) ON DELETE RESTRICT; 

ALTER TABLE TELEFONE ADD CONSTRAINT FK_END_FONE
FOREIGN KEY (cd_end) REFERENCES ENDERECO(cd_endereco) ON DELETE RESTRICT; 


-- cd_municipio / ds_municipio
INSERT INTO MUNICIPIO VALUES
(1, 'São Leopoldo'),
(2, 'Novo Hamburgo'),
(3, 'Sapucaia'),
(4, 'Porto Alegre'),
(5, 'Pelotas'),
(6, 'Canguçu');

-- cd_endereco, ds_endereco, complemento, cep, cd_munic, cd_fone
INSERT INTO ENDERECO VALUES
(1, 'Rua Anna Nery', '211', 'Campina', '93.130-180', 1, 1), 
(2, 'Av Henrique Bier', '543', 'Campina', '93.130-210', 1, 2), 
(3, 'Av. Independencia', '1201', 'Centro', '93.580-000', 1, 3),
(4, 'Av. São Borja', '1701', 'São Borja', '93.741-020', 1, 3),
(5, 'R. Rafael Pinto Bandeira', '2120', 'Areal', '96.020-690', 5, 5),
(6, 'R. Oswaldo Aranha', '127', 'Centro', '96600-000', 6, 7),
(7, 'R. Marcílio Dias', '1090', 'Centro', '96.020-480', 5, 6),
(8, 'R. Dr. Nunes Viêira', '378', 'Três Vendas', '96.055-560', 5, 8);

-- cd_fone, CD_END, ddd, n_fone
INSERT INTO TELEFONE VALUES
(1, 1, 51, '3592-0128'),
(2, 2, 51, '3592-1704'),
(3, 3, 51, '3592-0965'),
(4, 1, 51, '3509-2652'),
(5, 5, 53, '3229-2029'),
(6, 7, 53, '3222-6708'),
(7, 6, 53, '3252-3078'),
(8, 8, 53, '3253-6179'),
(9, 8, 53, '99842-1103');

-- cd_ramo, ds_ramo
INSERT INTO RAMO_ATIVIDADE VALUES
(1, 'TI - Programação'),
(2, 'Metalurgia'),
(3, 'Enfermagem'),
(4, 'Alimentação'),
(5, 'Comércio');

-- cd_tipo, ds_tipo
INSERT INTO TIPO_ASSINANTE VALUES
(1, 'Residencial'),
(2, 'Comercial');

-- cd_assinante, nm_assinante, cd_ramo, cd_tipo, cd_end
INSERT INTO ASSINANTE VALUES
(1, 'DOUGLAS', 1, 1, 1),
(2, 'CONTEC', 1, 2, 2),
(3, 'MARIA', 3, 1, 3),
(4, 'METALURGICA SL', 2, 2, 4),
(5, 'Bistrô Pelotense', 4, 2, 5), -- Pelotas
(6, 'Pormenos', 5, 2, 6), -- Canguçu
(7, 'Ristorante Vesúvio', 4, 2, 7), -- Pelotas
(8, 'Carlos', 5, 1, 8); -- Pelotas

-- Ex1 - Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones correspondentes.
SELECT nm_assinante AS Nome, ds_endereco AS Logradouro, complemento AS `Número`,
bairro AS Bairro, ds_municipio AS `Município`, ddd, n_fone AS Telefone 
FROM ASSINANTE a
INNER JOIN ENDERECO e ON a.cd_end = e.cd_endereco
INNER JOIN MUNICIPIO m ON e.cd_munic = m.cd_municipio
INNER JOIN TELEFONE t ON e.cd_fone = t.cd_fone;

-- Ex2 - Listar os nomes dos assinantes, seguido do seu ramo, ordenados por ramo e posteriormente por nome.
SELECT nm_assinante AS `ASSINANTE`, ds_ramo AS `RAMO ATIVIDADE`
FROM ASSINANTE A 
INNER JOIN RAMO_ATIVIDADE RA
ON RA.cd_ramo = A.cd_ramo
ORDER BY ds_ramo, nm_assinante ASC;

-- Ex3 - Listar os assinantes do município de Pelotas que são do tipo residencial.
SELECT * FROM ASSINANTE A 
INNER JOIN ENDERECO E 
ON E.cd_endereco = A.cd_end 
INNER JOIN MUNICIPIO M 
ON M.cd_municipio = E.cd_munic AND M.ds_municipio = 'Pelotas'
INNER JOIN TIPO_ASSINANTE TA 
ON TA.cd_tipo = A.cd_tipo AND TA.ds_tipo = 'Residencial'
ORDER BY A.nm_assinante ASC;

-- Ex4 - Listar os nomes dos assinantes que possuem mais de um telefone.
SELECT nm_assinante AS `ASSINANTE`
FROM ASSINANTE A 
INNER JOIN ENDERECO E
ON A.CD_END = E.cd_endereco
INNER JOIN TELEFONE T 
ON T.CD_END = E.cd_endereco
GROUP BY nm_assinante
HAVING COUNT(nm_assinante) > 1;

-- Ex5 - Listar os nomes dos assinantes seguido do número de telefone, tipo de assinante comercial, com endereço em Pelotas ou Canguçu.
SELECT nm_assinante AS `Assinante`, DDD, N_FONE AS `Telefone`
FROM ASSINANTE A 
INNER JOIN TIPO_ASSINANTE TA 
ON TA.cd_tipo = A.cd_tipo AND TA.ds_tipo = 'Comercial'
INNER JOIN ENDERECO E 
ON E.cd_endereco = A.CD_END
INNER JOIN MUNICIPIO M 
ON M.cd_municipio = E.cd_munic AND (M.ds_municipio = 'Pelotas' OR M.ds_municipio = 'Canguçu')
INNER JOIN TELEFONE T 
ON T.CD_END = E.cd_endereco;


