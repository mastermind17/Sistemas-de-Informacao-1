use FIFA

create table Country
(
	name varchar(16),
	primary key (name)
)

create table Competition
(
	cod varchar(10),
	country varchar(16) foreign key references Country(name),
	description varchar(200),
	primary key (cod,country)
)

create table Season
(
	designation varchar(10), -- 2014/2015
	description varchar(200),
	competition varchar(10),
	country varchar(16),
	foreign key (competition,country) references Competition(cod,country),
	primary key (designation,competition,country)
)

create table Fixture
(
	fixture int,
	season varchar(10),
	competition varchar(10),
	country varchar(16),
	foreign key (season,competition,country) references Season(designation,competition,country),
	primary key (fixture,season,competition,country)
)

create table address
(
	address varchar(128),
	primary key (address)
)

create table Stadium
(
	name varchar(128),
	capacity int,
	address varchar(128),
	foreign key (address) references address(address),
	primary key (name)
)

create table Team
(
	cod varchar(20),
	name varchar(64) unique,
	country varchar(16),
	foreign key (country) references Country(name),
	primary key (cod,country)
)

-- M-N
create table Team_Stadium
(
	stadium varchar(128),
	foreign key (stadium) references Stadium(name),
	team varchar(20),
	teamCountry varchar(16),
	foreign key(team, teamCountry) references Team(cod,country),
	primary key (stadium,team,teamCountry)
)

create table Player
(
	bi int,
	nif int unique,
	name varchar(64),
--	birthDate varchar(16),
	birthDate DATE,

	playerCountry varchar(16),
	foreign key (playerCountry) references Country(name),

	team varchar(20),
	teamCountry varchar(16),
	foreign key (team,teamCountry) references Team(cod,country),

	address varchar(128),
	foreign key (address) references Address(address),

	primary key (bi,playerCountry)
)

create table Ban
(
	id int identity (1,1),
--	beginDate varchar(16),
--	endDate varchar(16),
	beginDate date,
	endDate date,
	player int,
	playerCountry varchar(16),
	foreign key (player,playerCountry) references Player(bi,playerCountry),
	primary key (id)
)

create table Home_Team
(
	-- tipoEquipa = casa ou fora
	team varchar(20),
	teamCountry varchar(16),
	foreign key (team,teamCountry) references Team(cod,country),
	primary key (team,teamCountry)
)

create table Away_Team
(
	-- tipoEquipa = casa ou fora
	team varchar(20),
	teamCountry varchar(16),
	foreign key (team,teamCountry) references Team(cod,country),
	primary key (team,teamCountry)
)

create table Game
(
	num int,
	homeGoals int,
	awayGoals int,
--	gameDate varchar(16),
	gameDate date,
	gameTime varchar(16),
	gameState varchar(16),

	fixture int,
	season varchar(10),
	competition varchar(10),
	country varchar(16),
	foreign key (fixture,season,competition,country) references Fixture(fixture,season,competition,country),

	homeTeam varchar(20),
	homeTeamCountry varchar(16),
	foreign key (homeTeam,homeTeamCountry) references Home_Team(team,teamCountry),

	awayTeam varchar(20),
	awayTeamCountry varchar(16),
	foreign key (awayTeam,awayTeamCountry) references Away_Team(team,teamCountry),

	-- MVP
	player int,
	playerCountry varchar(16),
	foreign key (player,playerCountry) references Player(bi,playerCountry),

	primary key (num,fixture,season,competition,country)
)


create table Game_Stats_Type
(
	statType int,
	description varchar(16),
	primary key (statType)
)

