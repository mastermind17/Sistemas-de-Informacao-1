use FIFA


-- a)
select	Player.name, Player.bi, Player.playerCountry, Team.name, Game_Stats.season

from	Game_Stats	inner join Player on (Game_Stats.player = Player.bi)
					inner join Team on (Player.team = Team.cod)
					inner join Competition on (Game_Stats.competition = Competition.cod)
					inner join Game_Stats_Type on (Game_Stats.statType = Game_Stats_Type.statType)

where	Competition.description = 'Liga Portuguesa'
		and Game_Stats.season = '2014/2015'
		and Game_Stats_Type.description = 'golo'
		and Game_Stats.statOrder = 1

select *
from Game_Stats
where season = '2014/2015' and competition = 'LPF' and statType = 1

-- b)

select	Player.name, Player.bi, Player.playerCountry, Season_Team_Players.season

from	Season_Team_Players	inner join Player on (Season_Team_Players.player = Player.bi)

where	Season_Team_Players.team = 'Cascalheira'	and
		Season_Team_Players.season = '2014/2015'	and
		Season_Team_Players.player not in (
									select	distinct player
									from	Season_Team_Players
									where	season = '2013/2014')


-- c)

select	top 1(ContagemGolos.cenas), ContagemGolos.season, ContagemGolos.name

from	(select	count(id) as cenas, player, season, name

		from	Game_Stats	inner join Player on (Game_Stats.player = Player.bi)

		group by player, season, name) as ContagemGolos

order by cenas desc



-- d)
select	count(id) as cenas, player, season, name

from	Game_Stats	inner join Player on (Game_Stats.player = Player.bi)

group by player, season, Player.name
having count(id) > 1

-- não há 30 golos, testei com 1
--where ContagemGolos.cenas > 1

order by cenas desc



-- e)

select name, bi, playerCountry
from	(
		select	name, bi, Player.playerCountry
		from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi)
		where	LineupPlayer.season = '2014/2015' and
				LineupPlayer.team = 'Cascalheira') as Calls
group by name, bi, playerCountry
having	count(Calls.bi) =	(
								select	count(distinct Aux.fixture)
								from	(
										select	LineupPlayer.*, Player.name
										from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi)
										where	LineupPlayer.season = '2014/2015' and
												LineupPlayer.team = 'Cascalheira') as Aux)


-- f

select	JT.name,GT.golos, JT.jogos, (((CAST(GT.golos as decimal)/Cast(JT.jogos as decimal))*100))	as 'media'
from	(
		select	count(*) as golos, Player.bi
		from	Game_Stats inner join Player on (Game_Stats.player = Player.bi)
		where	statType = 1	and
				season = '2014/2015'
		group by Player.bi
		) as GT inner join (
				select count(Calls.bi) as jogos, name, bi, playerCountry
				from	(
						select	name, bi, Player.playerCountry
						from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi)
						where	season = '2014/2015') as Calls
				group by name, bi, playerCountry
				) as JT on (GT.bi = JT.bi)



-- h)

update	Season_Statistics_Player
set		goalsPerGame = Updates.media
from
(
	select	JT.name, GT.bi, GT.golos, JT.jogos, Cast(((CAST(GT.golos as decimal)/Cast(JT.jogos as decimal))*100) as  int)	as 'media'
	from	(
			select	count(*) as golos, Player.bi
			from	Game_Stats inner join Player on (Game_Stats.player = Player.bi)
			where	statType = 1	and
					season = '2014/2015'
			group by Player.bi
			) as GT inner join (
					select count(Calls.bi) as jogos, name, bi, playerCountry
					from	(
							select	name, bi, Player.playerCountry
							from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi)
							where	season = '2014/2015') as Calls
					group by name, bi, playerCountry
					) as JT on (GT.bi = JT.bi)
)	as Updates
where Updates.bi = Season_Statistics_Player.player



-- i)
/*
go
create view AlineaI as
select	C1.description, C1.team, C2.totalGames, C1.totalPlayers
from
	(
	select	count(distinct(player)) as totalPlayers, Season_Team_Players.team, Competition.description
	from	Season_Team_Players inner join Competition on (Season_Team_Players.competition = Competition.cod)
	where	Competition.description = 'Liga Portuguesa'
	group by Season_Team_Players.team, Competition.description
	) as C1
	inner join
	(
	select	count(Team.cod) as totalGames, Team.cod
	from	Team	inner join Game on (Team.cod = Game.HomeTeam and Team.country = Game.homeTeamCountry or
										Team.cod = Game.awayTeam and Team.country = Game.awayTeamCountry)
					inner join Competition on (Game.competition = Competition.cod)
	where	description = 'Liga Portuguesa'
	group by Team.cod, Team.name, Team.country
	) as C2
	on C1.team = C2.cod
*/


---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

