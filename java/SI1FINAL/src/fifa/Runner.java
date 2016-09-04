package fifa;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import sql.Statements;


// todo: o rs do getTeamGames não está a bem, perguntar ao zarolho 

// reformular o metodo deleteGamesAndReferences
// e altera a criação e e fecho das connections
// criar classes para todos os butões

public class Runner
{
	// connection string to db
	private static String connectionString;
	// connection to db
	private static Connection connection;
	private static PreparedStatement stmt;
	private static Printer printer;
	
	final JFrame menuWindow;
	
	public Runner(String s)
	{
		connectionString = s;
		
		menuWindow = new JFrame("FIFA");
		menuWindow.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		menuWindow.setVisible(true);
		menuWindow.setLayout(new GridLayout(7,1));
		
		printer = new Printer();
	}
	
	public void run()
	{
		JButton button = new JButton("Team Info");
		button.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				try
				{
					connection = getConnection();
					String team = JOptionPane.showInputDialog("Team name?");
					showTeams(team);
					showPlayersFromTeam(team);
				}
				catch (SQLException e) { System.err.println(e.getMessage()); }
				finally
				{
					closeConnection(connection);
				}
				
			}
		});
		menuWindow.getContentPane().add(button);
		
		button = new JButton("Find Games");
		button.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				try
				{
					connection = getConnection();
					showGames(
							JOptionPane.showInputDialog("Begin date?"),
							JOptionPane.showInputDialog("End date?"));
				}
				catch (SQLException e) { System.err.println(e.getMessage()); }
				finally
				{
					closeConnection(connection);
				}
				
			}
		});
		menuWindow.getContentPane().add(button);

		button = new JButton("Players called for all games");
		button.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				try
				{
					connection = getConnection();
					showPlayersCalledForAllGames(
							JOptionPane.showInputDialog("Team?"),
							JOptionPane.showInputDialog("Season?"));
				}
				catch (SQLException e) { System.err.println(e.getMessage()); }
				finally
				{
					closeConnection(connection);
				}
				
			}
		});
		menuWindow.getContentPane().add(button);
		
		button = new JButton("Create Team");
		button.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				try
				{
					connection = getConnection();
					insertTeam(
							JOptionPane.showInputDialog("Team name?"),
							JOptionPane.showInputDialog("Team full name?"),
							JOptionPane.showInputDialog("Team country?"));
					
				}
				catch (SQLException e) { System.err.println(e.getMessage()); }
				finally
				{
					closeConnection(connection);
				}
				
			}
		});
		menuWindow.getContentPane().add(button);

		button = new JButton("Create Player");
		button.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				try
				{
					connection = getConnection();
					insertPlayer(
							JOptionPane.showInputDialog("Name?"),
							Integer.parseInt(JOptionPane.showInputDialog("BI?")),
							Integer.parseInt(JOptionPane.showInputDialog("NIF?")),
							JOptionPane.showInputDialog("Birthday?"),
							JOptionPane.showInputDialog("Country?"),
							JOptionPane.showInputDialog("Adress?"),
							JOptionPane.showInputDialog("Team?"),
							JOptionPane.showInputDialog("Team country?"));
					
				}
				catch (SQLException e) { System.err.println(e.getMessage()); }
				finally
				{
					closeConnection(connection);
				}
				
			}
		});
		menuWindow.getContentPane().add(button);

		button = new JButton("Create Player Statistic");
		button.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				try
				{
					createPlayerStatistic(
							Integer.parseInt(JOptionPane.showInputDialog("BI?")),
							JOptionPane.showInputDialog("País Jogador?"),
							JOptionPane.showInputDialog("Época?"),
							JOptionPane.showInputDialog("Competição?"),
							JOptionPane.showInputDialog("País Competição?"));
				}
