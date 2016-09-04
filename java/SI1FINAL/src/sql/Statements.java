package sql;

public class Statements
{
	public static final String INSERT_PLAYER = "insert into Player values (?,?,?,?,?,?,?,?)";
	
	// creates new team and respective home and away teams
	public static final String INSERT_TEAM = "insert into Team values(?,?,?)";
	public static final String INSERT_HOME_TEAM = "insert into Home_Team values(?,?)";
	public static final String INSERT_AWAY_TEAM = "insert into Away_Team values(?,?)";
	
	public static final String SELECT_TEAM  =	"select	cod, name, country "
											+	"from	Team "
											+	"where	cod = (?)";

	public static final String SELECT_PLAYERS_FROM_TEAM  =	"select	name, bi, playerCountry "
														 +	"from	Player "
														 +	"where	team = (?)";

	public static final String SELECT_GAMES_BETWEEN_DATES =	"select	Game.gameTime, Game.gameDate, Competition.description, Game.season, Game.homeTeam, Game.homeGoals, Game.awayTeam, Game.awayGoals "
														  +	"from	Game inner join Competition on (Game.competition = Competition.cod) "
														  + "where	gameDate > (?) and "
														  +	"		gameDate < (?)";
	
	public static final String SELECT_PLAYERS_CALLED_FOR_ALL_GAMES = "select count(Calls.bi), name, bi, playerCountry "
																   + "from	( "
																   + "		select	name, bi, Player.playerCountry "
																   + "		from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi) "
																   + "		where	LineupPlayer.season = (?) and "
																   + "				LineupPlayer.team = (?)) as Calls "
																   + "group by name, bi, playerCountry "
																   + "having	count(Calls.bi) =	( "
																   + "								select	count(distinct Aux.fixture) "
																   + "								from	( "
																   + "										select	LineupPlayer.*, Player.name "
																   + "										from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi) "
																   + "										where	LineupPlayer.season = '2014/2015' and "
																   + "												LineupPlayer.team = 'Cascalheira') as Aux)";
	
	public static final String REMOVE_PLAYER_FROM_TEAM = "update	Player "
													   + "set		team = null,"
													   + "			teamCountry = null "
													   + "where		team = (?)	and "
													   + "			teamCountry = (?)";
		
	public static final String DELETE_TEAM_GAME_STATISTICS = "delete "
														   + "from		Game_Stats "
														   + "where		team = (?)	and "
														   + "			teamCountry = (?)";

	public static final String DELETE_TEAM_LINEUPS1 = "delete "
											   		+ "from		LineupPlayer "
											   		+ "where	team = (?)	and "
											   		+ "			teamCountry = (?)";
	
	public static final String DELETE_TEAM_LINEUPS2 = "delete "
												   + "from		Lineup "
												   + "where		team = (?)	and "
												   + "			teamCountry = (?)";

	public static final String REMOVE_TEAM_FROM_GAMES1 = "update	Game "
													   + "set		homeTeam = null,"
													   + "			homeTeamCountry = null "
													   + "where		homeTeam = (?)	and "
													   + "			homeTeamCountry = (?)";

	public static final String REMOVE_TEAM_FROM_GAMES2 = "update	Game "
													   + "set		awayTeam = null,"
													   + "			awayTeamCountry = null "
													   + "where		awayTeam = (?)	and "
													   + "			awayTeamCountry = (?)";

	// delete a team's player signups on all season
	public static final String DELETE_TEAM_SEASON_SIGNUPS1 = "delete "
														   + "from		Season_Team_Players "
														   + "where		team = 'Benfica'	and "
														   + "			teamCountry = 'Portugal'";

	// delete a team's player signups on all season
	public static final String DELETE_TEAM_SEASON_SIGNUPS2 = "delete "
														   + "from		Season_Team "
														   + "where		team = (?)	and "
														   + "			teamCountry = (?)";

	public static final String DELETE_TEAM1 = "delete "
											+ "from		Home_Team "
											+ "where	team = (?)	and "
											+ "			teamCountry = (?)";

