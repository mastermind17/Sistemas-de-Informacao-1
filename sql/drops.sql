use FIFA

if(OBJECT_ID('Season_Statistics_Team') is not null)				drop table Season_Statistics_Team
if(OBJECT_ID('Season_Statistics_Player') is not null)			drop table Season_Statistics_Player
if(OBJECT_ID('Season_Statistics_Competition') is not null)		drop table Season_Statistics_Competition

if(OBJECT_ID('Season_Statistics') is not null)		drop table Season_Statistics

if(OBJECT_ID('Season_Team_Players') is not null)	drop table Season_Team_Players
if(OBJECT_ID('Season_Team') is not null)			drop table Season_Team
if(OBJECT_ID('Team_Stadium') is not null)			drop table Team_Stadium
if(OBJECT_ID('Stadium') is not null)				DROP TABLE Stadium
if(OBJECT_ID('Ban') is not null)					DROP TABLE Ban
if(OBJECT_ID('Game_Stats') is not null)				drop table Game_Stats
if(OBJECT_ID('LineupPlayer') is not null)			drop table LineupPlayer
if(OBJECT_ID('Lineup') is not null)					drop table Lineup
if(OBJECT_ID('Game') is not null)					DROP TABLE Game
if(OBJECT_ID('Fixture') is not null)				DROP TABLE Fixture
if(OBJECT_ID('Season') is not null)					DROP TABLE Season
if(OBJECT_ID('Player') is not null)					DROP TABLE Player
if(OBJECT_ID('Address') is not null)				drop table Address
if(OBJECT_ID('Home_Team') is not null)				drop table Home_Team
if(OBJECT_ID('Away_Team') is not null)				drop table Away_Team
if(OBJECT_ID('Team') is not null)					DROP TABLE Team
if(OBJECT_ID('Competition') is not null)			DROP TABLE Competition
if(OBJECT_ID('Country') is not null)				DROP TABLE Country
if(OBJECT_ID('Game_Stats_Type') is not null)		drop table Game_Stats_Type

if(OBJECT_ID('AlineaI') is not null)			drop view AlineaI

