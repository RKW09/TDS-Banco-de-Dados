CREATE DATABASE MOVIES;

USE MOVIES;

CREATE TABLE Filmes
(
titulo VARCHAR(250),
ano INT(4),
diretor VARCHAR(100),
genero VARCHAR(20),
atoresPrincipais VARCHAR(1000),
duracao INT(4), -- em minutos
valorIngresso REAL(5,2)
);

SELECT * FROM Filmes;

-- Exercício a:
SELECT DISTINCT atoresPrincipais FROM Filmes 
WHERE genero = "terror" 
ORDER BY atoresPrincipais DESC;

-- Exercício b:
SELECT titulo FROM Filmes
WHERE (ano BETWEEN 1901 AND 2000)
AND (duracao < 70);

-- Exercício c:
SELECT titulo, diretor, (valorIngresso/duracao) AS PrecoMinuto 
FROM Filmes;
-- Alias por coluna titulo AS Nome, diretor as Director, etc

-- Exercício d:
SET SQL_SAFE_UPDATES = 0;

UPDATE Filmes
SET valorIngresso = valorIngresso + (valorIngresso * 2.7/100) 
WHERE atoresPrincipais LIKE '%Nicholas Cage%';

SET SQL_SAFE_UPDATES = 1;

-- Exercício e:
DELETE FROM Filmes
WHERE (valorIngresso/duracao) < 0.13;

-- Exercício f:
INSERT INTO Filmes VALUES
("Titanic 3D", 1997, "James Cameron", "Romance", 
"Leonardo DiCaprio, Kate Winslet", 194, 18.00);