CREATE DATABASE WORLD_CUPS CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

USE WORLD_CUPS; 

CREATE TABLE COUNTRY (
id_host INT NOT NULL PRIMARY KEY,
name VARCHAR(80)
);

CREATE TABLE TEAM (
id_team INT NOT NULL PRIMARY KEY,
name VARCHAR(80),
confederation VARCHAR(25),
participations SMALLINT,
titles SMALLINT,
second_places SMALLINT,
third_places SMALLINT,
fourth_places SMALLINT,
games SMALLINT,
wins SMALLINT,
draws SMALLINT,
losses SMALLINT,
goals_scored SMALLINT,
goals_against SMALLINT
);

CREATE TABLE PLAYER (
id_player INT NOT NULL PRIMARY KEY,
name VARCHAR(80),
position VARCHAR(25),
participations SMALLINT,
titles SMALLINT,
games SMALLINT,
wins SMALLINT,
draws SMALLINT,
losses SMALLINT,
goals SMALLINT,
yellow_cards SMALLINT,
red_cards SMALLINT,
team_id INT,
FOREIGN KEY (team_id) REFERENCES TEAM (id_Team) ON DELETE CASCADE
);

CREATE TABLE WORLD_CUP (
id_world_cup INT NOT NULL PRIMARY KEY,
year SMALLINT,
host_id INT,
edition VARCHAR(10),
number_participants SMALLINT,
champion INT,
runner_up INT,
third_place INT,
fourth_place INT,
FOREIGN KEY (host_id) REFERENCES COUNTRY(id_host) ON DELETE CASCADE,
FOREIGN KEY (champion) REFERENCES TEAM(id_team) ON DELETE CASCADE,
FOREIGN KEY (runner_up) REFERENCES TEAM(id_team) ON DELETE CASCADE,
FOREIGN KEY (third_place) REFERENCES TEAM(id_team) ON DELETE CASCADE,
FOREIGN KEY (fourth_place) REFERENCES TEAM(id_team) ON DELETE CASCADE
);

