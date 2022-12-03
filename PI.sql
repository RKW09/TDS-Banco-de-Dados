CREATE DATABASE DESAPARECIDOS;

USE DESAPARECIDOS;

CREATE TABLE USUARIO (
id_usuario INT NOT NULL PRIMARY KEY,
nome_completo VARCHAR(255),
email VARCHAR(100),
username VARCHAR(80),
senha VARCHAR(25)
);

CREATE TABLE MENSAGEM (
id_mensagem INT NOT NULL PRIMARY KEY,
autor_id INT,
data DATETIME,
titulo VARCHAR(100),
conteudo VARCHAR(255),
FOREIGN KEY (autor_id) REFERENCES USUARIO (id_usuario) ON DELETE CASCADE
);

CREATE TABLE RESPOSTA (
id_resposta INT NOT NULL PRIMARY KEY,
mensagem_id INT,
autor_id INT,
data DATETIME,
conteudo VARCHAR(255),
FOREIGN KEY (mensagem_id) REFERENCES MENSAGEM (id_mensagem) ON DELETE CASCADE
);

CREATE TABLE ENDERECO (
id_endereco INT NOT NULL PRIMARY KEY,
logradouro VARCHAR(255),
bairro VARCHAR(100),
cidade VARCHAR(100),
estado VARCHAR(100),
pais VARCHAR(100),
informacao_extra VARCHAR(255)
);

CREATE TABLE PESSOA (
id_pessoa INT NOT NULL PRIMARY KEY,
nome_completo VARCHAR(255),
cpf VARCHAR(80),
data_nasc DATE,
altura_estimada VARCHAR(10),
peso_estimado VARCHAR(10),
caracteristicas_fisicas VARCHAR(255),
informacao_extra VARCHAR(255),
residente_em INT,
FOREIGN KEY (residente_em) REFERENCES ENDERECO (id_endereco) ON DELETE SET NULL
);

CREATE TABLE DESAPARECIMENTO (
id_desaparecimento INT NOT NULL PRIMARY KEY,
pessoa_id INT,
numero_bo VARCHAR(100),
data DATE,
ultimo_local_visto INT,
informacao_extra VARCHAR(255),
FOREIGN KEY (pessoa_id) REFERENCES PESSOA (id_pessoa) ON DELETE CASCADE,
FOREIGN KEY (ultimo_local_visto) REFERENCES ENDERECO (id_endereco) ON DELETE SET NULL
);

CREATE TABLE AVISTADO (
id_avistado INT NOT NULL PRIMARY KEY,
desaparecimento_id INT,
data DATETIME,
local_avistamento INT,
informacao_extra VARCHAR(255),
FOREIGN KEY (desaparecimento_id) REFERENCES DESAPARECIMENTO (id_desaparecimento) ON DELETE CASCADE,
FOREIGN KEY (local_avistamento) REFERENCES ENDERECO (id_endereco) ON DELETE SET NULL
);

CREATE TABLE ENCONTRADO (
id_encontrado INT NOT NULL PRIMARY KEY,
desaparecimento_id INT,
data DATETIME,
local_encontrado INT,
FOREIGN KEY (desaparecimento_id) REFERENCES DESAPARECIMENTO (id_desaparecimento) ON DELETE CASCADE,
FOREIGN KEY (local_encontrado) REFERENCES ENDERECO (id_endereco) ON DELETE SET NULL
);