	public static final String DELETE_TEAM2 = "delete "
											+ "from		Away_Team "
											+ "where	team = (?)	and "
											+ "			teamCountry = (?)";

	public static final String DELETE_TEAM3 = "delete "
											+ "from		Team "
											+ "where	cod = (?)	and "
											+ "			country = (?)";
	
	public static final String DELELTE_TEAM_SEASON_STATISTICS = "delete "
															  + "from		Team "
															  + "where		cod = (?)	and "
															  + "			country = (?)";


	public static final String SELECT_TEAM_GAMES = "select	num, fixture, season, competition, country "
												 + "from	Game "
												 + "where	(homeTeam = (?)	and homeTeamCountry = (?))	or "
												 + "		(awayTeam = (?) and awayTeamCountry = (?))";
	
	// deletes all the Game_Stats for a certain game
	public static final String DELETE_GAME_GAME_STATS = "delete "
													  + "from		Game_Stats "
													  + "where		game = (?) and fixture = (?) and season = (?) and competition = (?) and gameCountry = (?)";

	// deletes lineups for a game
	public static final String DELETE_GAME_LINEUPS1 = "delete "
												    + "from		LineupPlayer "
												    + "where	game = (?) and fixture = (?) and season = (?) and competition = (?) and gameCountry = (?)";

	public static final String DELETE_GAME_LINEUPS2 = "delete "
			   										+ "from		Lineup "
			   										+ "where	game = (?) and fixture = (?) and season = (?) and competition = (?) and gameCountry = (?)";

	public static final String DELETE_GAMES = "delete "
											+ "from		Game "
											+ "where	num = (?) and fixture = (?) and season = (?) and competition = (?) and country = (?)";

	// delete the signups of a team for all seasons
	public static final String DELETE_TEAM_SEASONS_SIGNUPS1 = "delete "
														    + "from		Season_Team_Players "
														    + "where	team = (?) and teamCountry = (?)";

	public static final String DELETE_TEAM_SEASONS_SIGNUPS2 = "delete "
															+ "from		Season_Team "
															+ "where	team = (?) and teamCountry = (?)";
	
	
	public static final String INSERT_SEASON_STATISTICS_PLAYER = "insert into Season_Statistics_Player values ((?),(?),(?),(?),(?),null,null,null,null)";

	public static final String UPDATE_SEASON_STATISTICS_PLAYER = "update	Season_Statistics_Player "
															   + "set		goalsPerGame = Updates.media, goals = Updates.goals, games = Updates.games "
															   + "from "
															   + "( "
															   + "		select	JT.name, GT.bi, GT.goals, JT.games, Cast(((CAST(GT.goals as decimal)/Cast(JT.games as decimal))*100) as  int)	as 'media' "
															   + "		from	( "
															   + "				select	count(*) as goals, Player.bi "
															   + "				from	Game_Stats inner join Player on (Game_Stats.player = Player.bi) "
															   + "				where	Game_Stats.statType = 1	and "
															   + "						Game_Stats.season = (?) "
															   + "				group by Player.bi "
															   + "				) as GT inner join ( "
															   + "					select count(Calls.player) as games,name, bi, playerCountry "
															   + "					from	( "
															   + "							select	Player.*, LineupPlayer.player "
															   + "							from	LineupPlayer inner join Player on (LineupPlayer.player = Player.bi) "
															   + "							where	LineupPlayer.season = (?)) as Calls "
															   + "							group by name, bi, playerCountry "
															   + "							) as JT on (GT.bi = JT.bi) "
															   + ")	as Updates "
															   + "where player = (?) and season = (?) and Updates.bi = (?)";
															   
public static final String SELECT_SEASON_STATISTICS_PLAYER = "select player, season, games, goals, cardsPerGame, goalsPerGame "
														   + "from Season_Statistics_Player "
														   + "where player = (?) and season = (?)";
	
	
}