CREATE TABLE GOLDEN_BALL (
id_golden_ball INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE SILVER_BALL (
id_silver_ball INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE BRONZE_BALL (
id_Bronze_Ball INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE GOLDEN_BOOT (
id_golden_boot INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
games SMALLINT,
goals SMALLINT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE SILVER_SHOE (
id_Silver_Shoe INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
games SMALLINT,
goals SMALLINT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE BRONZE_SHOE (
id_Bronze_Shoe INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
games SMALLINT,
goals SMALLINT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE BEST_YOUNG_PLAYER (
id_best_young_player INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE FAIR_PLAY (
id_fair_play INT NOT NULL PRIMARY KEY,
world_cup_id INT,
team_id INT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (team_id) REFERENCES TEAM(id_team) ON DELETE CASCADE
);

CREATE TABLE GOLDEN_GLOVE (
id_golden_glove INT NOT NULL PRIMARY KEY,
world_cup_id INT,
player_id INT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE CITY (
id_city INT NOT NULL PRIMARY KEY,
name VARCHAR(80),
country_id INT,
FOREIGN KEY (country_id) REFERENCES COUNTRY(id_host) ON DELETE CASCADE
);

CREATE TABLE STADIUM (
id_stadium INT NOT NULL PRIMARY KEY,
name VARCHAR(80),
capacity INT,
city_id INT,
FOREIGN KEY (city_id) REFERENCES CITY(id_city) ON DELETE CASCADE
);

CREATE TABLE COACH (
id_coach INT NOT NULL PRIMARY KEY,
name VARCHAR(80),
nationality VARCHAR(80),
participations SMALLINT,
titles SMALLINT,
games SMALLINT,
wins SMALLINT,
draws SMALLINT,
losses SMALLINT,
goals_scored SMALLINT,
goals_against SMALLINT
);

CREATE TABLE REFEREE (
id_referee INT NOT NULL PRIMARY KEY,
name VARCHAR(80),
nationality VARCHAR(80)
);

CREATE TABLE GAME (
id_game INT NOT NULL PRIMARY KEY,
world_cup_id INT,
description VARCHAR(80),
data DATE,
stadium_id INT,
attendance INT,
referee_id INT,
home_team_id INT,
away_team_id INT,
home_coach_id INT,
away_coach_id INT,
home_score SMALLINT,
away_score SMALLINT,
FOREIGN KEY (world_cup_id) REFERENCES WORLD_CUP(id_world_cup) ON DELETE CASCADE,
FOREIGN KEY (stadium_id) REFERENCES STADIUM(id_stadium) ON DELETE CASCADE,
FOREIGN KEY (referee_id) REFERENCES REFEREE(id_referee) ON DELETE CASCADE,
FOREIGN KEY (home_team_id) REFERENCES TEAM(id_team) ON DELETE CASCADE,
FOREIGN KEY (away_team_id) REFERENCES TEAM(id_team) ON DELETE CASCADE,
FOREIGN KEY (home_coach_id) REFERENCES COACH(id_coach) ON DELETE CASCADE,
FOREIGN KEY (away_coach_id) REFERENCES COACH(id_coach) ON DELETE CASCADE
);

CREATE TABLE GOAL (
id_goal INT NOT NULL PRIMARY KEY,
game_id INT,
player_id INT,
minuto SMALLINT,
FOREIGN KEY (game_id) REFERENCES GAME(id_game) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE OWN_GOAL (
id_own_goal INT NOT NULL PRIMARY KEY,
game_id INT,
player_id INT,
minuto SMALLINT,
FOREIGN KEY (game_id) REFERENCES GAME(id_game) ON DELETE CASCADE,
FOREIGN KEY (player_id) REFERENCES PLAYER(id_player) ON DELETE CASCADE
);

CREATE TABLE EXTRA_TIME (
id_extra_time INT NOT NULL PRIMARY KEY,
game_id INT,
home_score SMALLINT,
away_score SMALLINT,
FOREIGN KEY (game_id) REFERENCES GAME (id_game) ON DELETE CASCADE
);

CREATE TABLE PENALTY (
id_penalty INT NOT NULL PRIMARY KEY,
game_id INT,
home_score SMALLINT,
away_score SMALLINT,
FOREIGN KEY (game_id) REFERENCES GAME (id_game) ON DELETE CASCADE
);

select * from country;
select * from team;
select * from fair_play;

SELECT * FROM WORLD_CUP;

SELECT * FROM COACH;

-- 6 - Trazer cinco consultas com join. OK!
-- a - Os Times Campe??es das Copas (join world cup, team) (ou do 1?? ao 4?? lugar?)
SELECT CONCAT(YEAR, ' FIFA World Cup ', C.NAME) AS `WORLD CUP`, T1.NAME AS `CHAMPION`, T2.NAME  AS `2ND PLACE`, T3.NAME  AS `3RD PLACE`, T4.NAME  AS `4TH PLACE`
FROM WORLD_CUP WC
INNER JOIN COUNTRY C 
ON C.ID_HOST = WC.HOST_ID
INNER JOIN TEAM T1
ON T1.ID_TEAM = WC.champion
INNER JOIN TEAM T2
ON T2.ID_TEAM = WC.RUNNER_UP
INNER JOIN TEAM T3
ON T3.ID_TEAM = WC.THIRD_PLACE
INNER JOIN TEAM T4
ON T4.ID_TEAM = WC.FOURTH_PLACE
ORDER BY YEAR DESC;

-- b - Os Jogadores que marcaram os gols das finais (join goal, player, team)
SELECT P.NAME AS PLAYER, T.NAME AS TEAM, COUNT(*) AS `GOALS IN FINALS` FROM PLAYER P
INNER JOIN TEAM T ON P.TEAM_ID = T.ID_TEAM
INNER JOIN GOAL G ON G.PLAYER_ID = P.ID_PLAYER
INNER JOIN GAME GM ON GM.ID_GAME = G.GAME_ID AND `DESCRIPTION` LIKE 'Final%'
GROUP BY ID_PLAYER
ORDER BY `GOALS IN FINALS` DESC;

-- c - Os Times que venceram o Pr??mio de FIFA Fair Play. (join fair play, world cup, team, country)
SELECT CONCAT(YEAR, ' FIFA World Cup ', C.NAME) AS `World Cup`, GROUP_CONCAT(T.NAME SEPARATOR ' / ') AS `Fair Play Winner` FROM WORLD_CUP WC
INNER JOIN FAIR_PLAY FP ON FP.WORLD_CUP_ID = WC.ID_WORLD_CUP
INNER JOIN TEAM T ON T.ID_TEAM = FP.TEAM_ID
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
GROUP BY WC.ID_WORLD_CUP;

-- d - Os placares das finais.
-- d1 
SELECT CONCAT(YEAR, ' FIFA World Cup ', C.NAME) AS Final,
CONCAT(T1.NAME, ' ', G.HOME_SCORE, ' x ', G.AWAY_SCORE, ' ', T2.NAME) AS `Regular Time`, 
CONCAT(T1.NAME, ' ', ET.HOME_SCORE, ' x ', ET.AWAY_SCORE, ' ', T2.NAME) AS `Extra Time`,
CONCAT(T1.NAME, ' ', PK.HOME_SCORE, ' x ', PK.AWAY_SCORE, ' ', T2.NAME) AS `Penalties`
FROM GAME G
INNER JOIN WORLD_CUP WC ON WC.ID_WORLD_CUP = G.WORLD_CUP_ID
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
INNER JOIN TEAM T1 ON T1.ID_TEAM = G.HOME_TEAM_ID
INNER JOIN TEAM T2 ON T2.ID_TEAM = G.AWAY_TEAM_ID
LEFT JOIN EXTRA_TIME ET ON ET.GAME_ID = G.ID_GAME
LEFT JOIN PENALTY PK ON PK.GAME_ID = G.ID_GAME
WHERE `DESCRIPTION` LIKE 'Final%'
ORDER BY YEAR DESC;

-- d2 
SELECT CONCAT(YEAR, ' FIFA World Cup ') AS Game,
IF(IFNULL(PK.HOME_SCORE, IFNULL(G.HOME_SCORE + ET.HOME_SCORE, G.HOME_SCORE)) > IFNULL(PK.AWAY_SCORE, IFNULL(G.AWAY_SCORE + ET.AWAY_SCORE, G.AWAY_SCORE)), T1.NAME, T2.NAME) AS CHAMPION,
CONCAT(T1.NAME, ' ', IFNULL(PK.HOME_SCORE, IFNULL(G.HOME_SCORE + ET.HOME_SCORE, G.HOME_SCORE)), ' x ', IFNULL(PK.AWAY_SCORE, IFNULL(G.AWAY_SCORE + ET.AWAY_SCORE, G.AWAY_SCORE)), ' ', T2.NAME) AS `Final Result`, 
CONCAT(T1.NAME, ' ', G.HOME_SCORE, ' x ', G.AWAY_SCORE, ' ', T2.NAME) AS `At Regular Time`, 
CONCAT(T1.NAME, ' ', ET.HOME_SCORE, ' x ', ET.AWAY_SCORE, ' ', T2.NAME) AS `At Extra Time`,
CONCAT(T1.NAME, ' ', PK.HOME_SCORE, ' x ', PK.AWAY_SCORE, ' ', T2.NAME) AS `Penalties`
FROM GAME G
INNER JOIN WORLD_CUP WC ON WC.ID_WORLD_CUP = G.WORLD_CUP_ID
INNER JOIN TEAM T1 ON T1.ID_TEAM = G.HOME_TEAM_ID
INNER JOIN TEAM T2 ON T2.ID_TEAM = G.AWAY_TEAM_ID
LEFT JOIN EXTRA_TIME ET ON ET.GAME_ID = G.ID_GAME
LEFT JOIN PENALTY PK ON PK.GAME_ID = G.ID_GAME
WHERE `DESCRIPTION` LIKE 'Final%'
ORDER BY YEAR DESC;

-- e - Os Jogadores que ganharam a Golden Ball, Silver Ball e Bronze Ball
SELECT CONCAT(YEAR, ' FIFA World Cup ', C.NAME) AS `WORLD CUP`,
PGBL.NAME AS `GOLDEN BALL`,
PSB.NAME AS `SILVER BALL`,
PBB.NAME AS `BRONZE BALL`
FROM WORLD_CUP WC
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
LEFT JOIN GOLDEN_BALL GBL ON GBL.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN SILVER_BALL SB ON SB.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN BRONZE_BALL BB ON BB.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN PLAYER PGBL ON PGBL.ID_PLAYER = GBL.PLAYER_ID
LEFT JOIN PLAYER PSB ON PSB.ID_PLAYER = SB.PLAYER_ID
LEFT JOIN PLAYER PBB ON PBB.ID_PLAYER = BB.PLAYER_ID
ORDER BY YEAR DESC;

/*SELECT CONCAT(YEAR, ' World Cup ', C.NAME) AS `WORLD CUP`,
PGB.NAME AS `GOLDEN BOOT`,
PSS.NAME AS `SILVER SHOE`,
PBS.NAME AS `BRONZE SHOE`
FROM WORLD_CUP WC
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
LEFT JOIN GOLDEN_BOOT GB ON GB.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN SILVER_SHOE SS ON SS.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN BRONZE_SHOE BS ON BS.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN PLAYER PGB ON PGB.ID_PLAYER = GB.PLAYER_ID
LEFT JOIN PLAYER PSS ON PSS.ID_PLAYER = SS.PLAYER_ID
LEFT JOIN PLAYER PBS ON PBS.ID_PLAYER = BS.PLAYER_ID
ORDER BY YEAR DESC;*/


-- 7 - Trazer cinco consultas com order by. OK!
-- a - Os Jogadores com mais gols
SELECT `Name`, Games, Goals FROM PLAYER
WHERE GOALS > 0
ORDER BY GOALS DESC
LIMIT 30;

-- b - Os Times que mais participaram de copas
SELECT `NAME`, PARTICIPATIONS FROM TEAM
ORDER BY PARTICIPATIONS DESC
LIMIT 30;

-- c - Os Times campe??es
SELECT `NAME`, TITLES FROM TEAM
WHERE TITLES > 0
ORDER BY TITLES DESC;

-- d - Os Jogadores com mais participa????es em copas
SELECT `NAME`, PARTICIPATIONS FROM PLAYER
ORDER BY PARTICIPATIONS DESC
LIMIT 10;

-- e - Os Jogadores com mais jogos
SELECT `NAME`, GAMES FROM PLAYER
ORDER BY GAMES DESC
LIMIT 30;

-- 8 - Trazer cinco consultas com group by. OK!
-- a - Quantos times de cada conferencia foram campeoes (group by confederation)
SELECT Confederation, SUM(TITLES) AS `Number of Titles` FROM TEAM
GROUP BY CONFEDERATION
ORDER BY `Number of Titles` DESC;

-- b - Quantos times diferentes participaram (group by confederation)
SELECT Confederation, COUNT(*) AS `TIMES DIFERENTES QUE PARTICIPARAM` FROM TEAM
GROUP BY CONFEDERATION
ORDER BY `TIMES DIFERENTES QUE PARTICIPARAM` DESC;

-- c - Nacionalidades dos ju??zes que mais apitaram jogos (group by nationality)
SELECT NATIONALITY, COUNT(*) `VEZES QUE APITOU` FROM GAME G
INNER JOIN REFEREE R ON R.id_referee = G.referee_id
GROUP BY NATIONALITY
ORDER BY `VEZES QUE APITOU` DESC;

-- d - Nacionalidades mais presentes dos t??cnicos em copas (group by nationality)
SELECT NATIONALITY AS Country, COUNT(NATIONALITY) AS `Number of Coaches` FROM COACH
GROUP BY NATIONALITY
ORDER BY `Number of Coaches` DESC;

-- e - Cidades com mais jogos sediados nas copas
SELECT C.NAME AS City, COUNT(*) `Number of Games` FROM GAME G
INNER JOIN STADIUM S ON S.ID_STADIUM = G.STADIUM_ID
INNER JOIN CITY C ON C.ID_CITY = S.CITY_ID
GROUP BY C.NAME
ORDER BY `Number of Games` DESC;

-- 9 - Trazer tr??s consultas que combinem join e order by (sem repetir as anteriores).
-- a - Os Jogos com mais p??blico
SELECT ATTENDANCE, S.NAME AS `STADIUM`, CONCAT(`YEAR`, '   ', C.NAME) AS `WORLD CUP`, CONCAT(DESCRIPTION, '  -  ', TH.NAME, ' x ', TA.NAME) AS `MATCH` FROM GAME G
INNER JOIN WORLD_CUP WC ON WC.ID_WORLD_CUP = G.WORLD_CUP_ID
INNER JOIN TEAM TH ON TH.id_Team = G.HOME_TEAM_ID
INNER JOIN TEAM TA ON TA.id_Team = G.AWAY_TEAM_ID
INNER JOIN STADIUM S ON S.id_stadium = G.stadium_id
INNER JOIN COUNTRY C ON C.id_host = WC.host_id
ORDER BY ATTENDANCE DESC LIMIT 30;

-- b - Os Jogadores que Venceram o Golden Boot (join world cup, country e order by goals)
SELECT CONCAT(`YEAR`, '   ', C.NAME) AS `WORLD CUP`, P.NAME AS `GOLDEN BOOT WINNER`, GB.GAMES, GB.GOALS
FROM PLAYER P
INNER JOIN GOLDEN_BOOT GB
ON GB.PLAYER_ID = P.ID_PLAYER
INNER JOIN WORLD_CUP WC
ON WC.ID_WORLD_CUP = GB.WORLD_CUP_ID
INNER JOIN COUNTRY C
ON C.ID_HOST = WC.HOST_ID
ORDER BY GOALS DESC;

-- c - Os est??dios que o Brasil jogou no Penta, ordenados por capacidade ou por data ou por publico
SELECT S.NAME, CAPACITY, C.NAME AS CITY
FROM STADIUM S
INNER JOIN CITY C ON C.ID_CITY = S.CITY_ID
INNER JOIN GAME G ON G.STADIUM_ID = S.ID_STADIUM AND 
G.WORLD_CUP_ID = 16 AND (G.HOME_TEAM_ID = 4 OR G.AWAY_TEAM_ID = 4)
ORDER BY CAPACITY DESC;

SELECT S.NAME, CAPACITY, C.NAME AS CITY FROM STADIUM S
INNER JOIN CITY C ON C.ID_CITY = S.CITY_ID
INNER JOIN GAME G ON G.STADIUM_ID = S.ID_STADIUM AND 
(G.HOME_TEAM_ID = 4 OR G.AWAY_TEAM_ID = 4)
INNER JOIN WORLD_CUP WC ON WC.ID_WORLD_CUP = G.WORLD_CUP_ID AND WC.YEAR = 2002
ORDER BY CAPACITY DESC;


-- 10 - Trazer sete consultas que contemplem fun????es matem??ticas (e.g. AVG, SUM...)
-- a - Soma dos Gols das Sele????es por Confer??ncia
SELECT CONFEDERATION, SUM(GOALS_SCORED) AS `GOLS MARCADOS`, 
SUM(GOALS_AGAINST) AS `GOLS SOFRIDOS`,
SUM(GOALS_SCORED) - SUM(GOALS_AGAINST) AS SALDO FROM TEAM
GROUP BY CONFEDERATION
ORDER BY CONFEDERATION ASC;

-- b - Maiores N??meros de sele????es
SELECT 
(SELECT CONCAT(MAX(PARTICIPATIONS), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE PARTICIPATIONS = (SELECT MAX(PARTICIPATIONS) FROM TEAM) ORDER BY NAME) AS `MAIS PARTICIPA????ES`,
(SELECT CONCAT(MAX(TITLES), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE TITLES = (SELECT MAX(TITLES) FROM TEAM) ORDER BY NAME) AS `MAIS TITULOS`,
(SELECT CONCAT(MAX(SECOND_PLACES), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE SECOND_PLACES = (SELECT MAX(SECOND_PLACES) FROM TEAM) ORDER BY NAME) AS `MAIS 2??s LUGARES`,
(SELECT CONCAT(MAX(THIRD_PLACES), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE THIRD_PLACES = (SELECT MAX(THIRD_PLACES) FROM TEAM) ORDER BY NAME) AS `MAIS 3??s LUGARES`,
(SELECT CONCAT(MAX(FOURTH_PLACES), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE FOURTH_PLACES = (SELECT MAX(FOURTH_PLACES) FROM TEAM) ORDER BY NAME) AS `MAIS 4??s LUGARES`,
(SELECT CONCAT(MAX(GAMES), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE GAMES = (SELECT MAX(GAMES) FROM TEAM) ORDER BY NAME) AS `MAIS JOGOS`,
(SELECT CONCAT(MAX(WINS), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE WINS = (SELECT MAX(WINS) FROM TEAM) ORDER BY NAME) AS `MAIS VIT??RIAS`,
(SELECT CONCAT(MAX(DRAWS), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE DRAWS = (SELECT MAX(DRAWS) FROM TEAM) ORDER BY NAME) AS `MAIS EMPATES`,
(SELECT CONCAT(MAX(LOSSES), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE LOSSES = (SELECT MAX(LOSSES) FROM TEAM) ORDER BY NAME) AS `MAIS DERROTAS`,
(SELECT CONCAT(MAX(GOALS_SCORED), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE GOALS_SCORED = (SELECT MAX(GOALS_SCORED) FROM TEAM) ORDER BY NAME) AS `MAIS GOLS MARCADOS`,
(SELECT CONCAT(MAX(GOALS_AGAINST), ' - ' , GROUP_CONCAT(DISTINCT NAME SEPARATOR ' / ')) FROM TEAM WHERE GOALS_AGAINST = (SELECT MAX(GOALS_AGAINST) FROM TEAM) ORDER BY NAME) AS `MAIS GOLS SOFRIDOS`;

/*SELECT MAX(PARTICIPATIONS), MAX(TITLES), MAX(SECOND_PLACES), MAX(THIRD_PLACES), MAX(FOURTH_PLACES), 
MAX(GAMES), MAX(WINS), MAX(DRAWS), MAX(LOSSES), MAX(GOALS_SCORED), MAX(GOALS_AGAINST)
FROM TEAM;*/
-- SELECT * FROM TEAM WHERE GAMES = (SELECT MAX(GAMES) FROM TEAM) ORDER BY NAME

-- c - M??dia de p??blico das finais.
SELECT FLOOR(AVG(ATTENDANCE)) AS `M??dia de P??blico das Finais` FROM GAME
WHERE `DESCRIPTION` LIKE 'Final%';

-- d - Menor p??blico em um jogo de copa.
SELECT MIN(ATTENDANCE) FROM GAME;

-- e - Mostrar Copas do Mundo ??mpares
SELECT EDITION, YEAR, C.NAME AS `HOST` FROM WORLD_CUP
INNER JOIN COUNTRY C ON C.ID_HOST = WORLD_CUP.HOST_ID
WHERE MOD(CAST(EDITION AS UNSIGNED), 2) != 0
ORDER BY YEAR ASC;

-- f - Mostrar sele????es e seus percentuais de vitorias, empates e derrotas
SELECT NAME AS TEAM, GAMES, WINS, DRAWS, LOSSES,
CONCAT(ROUND((WINS / GAMES * 100), 2), ' %') AS `PERCENTUAL DE VITORIAS`, 
CONCAT(ROUND((DRAWS / GAMES * 100), 2), ' %') AS `PERCENTUAL DE EMPATES`, 
CONCAT(ROUND((LOSSES / GAMES * 100), 2), ' %') AS `PERCENTUAL DE DERROTAS` 
FROM TEAM
ORDER BY `PERCENTUAL DE VITORIAS` DESC;

-- g - Mostrar sele????es e suas m??dias de gols por jogo
SELECT NAME AS TEAM, GAMES, GOALS_SCORED, 
TRUNCATE(GOALS_SCORED / GAMES, 2) AS `M??DIA DE GOLS MARCADOS` FROM TEAM
ORDER BY `M??DIA DE GOLS MARCADOS` DESC;



-- 11 - Criar cinco vis??es.
-- a - Campanha de Brasil e Alemanha na Copa do Mundo de 2002
CREATE VIEW `2002_WC_FINALISTS_CAMPAIGNS_VIEW` AS
SELECT DESCRIPTION AS STAGE, DATA, S.NAME AS Stadium, CONCAT(TH.NAME, ' ', HOME_SCORE, ' x ', AWAY_SCORE, ' ', TA.NAME) AS `Match Result` FROM GAME G
INNER JOIN WORLD_CUP WC ON WC.ID_WORLD_CUP = G.WORLD_CUP_ID AND YEAR = 2002
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
INNER JOIN STADIUM S ON S.ID_STADIUM = G.STADIUM_ID
INNER JOIN TEAM TH ON TH.ID_TEAM = G.HOME_TEAM_ID
INNER JOIN TEAM TA ON TA.ID_TEAM = G.AWAY_TEAM_ID
WHERE G.HOME_TEAM_ID = 4 OR G.AWAY_TEAM_ID = 4 OR G.HOME_TEAM_ID = 8 OR G.AWAY_TEAM_ID = 8
ORDER BY YEAR, DATA ASC;

-- b - Todos os Gols do Ronaldo na Copa do Mundo de 2002.
-- b1
SELECT `DESCRIPTION`, MINUTO, T.NAME AS `OPPONENT` FROM GOAL
INNER JOIN GAME G ON G.ID_GAME = GOAL.GAME_ID
INNER JOIN PLAYER P ON P.ID_PLAYER = GOAL.PLAYER_ID
INNER JOIN TEAM T ON (T.ID_TEAM = G.HOME_TEAM_ID AND G.HOME_TEAM_ID != P.TEAM_ID) OR (T.ID_TEAM = G.AWAY_TEAM_ID AND G.AWAY_TEAM_ID != P.TEAM_ID)
WHERE GOAL.PLAYER_ID = 0
ORDER BY G.DATA, MINUTO ASC;

-- b2
CREATE VIEW `2002_WC_R9_GOALS_2_VIEW` AS
SELECT `DESCRIPTION`, GROUP_CONCAT(MINUTO SEPARATOR ', ') AS `MINUTOS DOS GOLS`, T.NAME AS `OPPONENT`, CONCAT(TH.NAME, ' ', G.HOME_SCORE, ' x ', G.AWAY_SCORE, ' ', TA.NAME) AS `FINAL SCORE` FROM GOAL
INNER JOIN GAME G ON G.ID_GAME = GOAL.GAME_ID
INNER JOIN PLAYER P ON P.ID_PLAYER = GOAL.PLAYER_ID
INNER JOIN TEAM T ON (T.ID_TEAM = G.HOME_TEAM_ID AND G.HOME_TEAM_ID != P.TEAM_ID) OR (T.ID_TEAM = G.AWAY_TEAM_ID AND G.AWAY_TEAM_ID != P.TEAM_ID)
INNER JOIN TEAM TH ON TH.ID_TEAM = G.HOME_TEAM_ID
INNER JOIN TEAM TA ON TA.ID_TEAM = G.AWAY_TEAM_ID
WHERE GOAL.PLAYER_ID = 0
GROUP BY G.ID_GAME
ORDER BY G.DATA, MINUTO ASC;

-- c - OS VENCEDORES DO GOLDEN BOOT, SILVER SHOE E BRONZE SHOE
CREATE VIEW BOOT_WINNERS AS
SELECT CONCAT(YEAR, ' World Cup ', C.NAME) AS `WORLD CUP`,
GROUP_CONCAT(DISTINCT PGB.NAME SEPARATOR ' / ') AS `GOLDEN BOOT`,
GROUP_CONCAT(DISTINCT PSS.NAME SEPARATOR ' / ') AS `SILVER SHOE`,
GROUP_CONCAT(DISTINCT PBS.NAME SEPARATOR ' / ') AS `BRONZE SHOE`
FROM WORLD_CUP WC
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
LEFT JOIN GOLDEN_BOOT GB ON GB.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN SILVER_SHOE SS ON SS.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN BRONZE_SHOE BS ON BS.WORLD_CUP_ID = WC.ID_WORLD_CUP
LEFT JOIN PLAYER PGB ON PGB.ID_PLAYER = GB.PLAYER_ID
LEFT JOIN PLAYER PSS ON PSS.ID_PLAYER = SS.PLAYER_ID
LEFT JOIN PLAYER PBS ON PBS.ID_PLAYER = BS.PLAYER_ID
GROUP BY YEAR
ORDER BY YEAR DESC;

SELECT * FROM BOOT_WINNERS;

-- d - Os artilheiros da Copa de 2002
CREATE VIEW `2002_WC_TOP_GOALSCORERS_VIEW` AS
SELECT P.NAME AS `PLAYER`, T.NAME AS `TEAM`, COUNT(*) AS GOALS FROM GOAL G
INNER JOIN GAME GM ON G.GAME_ID = GM.ID_GAME
INNER JOIN WORLD_CUP WC ON GM.WORLD_CUP_ID = WC.ID_WORLD_CUP
INNER JOIN PLAYER P ON G.PLAYER_ID = P.ID_PLAYER
INNER JOIN TEAM T ON P.TEAM_ID = T.ID_TEAM
WHERE WC.YEAR = 2002
GROUP BY P.ID_PLAYER
ORDER BY GOALS DESC;

-- e - Todas as goleadas das Copas do Mundo
CREATE VIEW `EVERY_GOLEADA_VIEW` AS
SELECT CONCAT(YEAR, ' FIFA World Cup ', C.NAME) AS `World Cup`, DESCRIPTION AS STAGE, DATA, CONCAT(TH.NAME, ' ', HOME_SCORE, ' x ', AWAY_SCORE, ' ', TA.NAME) AS RESULT FROM GAME G
INNER JOIN WORLD_CUP WC ON WC.ID_WORLD_CUP = G.WORLD_CUP_ID
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
INNER JOIN TEAM TH ON TH.ID_TEAM = G.HOME_TEAM_ID
INNER JOIN TEAM TA ON TA.ID_TEAM = G.AWAY_TEAM_ID
WHERE ABS(HOME_SCORE - AWAY_SCORE) > 2
ORDER BY DATA;

-- VIEW DA TABLE GAME
CREATE VIEW GAME_VIEW AS
SELECT CONCAT(YEAR, ' FIFA World Cup ', C.NAME) AS `World Cup`, DESCRIPTION, DATA, S.NAME AS Stadium, ATTENDANCE, CONCAT(R.NAME, ' (', R.NATIONALITY, ')') AS Referee, TH.NAME AS `Home Team`, HOME_SCORE AS `Home Score`, TA.NAME AS `Away Team`, AWAY_SCORE AS `Away Score` FROM GAME G
INNER JOIN WORLD_CUP WC ON WC.ID_WORLD_CUP = G.WORLD_CUP_ID
INNER JOIN COUNTRY C ON C.ID_HOST = WC.HOST_ID
INNER JOIN STADIUM S ON S.ID_STADIUM = G.STADIUM_ID
INNER JOIN REFEREE R ON R.ID_REFEREE = G.REFEREE_ID
INNER JOIN TEAM TH ON TH.ID_TEAM = G.HOME_TEAM_ID
INNER JOIN TEAM TA ON TA.ID_TEAM = G.AWAY_TEAM_ID
ORDER BY YEAR, DATA ASC;



-- 12 - Criar cinco savepoints.

START TRANSACTION;
SAVEPOINT `DEFAULT`;

UPDATE WORLD_CUP
SET
CHAMPION = 4,
RUNNER_UP = 44,
THIRD_PLACE = 14,
FOURTH_PLACE = 27
WHERE ID_WORLD_CUP = 21;
SAVEPOINT PALPITE_1;

UPDATE WORLD_CUP
SET
CHAMPION = 14,
RUNNER_UP = 18,
THIRD_PLACE = 4,
FOURTH_PLACE = 44
WHERE ID_WORLD_CUP = 21;
SAVEPOINT PALPITE_2;

UPDATE WORLD_CUP
SET
CHAMPION = 4,
RUNNER_UP = 27,
THIRD_PLACE = 14,
FOURTH_PLACE = 44
WHERE ID_WORLD_CUP = 21;
SAVEPOINT PALPITE_3;

UPDATE WORLD_CUP
SET
CHAMPION = 4,
RUNNER_UP = 18,
THIRD_PLACE = 14,
FOURTH_PLACE = 27
WHERE ID_WORLD_CUP = 21;
SAVEPOINT PALPITE_4;

-- 13 - Criar tr??s usu??rios distintos sendo que um deles s?? poder?? ter acesso ??s views, 
-- um s?? poder?? inserir dados sem ver e o outro apenas poder?? ver sem nenhuma outra a????o.

-- Usu??rio apenas com acesso ??s views
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY '1704';
GRANT SELECT ON WORLD_CUPS.`2002_WC_FINALISTS_CAMPAIGNS_VIEW` TO 'usuario1'@'localhost';
GRANT SELECT ON WORLD_CUPS.`2002_WC_R9_GOALS_2_VIEW` TO 'usuario1'@'localhost';
GRANT SELECT ON WORLD_CUPS.`2002_WC_TOP_GOALSCORERS_VIEW` TO 'usuario1'@'localhost';
GRANT SELECT ON WORLD_CUPS.BOOT_WINNERS TO 'usuario1'@'localhost';
GRANT SELECT ON WORLD_CUPS.EVERY_GOLEADA_VIEW TO 'usuario1'@'localhost';
GRANT SELECT ON WORLD_CUPS.GAME_VIEW TO 'usuario1'@'localhost';

-- Usu??rio que apenas pode inserir dados
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY '1234';
GRANT INSERT ON WORLD_CUPS.* TO 'usuario2'@'localhost';

-- Usu??rio que somente pode visualizar
CREATE USER 'usuario3'@'localhost' IDENTIFIED BY '4321';
GRANT SELECT ON WORLD_CUPS.* TO 'usuario3'@'localhost';

FLUSH PRIVILEGES;








INSERT INTO GOAL VALUES
(100, 1, 1, 100);

SELECT * FROM GOAL;

DELETE FROM GOAL
WHERE ID_GOAL > 99;

SELECT * FROM PENALTY;



SELECT * FROM CITY;

UPDATE CITY
SET 
COUNTRY_ID = COUNTRY_ID - 2
WHERE
COUNTRY_ID > 3;

UPDATE COUNTRY
SET
NAME = 'USA'
WHERE ID_HOST = 0;

SELECT * FROM GAME
WHERE ID_GAME = 17;

UPDATE GAME
SET
DESCRIPTION = 'Final *2nd Group Stage Match'
WHERE ID_GAME = 17;

CREATE VIEW WC_HOSTS AS
SELECT DISTINCT(ID_HOST), NAME FROM COUNTRY
INNER JOIN WORLD_CUP WC ON WC.HOST_ID = COUNTRY.ID_HOST
ORDER BY ID_HOST ASC; 

SELECT * FROM WC_HOSTS;

DROP VIEW WC_HOSTS;

DROP DATABASE WORLD_CUPS;



SELECT * FROM TEAM;
SELECT * FROM PLAYER WHERE TEAM_ID = 47;

UPDATE PLAYER
SET
	TEAM_ID = 41
    WHERE TEAM_ID = 47;
