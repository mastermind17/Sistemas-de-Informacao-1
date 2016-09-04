use FIFA

--inserir 2 países
insert into Country values('Portugal')
insert into Country values('Espanha')
insert into Country values('Angola')
insert into Country values('Brasil')
insert into Country values('Argentina')
insert into Country values('Alemanha')

--inserir 2 competições
insert into Competition values('LPF','Portugal','Liga Portuguesa')
insert into Competition values('LEF','Espanha','Liga Espanhola')

--inserir 3 épocas
insert into Season values ('2014/2015','Liga Portuguesa época 2014/2015','LPF','Portugal')
insert into Season values ('2013/2014','Liga Portuguesa época 2013/2014','LPF','Portugal')
insert into Season values ('2014/2015','Liga Espanhola época 2014/2015','LEF','Espanha')

--inserir 4 equipas portuguesas
insert into Team values ('Cascalheira','Futebol Clube Cascalheira','Portugal')
insert into Home_Team values ('Cascalheira','Portugal')
insert into Away_Team values ('Cascalheira','Portugal')
insert into Team values ('Benfica','Sport Lisboa Benfica','Portugal')
insert into Home_Team values ('Benfica','Portugal')
insert into Away_Team values ('Benfica','Portugal')
insert into Team values ('Alverca','Futebol Clube Alverca','Portugal')
insert into Home_Team values ('Alverca','Portugal')
insert into Away_Team values ('Alverca','Portugal')
insert into Team values ('Alvarinhos','Associação Futebol Alvarinhos','Portugal')
insert into Home_Team values ('Alvarinhos','Portugal')
insert into Away_Team values ('Alvarinhos','Portugal')

--inserir moradas
insert into Address values ('Rua da Cabine')
insert into Address values ('CUF Descobertas')
insert into Address values ('Amazonia')
insert into Address values ('Avenida General Norton de Matos')
insert into Address values ('Moscavide')
insert into Address values ('Jamaica')
insert into Address values ('Sobralinho')
insert into Address values ('CC')

--inserir jogadores nas 4 equipas
--jogadores Cascalheira
insert into Player values (9,99,'Schafaaaa','2009-09-20','Alemanha','Cascalheira','Portugal','Rua da Cabine')
insert into Player values (10,100,'xpto','2009-09-20','Portugal','Cascalheira','Portugal','Rua da Cabine')
insert into Player values (11,101,'puto','2009-09-20','Portugal','Cascalheira','Portugal','Rua da Cabine')
insert into Player values (12,102,'Ronaldo','2009-09-20','Portugal','Cascalheira','Portugal',null)
insert into Player values (13,103,'anao','2009-09-20','Portugal','Cascalheira','Portugal','Moscavide')
insert into Player values (14,104,'zarolho','2009-09-20','Portugal','Cascalheira','Portugal','CC')
insert into Player values (15,105,'gluglu','2009-09-20','Portugal','Cascalheira','Portugal',null)
insert into Player values (16,106,'L','2009-09-20','Portugal','Cascalheira','Portugal',null)
--jogadores Alvarinhos
insert into Player values (17,107,'Tyson','2009-09-20','Portugal','Alvarinhos','Portugal','Rua da Cabine')
insert into Player values (18,108,'Andre','2009-09-20','Portugal','Alvarinhos','Portugal','Rua da Cabine')
insert into Player values (19,109,'Tome','2009-09-20','Portugal','Alvarinhos','Portugal', null)
insert into Player values (20,110,'Mofo','2009-09-20','Portugal','Alvarinhos','Portugal','Rua da Cabine')
insert into Player values (21,111,'Primo do Tome','2009-09-20','Portugal','Alvarinhos','Portugal','Rua da Cabine')
insert into Player values (22,112,'Joana','2009-09-20','Portugal','Alvarinhos','Portugal','Rua da Cabine')
--jogadores Alverca
insert into Player values (23,113,'Mantorras','2009-09-20','Angola','Alverca','Portugal','CUF Descobertas')
insert into Player values (24,114,'Deco','2009-09-20','Brasil','Alverca','Portugal','Amazonia')
insert into Player values (54,154,'Deco','2009-09-20','Portugal','Alverca','Portugal','Amazonia')
insert into Player values (25,115,'Orelhas','2009-09-20','Portugal','Alverca','Portugal','Avenida General Norton de Matos')
insert into Player values (26,116,'Vieira','2009-09-20','Portugal','Alverca','Portugal','Avenida General Norton de Matos')
insert into Player values (27,117,'Nuno Assis','2009-09-20','Portugal','Alverca','Portugal',null)
insert into Player values (28,118,'Maniche','2009-09-20','Portugal','Alverca','Portugal',null)
insert into Player values (29,119,'Ricardo Carvalho','2009-09-20','Portugal','Alverca','Portugal',null)
insert into Player values (30,120,'Emilio Peixe','2009-09-20','Portugal','Alverca','Portugal',null)
insert into Player values (31,121,'Legionella','2009-09-20','Portugal','Alverca','Portugal',null)
--jogadores do Maior
insert into Player values (32,122,'Talisca','2009-09-20','Brasil','Benfica','Portugal','Amazonia')
insert into Player values (33,123,'Jonas Pistolas','2009-09-20','Brasil','Benfica','Portugal','Amazonia')
insert into Player values (34,124,'Django Lima','2009-09-20','Brasil','Benfica','Portugal',null)
insert into Player values (35,125,'P. Enzo','2009-09-20','Argentina','Benfica','Portugal',null)
insert into Player values (36,126,'P. Pizzi','2009-09-20','Portugal','Benfica','Portugal',null)
insert into Player values (37,127,'Velhinho da Paragem','2009-09-20','Brasil','Benfica','Portugal','Amazonia')
insert into Player values (38,128,'Eliseu','2009-09-20','Portugal','Benfica','Portugal',null)
insert into Player values (41,131,'João Capela','2009-09-20','Portugal','Benfica','Portugal',null)
insert into Player values (42,132,'Rui Vitória','2009-09-20','Portugal','Benfica','Portugal',null)
insert into Player values (43,133,'JJ','2009-09-20','Portugal','Benfica','Portugal',null)
insert into Player values (44,134,'Proença','2009-09-20','Portugal','Benfica','Portugal',null)
insert into Player values (45,135,'Boi','2009-09-20','Portugal','Benfica','Portugal','Avenida General Norton de Matos')
insert into Player values (40,130,'Falcão','2009-09-20','Portugal','Benfica','Portugal',null)