//				catch (SQLException e) { System.err.println(e.getMessage()); }
				finally
				{
				}
			}
		});
		menuWindow.getContentPane().add(button);
		
		button = new JButton("Remove Team");
		button.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				try
				{
//					connection = getConnection();
					removeTeam(
							JOptionPane.showInputDialog("Team?"),
							JOptionPane.showInputDialog("Team country?"));
				}
				catch (SQLException e) { System.err.println(e.getMessage()); }
				finally
				{
//					closeConnection(connection);
				}
			}
		});
		menuWindow.getContentPane().add(button);
		
		menuWindow.getContentPane().add(button);
		menuWindow.setSize(600, 600);
	}
	
	private void createPlayerStatistic(int player, String playerCountry, String season, String competition, String competitionCountry)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			connection.setAutoCommit(false);
			stmt = connection.prepareStatement(Statements.INSERT_SEASON_STATISTICS_PLAYER);
			stmt.setString(1, season);
			stmt.setString(2, competition);
			stmt.setString(3, competitionCountry);
			stmt.setInt(4, player);
			stmt.setString(5, playerCountry);
			stmt.executeUpdate();
			//update
			stmt = connection.prepareStatement(Statements.UPDATE_SEASON_STATISTICS_PLAYER);
			stmt.setString(1, season);
			stmt.setString(2, season);
			stmt.setInt(3, player);
			stmt.setString(4, season);
			stmt.setInt(5, player);
			stmt.executeUpdate();
			
			connection.commit();
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
			try
			{
				connection.rollback();
			}
			catch(SQLException ex)
			{
				System.err.println(ex.getMessage());
				ex.printStackTrace();
			}
		}
		finally
		{
			showSeasonStatisticsPlayer(player, season);
		}
	}
	
	// before removing a team its necessary the remove all the info associated with it
	private void removeTeam(String team, String teamCountry) throws SQLException
	{
		removePlayerfromTeam(team, teamCountry);
		deleteGamesAndReferences(team, teamCountry);
		deleteTeamSeasonsSignups(team, teamCountry);
		deleteTeam(team, teamCountry);
		printer.printRemovedTeam(team);
	}
	
	private void deleteGamesAndReferences(String team, String teamCountry) throws SQLException
	{
		ResultSet rs = getTeamGames(team, teamCountry);
		while(rs.next())
			deleteGameStats(rs);
		rs = getTeamGames(team, teamCountry);
		while(rs.next())
			deleteLineups(rs);
		rs = getTeamGames(team, teamCountry);
		while(rs.next())
			deleteGames(rs);
	}
	
	private void deleteGames(ResultSet rs)
	{
		try
		{
			Connection conn = DriverManager.getConnection(connectionString);
			PreparedStatement stmt = conn.prepareStatement(Statements.DELETE_GAMES);
			stmt.setInt(1, rs.getInt("num"));
			stmt.setInt(2, rs.getInt("fixture"));
			stmt.setString(3, rs.getString("season"));
			stmt.setString(4, rs.getString("competition"));
			stmt.setString(5, rs.getString("country"));	
			stmt.executeUpdate();
			closeConnection(conn);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void deleteLineups(ResultSet rs)
	{
		try
		{
			Connection conn = DriverManager.getConnection(connectionString);
			PreparedStatement stmt = conn.prepareStatement(Statements.DELETE_GAME_LINEUPS1);
			stmt.setInt(1, rs.getInt("num"));
			stmt.setInt(2, rs.getInt("fixture"));
			stmt.setString(3, rs.getString("season"));
			stmt.setString(4, rs.getString("competition"));
			stmt.setString(5, rs.getString("country"));	
			stmt.executeUpdate();
			closeConnection(conn);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		try
		{
			Connection conn = DriverManager.getConnection(connectionString);
			PreparedStatement stmt = conn.prepareStatement(Statements.DELETE_GAME_LINEUPS2);
			stmt.setInt(1, rs.getInt("num"));
			stmt.setInt(2, rs.getInt("fixture"));
			stmt.setString(3, rs.getString("season"));
			stmt.setString(4, rs.getString("competition"));
			stmt.setString(5, rs.getString("country"));	
			stmt.executeUpdate();
			closeConnection(conn);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void deleteGameStats(ResultSet rs)
	{
		try
		{
			Connection conn = DriverManager.getConnection(connectionString);
			PreparedStatement stmt = conn.prepareStatement(Statements.DELETE_GAME_GAME_STATS);
			stmt.setInt(1, rs.getInt("num"));
			stmt.setInt(2, rs.getInt("fixture"));
			stmt.setString(3, rs.getString("season"));
			stmt.setString(4, rs.getString("competition"));
			stmt.setString(5, rs.getString("country"));
			stmt.executeUpdate();
			closeConnection(conn);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private ResultSet getTeamGames(String team, String teamCountry)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.SELECT_TEAM_GAMES);
			stmt.setString(1, team);
			stmt.setString(2, teamCountry);
			stmt.setString(3, team);
			stmt.setString(4, teamCountry);
			return stmt.executeQuery();
		}
		catch (SQLException e)
		{
			System.out.println("REBENTOU");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	
	private void deleteTeam(String team, String teamCountry)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.DELETE_TEAM1);
			stmt.setString(1, team);
			stmt.setString(2, teamCountry);
			stmt.executeUpdate();
			stmt = connection.prepareStatement(Statements.DELETE_TEAM2);
			stmt.setString(1, team);
			stmt.setString(2, teamCountry);
			stmt.executeUpdate();
			stmt = connection.prepareStatement(Statements.DELETE_TEAM3);
			stmt.setString(1, team);
			stmt.setString(2, teamCountry);
			stmt.executeUpdate();
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}

/*
	private void deleteTeamSeasonStatistics(String team, String teamCountry)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.DELELTE_TEAM_SEASON_STATISTICS);
			stmt.setString(1, team);
			stmt.setString(2, teamCountry);
			stmt.executeUpdate();
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
*/
	
	private void removePlayerfromTeam(String team, String teamCountry)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			connection.setAutoCommit(false); 
			stmt = connection.prepareStatement(Statements.REMOVE_PLAYER_FROM_TEAM);
			stmt.setString(1, team);
			stmt.setString(2, teamCountry);
			stmt.executeUpdate();
			connection.commit();
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
			try
			{
				connection.rollback();
			}
			catch(SQLException ex)
			{
				System.err.println(ex.getMessage());
				ex.printStackTrace();
			}
		}
	}
	
	// delete a team's player signups on all season
	private void deleteTeamSeasonsSignups(String team, String teamCountry)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			PreparedStatement s = connection.prepareStatement(Statements.DELETE_TEAM_SEASONS_SIGNUPS1);
			//stmt = connection.prepareStatement(Statements.DELETE_TEAM_SEASON_SIGNUPS1);
			s.setString(1, team);
			s.setString(2, teamCountry);
			s.executeUpdate();
			s = connection.prepareStatement(Statements.DELETE_TEAM_SEASONS_SIGNUPS2);
			s.setString(1, team);
			s.setString(2, teamCountry);
			s.executeUpdate();
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}

	private void showPlayersCalledForAllGames(String team, String season)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.SELECT_PLAYERS_CALLED_FOR_ALL_GAMES);
			stmt.setString(1, season);
			stmt.setString(2, team);
			ResultSet rs = stmt.executeQuery();
			printer.printPlayers(rs);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void showGames(String beginDate, String endDate)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.SELECT_GAMES_BETWEEN_DATES);
			stmt.setString(1, beginDate);
			stmt.setString(2, endDate);
			ResultSet rs = stmt.executeQuery();
			printer.printGames(rs);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void insertPlayer(String name, int bi, int nif, String birthday, String country, String address, String team, String teamCountry)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			connection.setAutoCommit(false);
			stmt = connection.prepareStatement(Statements.INSERT_PLAYER);
			stmt.setInt(1, bi);
			stmt.setInt(2, nif);
			stmt.setString(3, name);
			stmt.setString(4, birthday);
			stmt.setString(5, country);
			stmt.setString(6, team);
			stmt.setString(7, teamCountry);
