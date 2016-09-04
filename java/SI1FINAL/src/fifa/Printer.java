package fifa;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;


/*
 * class responsible for printing the results to standard output
 */
public class Printer
{
	final JFrame outputWindow;
	JTextArea textArea;
	String out;
	
	public Printer()
	{
		outputWindow = new JFrame("Output");
		outputWindow.setLayout(new BorderLayout());
		outputWindow.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		outputWindow.setVisible(true);
		
		textArea = new JTextArea();
		out = "";
		textArea.setText(out);
		JScrollPane scrollPane = new JScrollPane(textArea);
		scrollPane.setPreferredSize(new Dimension(450, 110));
		outputWindow.add(scrollPane);
		outputWindow.setSize(600, 600);
	}
	
	public void printPlayers(ResultSet rs) throws SQLException
	{
		if(!rs.next())
		{
			out += "Não existem jogadores para esta pesquisa\n";
			printSeperator();
			return;
		}
		out += "Players:\n";
		do
		{
			out +=	rs.getString("name") + ", " +
					rs.getString("bi") + ", " +
					rs.getString("playerCountry") + "\n";
		}
		while(rs.next());
		printSeperator();
	}
	
	public void printGames(ResultSet rs) throws SQLException
	{
		if(!rs.next())
		{
			out += "Não existem jogos para esta pesquisa\n";
			printSeperator();
			return;
		}
		out += "Games:\n";
		do
		{
			out +=	rs.getString("gameTime") + " " +
					rs.getString("gameDate") + ", " +
					rs.getString("description") + " " +
					rs.getString("season") + "\n" +
					rs.getString("homeTeam") + " " +
					rs.getString("homeGoals") + " - " +
					rs.getString("awayGoals") + " " +
					rs.getString("awayTeam") + "\n";			
		}
		while(rs.next());
		printSeperator();
	}
	
	public void printTeams(ResultSet rs) throws SQLException
	{
		if(!rs.next())
		{
			out += "Não existem equipas para esta pesquisa\n";
			printSeperator();
			return;
		}
		
		do
		{
			out +=	"Team:\n" +
					rs.getString("cod") + ", " +
					rs.getString("name") + ", " +
					rs.getString("country") + "\n";			
			printSeperator();
		}
		while(rs.next());
	}
	
	public void printSeasonStatisticsPlayer(ResultSet rs) throws SQLException
	{
		if(!rs.next())
		{
			out += "Não existem equipas para esta pesquisa\n";
			printSeperator();
			return;
		}
		
		do
		{
			out +=	"Jogador: " +
					rs.getInt("player") + ", Época: " +
					rs.getString("season") + "\n jogos: " +
					rs.getString("games") + ", golos: " + rs.getString("goals") + ", cartões: " + rs.getString("cardsPerGame") + ", golos/jogo: " + rs.getString("goalsPerGame") + "\n";			
			printSeperator();
		}
		while(rs.next());
	}
	
	private void printSeperator()
	{
		out += "-------------------------------------\n";
		textArea.setText(out);
	}

	public void printRemovedTeam(String team)
	{
		out += "Equipa removida: " + team + "\n";
		printSeperator();
	}
	
}