--inserir registos das épocas
--2013/2014
--equipa Benfica
insert into Season_Team values ('2013/2014','LPF','Portugal','Benfica','Portugal')
insert into Season_Team_Players values (32,'Brasil','2013/2014','LPF','Portugal','Benfica','Portugal',null,null)
insert into Season_Team_Players values (33,'Brasil','2013/2014','LPF','Portugal','Benfica','Portugal',null,null)
insert into Season_Team_Players values (37,'Brasil','2013/2014','LPF','Portugal','Benfica','Portugal',null,null)
--equipa Alverca
insert into Season_Team values ('2013/2014','LPF','Portugal','Alverca','Portugal')
insert into Season_Team_Players values (23,'Angola','2013/2014','LPF','Portugal','Alverca','Portugal',null,null)
insert into Season_Team_Players values (24,'Brasil','2013/2014','LPF','Portugal','Alverca','Portugal',null,null)
insert into Season_Team_Players values (31,'Portugal','2013/2014','LPF','Portugal','Alverca','Portugal',null,null)
--equipa Cascalheira
insert into Season_Team values ('2013/2014','LPF','Portugal','Cascalheira','Portugal')
insert into Season_Team_Players values (10,'Portugal','2013/2014','LPF','Portugal','Cascalheira','Portugal',null,null)
insert into Season_Team_Players values (15,'Portugal','2013/2014','LPF','Portugal','Cascalheira','Portugal',null,null)
insert into Season_Team_Players values (16,'Portugal','2013/2014','LPF','Portugal','Cascalheira','Portugal',null,null)
--equipa Alvarinhos
insert into Season_Team values ('2013/2014','LPF','Portugal','Alvarinhos','Portugal')
insert into Season_Team_Players values (17,'Portugal','2013/2014','LPF','Portugal','Alvarinhos','Portugal',null,null)
insert into Season_Team_Players values (19,'Portugal','2013/2014','LPF','Portugal','Alvarinhos','Portugal',null,null)
insert into Season_Team_Players values (21,'Portugal','2013/2014','LPF','Portugal','Alvarinhos','Portugal',null,null)
--2014/2015
--equipa Benfica
insert into Season_Team values ('2014/2015','LPF','Portugal','Benfica','Portugal')
insert into Season_Team_Players values (32,'Brasil','2014/2015','LPF','Portugal','Benfica','Portugal',null,null)
insert into Season_Team_Players values (33,'Brasil','2014/2015','LPF','Portugal','Benfica','Portugal',null,null)
insert into Season_Team_Players values (37,'Brasil','2014/2015','LPF','Portugal','Benfica','Portugal',null,null)
--equipa Alverca
insert into Season_Team values ('2014/2015','LPF','Portugal','Alverca','Portugal')
insert into Season_Team_Players values (23,'Angola','2014/2015','LPF','Portugal','Alverca','Portugal',null,null)
insert into Season_Team_Players values (24,'Brasil','2014/2015','LPF','Portugal','Alverca','Portugal',null,null)
insert into Season_Team_Players values (31,'Portugal','2014/2015','LPF','Portugal','Alverca','Portugal',null,null)
--equipa Cascalheira
insert into Season_Team values ('2014/2015','LPF','Portugal','Cascalheira','Portugal')
insert into Season_Team_Players values (9,'Alemanha','2014/2015','LPF','Portugal','Cascalheira','Portugal',null,null)
insert into Season_Team_Players values (10,'Portugal','2014/2015','LPF','Portugal','Cascalheira','Portugal',null,null)
insert into Season_Team_Players values (13,'Portugal','2014/2015','LPF','Portugal','Cascalheira','Portugal',null,null)
insert into Season_Team_Players values (14,'Portugal','2014/2015','LPF','Portugal','Cascalheira','Portugal',null,null)
insert into Season_Team_Players values (15,'Portugal','2014/2015','LPF','Portugal','Cascalheira','Portugal',null,null)
insert into Season_Team_Players values (16,'Portugal','2014/2015','LPF','Portugal','Cascalheira','Portugal',null,null)
--equipa Alvarinhos
insert into Season_Team values ('2014/2015','LPF','Portugal','Alvarinhos','Portugal')
insert into Season_Team_Players values (17,'Portugal','2014/2015','LPF','Portugal','Alvarinhos','Portugal',null,null)
insert into Season_Team_Players values (19,'Portugal','2014/2015','LPF','Portugal','Alvarinhos','Portugal',null,null)
insert into Season_Team_Players values (21,'Portugal','2014/2015','LPF','Portugal','Alvarinhos','Portugal',null,null)