//			if(address != null)
//				stmt.setString(8, address);
//			else
//				stmt.setNull(8, Types.INTEGER);
			stmt.setString(8, address);
			stmt.executeUpdate();
			connection.commit();
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
			try
			{
				connection.rollback();
			}
			catch(SQLException ex)
			{
				System.err.println(ex.getMessage());
				ex.printStackTrace();
			}
		}
		
	}
	
	private void insertTeam(String name, String fullName, String country)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			connection.setAutoCommit(false);
			// insert team
			stmt = connection.prepareStatement(Statements.INSERT_TEAM);
			stmt.setString(1, name);
			stmt.setString(2, fullName);
			stmt.setString(3, country);
			stmt.executeUpdate();
			//insert home team
			stmt = connection.prepareStatement(Statements.INSERT_HOME_TEAM);
			stmt.setString(1, name);
			stmt.setString(2, country);
			stmt.executeUpdate();
			//insert away team
			stmt = connection.prepareStatement(Statements.INSERT_AWAY_TEAM);
			stmt.setString(1, name);
			stmt.setString(2, country);
			stmt.executeUpdate();

			connection.commit();
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
			try
			{
				connection.rollback();
			}
			catch(SQLException ex)
			{
				System.err.println(ex.getMessage());
				ex.printStackTrace();
			}
		}
		finally
		{
			showTeams(name);
		}
	}
	
	private void showSeasonStatisticsPlayer(int player, String season)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.SELECT_SEASON_STATISTICS_PLAYER);
			stmt.setInt(1, player);
			stmt.setString(2, season);
			ResultSet rs = stmt.executeQuery();
			printer.printSeasonStatisticsPlayer(rs);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void showTeams(String team)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.SELECT_TEAM);
			stmt.setString(1, team);
			ResultSet rs = stmt.executeQuery();
			printer.printTeams(rs);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void showPlayersFromTeam(String team)
	{
		try
		{
			Connection connection = DriverManager.getConnection(connectionString);
			stmt = connection.prepareStatement(Statements.SELECT_PLAYERS_FROM_TEAM);
			stmt.setString(1, team);
			ResultSet rs = stmt.executeQuery();
			printer.printPlayers(rs);
		}
		catch (SQLException e)
		{
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}	
	
	private Connection getConnection() throws SQLException
	{
		if(connection == null || connection.isClosed())
			return (Connection) DriverManager.getConnection(connectionString);
		return (Connection) connection;
	}
	
	private static void closeConnection(Connection c)
	{
		if(c != null)
		{
			try
			{
				c.close();
			} 
			catch (SQLException e) { System.err.println(e.getMessage()); }
		}
	}
}
