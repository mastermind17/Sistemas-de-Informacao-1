package entryPoint;

import fifa.Runner;

public class EntryPoint
{
	public static void main(String[] args)
	{
		String url = "jdbc:sqlserver://localhost;databaseName=FIFA;integratedSecurity=true;";
		Runner runner = new Runner(url);
		runner.run();
	}
}