--inserir 2 jornadas 2013/2014 Portugal
insert into Fixture values (1,'2013/2014','LPF','Portugal')
insert into Fixture values (2,'2013/2014','LPF','Portugal')

--inserir 2 jornadas 2014/2015 Portugal
insert into Fixture values (1,'2014/2015','LPF','Portugal')
insert into Fixture values (2,'2014/2015','LPF','Portugal')

--inserir 4 jogos epoca 2013/2014 Portugal
--jornada 1
--Cascalheira
--jogo 1
insert into Game values (1,1,0,'2013-01-01','20:00','realizado',1,'2013/2014','LPF','Portugal','Cascalheira','Portugal','Alvarinhos','Portugal',null,null)
--convocatória Cascalheira
insert into Lineup values ('Cascalheira','Portugal',1,1,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (10,'Portugal','Cascalheira','Portugal',1,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (15,'Portugal','Cascalheira','Portugal',1,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (16,'Portugal','Cascalheira','Portugal',1,1,'2013/2014','LPF','Portugal',1)
--convocatória Alvarinhos
insert into Lineup values ('Alvarinhos','Portugal',1,1,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (17,'Portugal','Alvarinhos','Portugal',1,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (19,'Portugal','Alvarinhos','Portugal',1,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (21,'Portugal','Alvarinhos','Portugal',1,1,'2013/2014','LPF','Portugal',1)
--jogo 2
insert into Game values (2,1,0,'2013-01-01','20:00','realizado',1,'2013/2014','LPF','Portugal','Benfica','Portugal','Alverca','Portugal',null,null)
--convocatória Benfica
insert into Lineup values ('Benfica','Portugal',2,1,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (32,'Brasil','Benfica','Portugal',2,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (33,'Brasil','Benfica','Portugal',2,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (37,'Brasil','Benfica','Portugal',2,1,'2013/2014','LPF','Portugal',1)
--convocatória Alverca
insert into Lineup values ('Alverca','Portugal',2,1,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (23,'Angola','Alverca','Portugal',2,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (24,'Brasil','Alverca','Portugal',2,1,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (31,'Portugal','Alverca','Portugal',2,1,'2013/2014','LPF','Portugal',1)
--jornada 2
--jogo 1
insert into Game values (1,1,0,'2013-01-01','20:00','realizado',2,'2013/2014','LPF','Portugal','Benfica','Portugal','Cascalheira','Portugal',null,null)
--convocatória Benfica
insert into Lineup values ('Benfica','Portugal',1,2,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (32,'Brasil','Benfica','Portugal',1,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (33,'Brasil','Benfica','Portugal',1,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (37,'Brasil','Benfica','Portugal',1,2,'2013/2014','LPF','Portugal',1)
--convocatória Cascalheira
insert into Lineup values ('Cascalheira','Portugal',1,2,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (10,'Portugal','Cascalheira','Portugal',1,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (15,'Portugal','Cascalheira','Portugal',1,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (16,'Portugal','Cascalheira','Portugal',1,2,'2013/2014','LPF','Portugal',1)
--jogo 2
insert into Game values (2,1,0,'2013-01-01','20:00','realizado',2,'2013/2014','LPF','Portugal','Alverca','Portugal','Alvarinhos','Portugal',null,null)
--convocatória Alverca
insert into Lineup values ('Alverca','Portugal',2,2,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (23,'Angola','Alverca','Portugal',2,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (24,'Brasil','Alverca','Portugal',2,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (31,'Portugal','Alverca','Portugal',2,2,'2013/2014','LPF','Portugal',1)
--convocatória Alvarinhos
insert into Lineup values ('Alvarinhos','Portugal',2,2,'2013/2014','LPF','Portugal')
insert into LineupPlayer values (17,'Portugal','Alvarinhos','Portugal',2,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (19,'Portugal','Alvarinhos','Portugal',2,2,'2013/2014','LPF','Portugal',1)
insert into LineupPlayer values (21,'Portugal','Alvarinhos','Portugal',2,2,'2013/2014','LPF','Portugal',1)

--inserir 4 jogos epoca 2014/2015 Portugal
--jornada 1
--jogo 1
insert into Game values (1,1,2,'2015-01-01','20:00','realizado',1,'2014/2015','LPF','Portugal','Alverca','Portugal','Alvarinhos','Portugal',null,null)
--convocatória Alverca
insert into Lineup values ('Alverca','Portugal',1,1,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (23,'Angola','Alverca','Portugal',1,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (24,'Brasil','Alverca','Portugal',1,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (31,'Portugal','Alverca','Portugal',1,1,'2014/2015','LPF','Portugal',1)
--convocatória Alvarinhos
insert into Lineup values ('Alvarinhos','Portugal',1,1,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (17,'Portugal','Alvarinhos','Portugal',1,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (19,'Portugal','Alvarinhos','Portugal',1,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (21,'Portugal','Alvarinhos','Portugal',1,1,'2014/2015','LPF','Portugal',1)
--jogo 2
insert into Game values (2,0,3,'2015-01-02','20:00','realizado',1,'2014/2015','LPF','Portugal','Cascalheira','Portugal','Benfica','Portugal',null,null)
--convocatória Cascalheira
insert into Lineup values ('Cascalheira','Portugal',2,1,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (10,'Portugal','Cascalheira','Portugal',2,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (14,'Portugal','Cascalheira','Portugal',2,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (16,'Portugal','Cascalheira','Portugal',2,1,'2014/2015','LPF','Portugal',1)
--convocatória Benfica
insert into Lineup values ('Benfica','Portugal',2,1,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (32,'Brasil','Benfica','Portugal',2,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (33,'Brasil','Benfica','Portugal',2,1,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (37,'Brasil','Benfica','Portugal',2,1,'2014/2015','LPF','Portugal',1)
--jornada 2
--jogo 1
insert into Game values (1,2,0,'2015-01-07','20:00','realizado',2,'2014/2015','LPF','Portugal','Benfica','Portugal','Alvarinhos','Portugal',null,null)
--convocatória Benfica
insert into Lineup values ('Benfica','Portugal',1,2,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (32,'Brasil','Benfica','Portugal',1,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (33,'Brasil','Benfica','Portugal',1,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (37,'Brasil','Benfica','Portugal',1,2,'2014/2015','LPF','Portugal',1)
--convocatória Alvarinhos
insert into Lineup values ('Alvarinhos','Portugal',1,2,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (17,'Portugal','Alvarinhos','Portugal',1,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (19,'Portugal','Alvarinhos','Portugal',1,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (21,'Portugal','Alvarinhos','Portugal',1,2,'2014/2015','LPF','Portugal',1)
--jogo 2
insert into Game values (2,1,1,'2015-01-08','20:00','realizado',2,'2014/2015','LPF','Portugal','Cascalheira','Portugal','Alverca','Portugal',null,null)
--convocatória Cascalheira
insert into Lineup values ('Cascalheira','Portugal',2,2,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (10,'Portugal','Cascalheira','Portugal',2,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (15,'Portugal','Cascalheira','Portugal',2,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (16,'Portugal','Cascalheira','Portugal',2,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (11,'Portugal','Cascalheira','Portugal',2,2,'2014/2015','LPF','Portugal',1)
--convocatória Alverca
insert into Lineup values ('Alverca','Portugal',2,2,'2014/2015','LPF','Portugal')
insert into LineupPlayer values (23,'Angola','Alverca','Portugal',2,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (24,'Brasil','Alverca','Portugal',2,2,'2014/2015','LPF','Portugal',1)
insert into LineupPlayer values (31,'Portugal','Alverca','Portugal',2,2,'2014/2015','LPF','Portugal',1)

--inserir todos os tipos da tabela Game_Stats_Type
insert into Game_Stats_Type values (1,'golo')
insert into Game_Stats_Type values (2,'cartao amarelo')
insert into Game_Stats_Type values (3,'cartao vermelho')

--inserir golos dos jogo de cima
--golos epoca 2013/2014
--jornada 1
--Cascalheira-Alvarinhos
insert into Game_Stats values ('casa',1,0,1,1,1,'2013/2014','LPF','Portugal',1,10,'Portugal','Cascalheira','Portugal') -- xpto
--Benfica-Alverca
insert into Game_Stats values ('casa',1,0,1,2,1,'2013/2014','LPF','Portugal',1,33,'Brasil','Benfica','Portugal') -- Jonas
--jornada 2
--Benfica-Cascalheira
insert into Game_Stats values ('casa',1,0,1,1,2,'2013/2014','LPF','Portugal',1,32,'Brasil','Benfica','Portugal') -- Talisca
--Alverca-Alvarinhos
insert into Game_Stats values ('casa',2,0,1,2,2,'2013/2014','LPF','Portugal',1,23,'Angola','Alverca','Portugal') -- Mantorras
--golos epoca 2014/2015
--jornada 1
--Alverca-Alvarinhos
insert into Game_Stats values ('casa',1,0,1,1,1,'2014/2015','LPF','Portugal',1,23,'Angola','Alverca','Portugal') -- Mantorras
insert into Game_Stats values ('fora',2,0,2,1,1,'2014/2015','LPF','Portugal',1,17,'Portugal','Alvarinhos','Portugal') -- Tyson
insert into Game_Stats values ('fora',3,0,3,1,1,'2014/2015','LPF','Portugal',1,17,'Portugal','Alvarinhos','Portugal') -- Tyson
--Cascalheira-Benfica
insert into Game_Stats values ('fora',1,0,1,2,1,'2014/2015','LPF','Portugal',1,33,'Brasil','Benfica','Portugal') -- Jonas
insert into Game_Stats values ('fora',2,0,2,2,1,'2014/2015','LPF','Portugal',1,33,'Brasil','Benfica','Portugal') -- Jonas
insert into Game_Stats values ('fora',3,0,3,2,1,'2014/2015','LPF','Portugal',1,33,'Brasil','Benfica','Portugal') -- Jonas

insert into Game_Stats values ('fora',3,0,3,2,1,'2014/2015','LPF','Portugal',2,33,'Brasil','Benfica','Portugal') -- Jonas cartão
insert into Game_Stats values ('fora',3,0,3,2,1,'2014/2015','LPF','Portugal',3,33,'Brasil','Benfica','Portugal') -- Jonas cartão
--jornada 2
--Benfica-Alvarinhos
insert into Game_Stats values ('casa',1,0,1,1,2,'2014/2015','LPF','Portugal',1,32,'Brasil','Benfica','Portugal') -- Talisca
insert into Game_Stats values ('casa',2,0,2,1,2,'2014/2015','LPF','Portugal',1,33,'Brasil','Benfica','Portugal') -- Jonas
--Cascalheira-Alverca
insert into Game_Stats values ('fora',1,0,1,2,2,'2014/2015','LPF','Portugal',1,24,'Brasil','Alverca','Portugal') -- Deco
insert into Game_Stats values ('casa',2,0,2,2,2,'2014/2015','LPF','Portugal',1,11,'Portugal','Cascalheira','Portugal') -- puto


--
--lista de jogos
--
--2013/2014
--jornada 1
--cascalheira-alvarinhos
--benfica-alverca
--jornada 2
--benfica-cascalheira
--alverca-alvarinhos
--
--2014/2015
--jornada 1
--alverca-alvarinhos
--cascalheira-benfica
--jornada 2
--benfica-alvarinhos
--cascalheira-alverca

insert into Season_Statistics values ('2013/2014','LPF','Portugal')
insert into Season_Statistics values ('2014/2015','LPF','Portugal')

/*
--registo de estatísticas
--2014/2015
begin transaction
	--Maior
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',32,'Brasil',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',33,'Brasil',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',37,'Brasil',null,null,null,null)
	--Alvarinhos
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',17,'Portugal',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',19,'Portugal',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',21,'Portugal',null,null,null,null)
	--Cascalheira
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',10,'Portugal',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',11,'Portugal',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',14,'Portugal',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',15,'Portugal',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',16,'Portugal',null,null,null,null)
	--Alverca
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',23,'Angola',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',24,'Brasil',null,null,null,null)
	insert into Season_Statistics_Player values ('2014/2015','LPF','Portugal',31,'Portugal',null,null,null,null)

	update	Season_Statistics_Player
	set		goalsPerGame = Updates.media
	from
	(
		select	JT.name, GT.bi, GT.goals, JT.games, Cast(((CAST(GT.goals as decimal)/Cast(JT.games as decimal))*100) as  int)	as 'media'
		from	(
				select	count(*) as goals, Player.bi
				from	Game_Stats inner join Player on (Game_Stats.player = Player.bi)
				where	Game_Stats.statType = 1	and
						Game_Stats.season = '2014/2015'
				group by Player.bi
				) as GT inner join (
						select count(Calls.player) as games,name, bi, playerCountry
						from	(
								select	Player.*, LineupPlayer.player
								from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi)
								where	LineupPlayer.season = '2014/2015') as Calls
						group by name, bi, playerCountry
						) as JT on (GT.bi = JT.bi)
	)	as Updates
	where Updates.bi = Season_Statistics_Player.player
commit
*/




---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------


/*


select *
from Season_Statistics_Player



--7 create statistic player

update	Season_Statistics_Player
set		goalsPerGame = Updates.mediaGolos, cardsPerGame = Updates.mediaCartoes, goals = Updates.goals, games = Updates.games
from
(
	select	JT.name, GT.bi, GT.goals, JT.games, Cast(((CAST(GT.goals as decimal)/Cast(JT.games as decimal))*100) as  int)	as 'mediaGolos', Cast(((CAST(CT.cards as decimal)/Cast(JT.games as decimal))*100) as  int)	as 'mediaCartoes'
	from	(
			select	count(*) as goals, Player.bi
			from	Game_Stats inner join Player on (Game_Stats.player = Player.bi)
			where	Game_Stats.statType = 1	and
					Game_Stats.season = '2014/2015'
			group by Player.bi) as GT
					inner join (
					select count(Calls.player) as games,name, bi, playerCountry
					from	(
							select	Player.*, LineupPlayer.player
							from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi)
							where	LineupPlayer.season = '2014/2015') as Calls
					group by name, bi, playerCountry
					) as JT on (GT.bi = JT.bi)
							inner join (
							select	count(*) as cards, Player.bi
							from	Game_Stats inner join Player on (Game_Stats.player = Player.bi)
							where	(Game_Stats.statType = 2 or Game_Stats.statType = 3)	and
									Game_Stats.season = '2014/2015'
							group by Player.bi
							) as CT on (GT.bi = CT.bi)
	) as Updates
where Updates.bi = Season_Statistics_Player.player


*/