-- tipo
-- 1 : golo
-- 2 : cartão amarelo
-- 3 : cartão vermelho
create table Game_Stats
(
	id int identity (1,1),
	homeAway varchar(10),
	statMinute int,
	statSecond int,
	statOrder int,
	
	game int,
	fixture int,
	season varchar(10),
	competition varchar(10),
	gameCountry varchar(16),
	foreign key (game,fixture,season,competition,gameCountry) references Game(num,fixture,season,competition,country),

	statType int,
	check (statType < 4),
	foreign key (statType) references Game_Stats_Type(statType),

	player int,
	playerCountry varchar(16),
	foreign key (player,playerCountry) references Player(bi,playerCountry),

	team varchar(20),
	teamCountry varchar(16),
	foreign key (team,teamCountry) references Team(cod,country),

	primary key (id)
)

-- relação N-N época-equipa
create table Season_Team
(
	season varchar(10),
	competition varchar(10),
	country varchar(16),
	foreign key (season,competition,country) references Season(designation,competition,country),

	team varchar(20),
	teamCountry varchar(16),
	foreign key (team,teamCountry) references Team(cod,country),

	primary key (season,competition,country,team,teamCountry)
)

--relação N-N Season_Team-Jogador
create table Season_Team_Players
(
	player int,
	playerCountry varchar(16),
	foreign key (player,playerCountry ) references Player(bi,playerCountry),

	season varchar(10),
	competition varchar(10),
	country varchar(16),
	team varchar(20),
	teamCountry varchar(16),
	foreign key (season,competition,country,team,teamCountry) references Season_Team(season,competition,country,team,teamCountry),

	beginDate date,
	endDate date,

	primary key (player,playerCountry,season,competition,country,team,teamCountry)
)

--Convocatória
create table Lineup
(
	team varchar(20),
	teamCountry varchar(16),
	foreign key (team,teamCountry) references Team(cod,country),

	game int,
	fixture int,
	season varchar(10),
	competition varchar(10),
	gameCountry varchar(16),
	foreign key (game,fixture,season,competition,gameCountry) references Game(num,fixture,season,competition,country),

	primary key (team,teamCountry,game,fixture,season,competition,gameCountry)
)

create table LineupPlayer
(
	player int,
	playerCountry varchar(16),
	foreign key (player,playerCountry) references Player(bi,playerCountry),

	team varchar(20),
	teamCountry varchar(16),
	game int,
	fixture int,
	season varchar(10),
	competition varchar(10),
	gameCountry varchar(16),
	foreign key (team,teamCountry,game,fixture,season,competition,gameCountry) references Lineup(team,teamCountry,game,fixture,season,competition,gameCountry),

	starter bit,

	primary key (player,playerCountry,team,teamCountry,game,fixture,season,competition,gameCountry)
)

create table Season_Statistics
(
	season varchar(10),
	competition varchar(10),
	country varchar(16),
	foreign key (season,competition,country) references Season(designation,competition,country),

	primary key (season,competition,country)
)

create table Season_Statistics_Competition
(
	season varchar(10),
	competition varchar(10),
	country varchar(16),
	foreign key (season,competition,country) references Season_Statistics(season,competition,country),

	games int,
	victories int,
	draws int,
	goalsPerGame int,

	primary key (season,competition,country)
)

create table Season_Statistics_Team
(
	season varchar(10),
	competition varchar(10),
	seasonCountry varchar(16),
	foreign key (season,competition,seasonCountry) references Season_Statistics(season,competition,country),

	team varchar(20),
	teamCountry varchar(16),
	foreign key (team,teamCountry) references Team(cod,country),

	games int,
	victories int,
	goalsScored int,
	goalsAgainst int,

	primary key (team,teamCountry,season,competition,seasonCountry)
)

create table Season_Statistics_Player
(
	season varchar(10),
	competition varchar(10),
	seasonCountry varchar(16),
	foreign key (season,competition,seasonCountry) references Season_Statistics(season,competition,country),

	player int,
	playerCountry varchar(16),
	foreign key (player,playerCountry) references Player(bi,playerCountry),

	games int,
	goals int,
	cardsPerGame int,
	goalsPerGame int,

	primary key (player,playerCountry,season,competition,seasonCountry)
)

