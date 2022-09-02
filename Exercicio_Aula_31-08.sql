CREATE DATABASE produtos;

USE produtos;

CREATE TABLE prods(
codigo NUMERIC(3) NOT NULL,
nome VARCHAR(50) NOT NULL,
preco NUMERIC (5,2) NOT NULL,
tipo CHAR(1) NULL,
CONSTRAINT PK1 PRIMARY KEY (codigo));

INSERT INTO prods VALUES
(10, 'HD', 200, 'C'),
(11, 'Memoria', 250, 'C'),
(12, 'Impressora', 680, 'P'),
(13, 'Processador', 600, 'C'),
(14, 'DVD-RW', 2, 'S'),
(15, 'Papel A4', 19, 'S'),
(16, 'Scanner', 199, 'P');

SELECT * FROM prods;

/* Exercício A */
SELECT COUNT(nome) AS `Qtde Produtos`
FROM prods;


/* Exercício B */
SELECT DISTINCT tipo
FROM prods;


/* Exercício C.1 */
SELECT COUNT(tipo) AS `Qtde Produtos Componentes`
FROM prods WHERE tipo LIKE 'C';

SELECT COUNT(tipo) AS `Qtde Produtos Periféricos` 
FROM prods WHERE tipo LIKE 'P';

SELECT COUNT(tipo) AS `Qtde Produtos Suprimentos`
FROM prods WHERE tipo LIKE 'S';

/* Exercício C.2 */
SELECT 
    SUM(CASE WHEN tipo LIKE 'C' THEN 1 ELSE 0 END) AS `Qtde Componentes`,
    SUM(CASE WHEN tipo LIKE 'P' THEN 1 ELSE 0 END) AS `Qtde Periféricos`,
    SUM(CASE WHEN tipo = 'S' THEN 1 ELSE 0 END) AS `Qtde Suprimentos`
FROM prods; 

/* Exercício C.3 */
SELECT DISTINCT tipo AS `Tipos`,
    COUNT(tipo) AS `Quantidade`
    FROM prods
GROUP BY tipo;


/* Exercício D */
SELECT AVG(preco) AS `Média Preço Produtos`
FROM prods;


/* Exercício E */
SELECT AVG(preco) AS `Média Preço dos Suprimentos`
FROM prods WHERE tipo LIKE 'S';


/* Exercício F.1 */
SELECT AVG(preco) AS `Média Preço Componentes`
FROM prods WHERE tipo LIKE 'C';

SELECT AVG(preco) AS `Média Preço Periféricos`
FROM prods WHERE tipo LIKE 'P';

SELECT AVG(preco) AS `Média Preço Suprimentos`
FROM prods WHERE tipo LIKE 'S';

/* Exercício F.2 */
SELECT 
  AVG(CASE WHEN tipo LIKE 'P' THEN preco ELSE NULL END) AS `Media Preco Periferico`,
  AVG(CASE WHEN tipo = 'C' THEN preco ELSE NULL END) AS `Media Preco Componente`,
  AVG(CASE WHEN tipo = 'S' THEN preco ELSE NULL END) AS `Media Preco Suprimento`
FROM prods;

/* Exercício F.3 */
SELECT DISTINCT tipo,
  AVG(DISTINCT preco) AS `Media Preco`
  FROM prods
GROUP BY tipo;