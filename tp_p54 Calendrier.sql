USE Master
GO
if exists(SELECT Name from master..sysdatabases WHERE Name LIKE 'p54_Calendrier')
BEGIN
	print '***********************************************************************************************'
	print 'Suppression de la base de données tp_p54_Calendrier existante...'
	print '***********************************************************************************************'
	Drop Database p54_Calendrier
END


/* *********************************************************************************************** */
print ' '
print '***********************************************************************************************'
print 'Création de la base de données p54_Calendrier en cours...'
print '***********************************************************************************************'
GO



Create Database p54_Calendrier
GO
USE p54_Calendrier
GO


/*********************** T_Ligue**************************************/
Create Table T_Ligue
(
	[Lig_no] 		int identity(1,1) 	NOT NULL PRIMARY KEY, 
	[Lig_nom] 	 	varchar(20) 		NOT NULL, 
	[Lig_Sport]  	varchar(20)		NOT NULL
)

/*********************** T_Equipes **************************************/
Create Table T_Equipes
(
	[Equ_no] 		varchar(6) 	NOT NULL PRIMARY KEY, 
	[Equ_Nom]		varchar(20) 	 	NOT NULL,
	[Equ_Ville]  	Varchar(20) 		NOT NULL, 
	[Lig_no] 	   	int          		NOT NULL, 
	[Equ_Logo]	 	varchar(150)		NOT NULL
)

/*********************** T_Parties **************************************/
Create Table T_Parties
(
	[Par_no] 			int identity(1,1) 	NOT NULL PRIMARY KEY, 
	[Par_date]	 		date 	 	NOT NULL,
	[Par_Heure]  		Varchar(5) 		NOT NULL, 
	[fk_Equ_no_Vis] 	varchar(6) 			NOT NULL, 
	[Par_pts_vis]       int        			NOT NULL,
	[fk_Equ_no_Rec] 	varchar(6)			NOT NULL, 
	[Par_pts_rec]       int        			NOT NULL
)
GO



/********************** INTÉGRITÉ RÉFÉRENTIELLE **********************/
ALTER TABLE [T_Equipes] 
 ADD CONSTRAINT [FK_Lig_NO001] foreign key ([Lig_no]) references [T_Ligue]([Lig_no])

GO
ALTER TABLE [T_Parties] 
 ADD CONSTRAINT [FK_Equ_NO_Vis001] foreign key ([fk_Equ_no_Vis]) references [T_Equipes]([Equ_no])
Go
ALTER TABLE [T_Parties] 
 ADD CONSTRAINT [FK_Equ_NO_Rec001] foreign key ([fk_Equ_no_Rec]) references [T_Equipes]([Equ_no])

/* *********************************************************************************************** */
print ' '
print '***********************************************************************************************'
print 'Ajout d`enregistrements de base...'
print '***********************************************************************************************'
GO

print ' '
print '***********************************************************************************************'
print 'Ajout de T_Ligues...'
print '***********************************************************************************************'
GO
insert into [T_Ligue] (Lig_nom, Lig_Sport) VALUES ('LNH', 'Hockey')
insert into [T_Ligue] (Lig_nom, Lig_Sport) VALUES ('MLB', 'Baseball')
insert into [T_Ligue] (Lig_nom, Lig_Sport) VALUES ('NFL', 'Football')

GO
print ' '
print '***********************************************************************************************'
print 'Ajout des équipes hockey...'
print '***********************************************************************************************'
GO

insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHMON','Canadiens', 'Montréal',1,'MON.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHTOR','Maple Leafs', 'Toronto',1,'TOR.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHBOS','Bruins', 'Boston',1,'BOS.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHOTT','Senators', 'Ottawa',1,'OTT.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHTBL','Lightning', 'Tampa Bay',1,'TB.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHFLO','Panthers', 'Floride',1,'FLO.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHDET','Red Wings', 'Détroit',1,'DET.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHBUF','Sabres', 'Buffalo',1,'BUF.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHWAS','Capitals', 'Washington',1,'WAS.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHPIT','Penguins', 'Pittsburgh',1,'PIT.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHCOB','Blue Jackets', 'Columbus',1,'CLB.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHNYR','Rangers', 'New York',1,'NYR.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHNYI','Islanders', 'New York',1,'NYI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHPHI','Flyers', 'Philadelphie',1,'PHI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHCAR','Hurricanes', 'Caroline',1,'CAR.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHNJD','Devils', 'New Jersey',1,'NJ.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHCHI','BlackHawks', 'Chicago',1,'Chi.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHMIN','Wild', 'Minnesota',1,'MIN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHSTL','Blues', 'St-Louis',1,'STL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHNAS','Predators', 'Nashville',1,'NAS.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHWIN','Jets', 'Winnipeg',1,'WIN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHDAL','Stars', 'Dallas',1,'DAL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHCOA','Avalanches', 'Colorado',1,'COL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHANA','Ducks', 'Anaheim',1,'ANA.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHEDM','Oilers', 'Edmonton',1,'EDM.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHSJS','Sharks', 'San Jose',1,'SJ.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHCAL','Flames', 'Calgary',1,'CAL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHLAK','Kings', 'Los Angeles',1,'LA.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHARI','Coyotes', 'Arizona',1,'ARI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHVAN','Canucks', 'Vancouver',1,'VAN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('LNHLVK','Golden Knights', 'Las Végas',1,'LV.Gif')
Go
print '***********************************************************************************************'
print 'Ajout des équipes baseball...'
print '***********************************************************************************************'
GO

insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBARI','Diamonbacks', 'Arizona',2,'B_ARI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBATL','Braves', 'Atlanta',2,'B_ATL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBBAL','Orioles', 'Baltimore',2,'B_BAL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBBOS','Red Sox', 'Boston',2,'B_BOS.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBCHC','Cubs', 'Chicago',2,'B_CHI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBCHW','White Sox', 'Chicago',2,'B_CHIW.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBCIN','Reds', 'Cincinnati',2,'B_CIN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBCLE','Indians', 'Cleveland',2,'B_CLE.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBCOL','Rockies', 'Colorado',2,'B_COL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBDET','Tigers', 'Détroit',2,'B_DET.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBHOU','Astros', 'Houston',2,'B_HOU.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBKCR','Royals', 'Kansas City',2,'B_KC.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBLAA','Angels', 'Los Angeles',2,'B_LAA.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBLAD','Dodgers', 'Los Angeles',2,'B_LAD.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBMIA','Marlins', 'Miami',2,'B_MIA.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBMIL','Brewers', 'Milwaukee',2,'B_MIL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBMIN','Twins', 'Minessota',2,'B_MIN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBNYM','Mets', 'NEW YORK',2,'B_NYM.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBNYY','Yankees', 'New York',2,'B_NYY.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBOAK','Athletics', 'Oakland',2,'B_OAK.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBPHI','Phillies', 'Philadelphie',2,'B_PHI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBPIT','Pirates', 'Pittsburgh',2,'B_PIT.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBSDP','Padres', 'San Diego',2,'B_SD.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBSFG','Giants', 'San Francisco',2,'B_SF.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBSEA','Mariners', 'Seattle',2,'B_SEA.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBSTL','Cardinals', 'Saint Louis',2,'B_STL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBTBR','Rays', 'Tampa Bay',2,'B_TB.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBTEX','Rangers', 'Texas',2,'B_Tex.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBTOR','Blue Jays', 'Toronto',2,'B_Tor.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('MLBWAS','Nationals', 'Washington',2,'B_Was.Gif')


GO
print ' '
print '***********************************************************************************************'
print 'Ajout des équipes Football...'
print '***********************************************************************************************'
GO

insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLARI','Cards', 'Arizona',3,'F_ARI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLATL','Falcons', 'Atlanta',3,'F_ATL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLBAL','Ravens', 'Baltimore',3,'F_BAL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLBUF','Bills', 'Buffalo',3,'F_BUF.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLCAR','Panthers', 'Caroline',3,'F_CAR.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLCHI','Bears', 'Chicago',3,'F_CHI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLCIN','Bengals', 'Cincinnati',3,'F_CIN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLCLE','Browns', 'Cleveland',3,'F_CLE.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLDAL','Cowboys', 'Dallas',3,'F_DAL.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLDEN','Broncos', 'Denver',3,'F_DEN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLDET','Lions', 'Détroit',3,'F_DET.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLGBP','Packers', 'Green Bay',3,'F_GB.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLHOU','Texans', 'Houston',3,'F_HOU.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLIND','Colts', 'Indianapolis',3,'F_IND.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLJAC','Jaguars', 'Jacksonville',3,'F_JV.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLKCC','Chiefs', 'Kansas City',3,'F_KC.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLLAC','Chargers', 'Los Angeles',3,'F_LAC.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLLAR','Rams', 'Los Angeles',3,'F_LAR.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLMIA','Dolphins', 'Miami',3,'F_MIA.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLMIN','Vikings', 'Minnesota',3,'F_MIN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLNEP','Patriots', 'Nouvelle Angleterre',3,'F_NE.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLNOS','Saints', 'Nouvelle Orléans',3,'F_NO.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLNYG','Giants', 'New York',3,'F_NYG.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLNYJ','Jets', 'New York',3,'F_NYJ.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLOAK','Raiders', 'Oakland',3,'F_OAK.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLPHI','Eagles', 'Philadelphie',3,'F_PHI.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLPIT','Steelers', 'Pittsburgh',3,'F_PIT.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLSFN','Forty Niners', 'San Francisco',3,'F_SF.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLSEA','Seahawks', 'Seattle',3,'F_SEA.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLTBB','Buccaneers', 'Tampa Bay',3,'F_TB.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLTEN','Titans', 'Tennessee',3,'F_TEN.Gif')
insert into [T_Equipes] (Equ_no, Equ_nom, Equ_Ville, Lig_no, Equ_Logo) VALUES ('NFLWAS','Redskins', 'Washington',3,'F_Was.Gif')
GO
print '***********************************************************************************************'
print 'Ajout des parties LNH...'
print '***********************************************************************************************'
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES
('1/10/2017' ,	'15H00'	,'LNHWAS',	4	,'LNHSTL',	3	),
('1/10/2017' ,	'17H00'	,'LNHNYI',	5	,'LNHPHI',	2	),
('1/10/2017' ,	'20H00'	,'LNHSJS',	5	,'LNHLVK',	3	),
('4/10/2017',	'19H00'	,'LNHTOR',	7	,'LNHWIN',	2	),
('4/10/2017',	'20H00'	,'LNHSTL',	5	,'LNHPIT',	4	),
('4/10/2017',	'22H00'	,'LNHCAL',	0	,'LNHEDM',	3	),
('4/10/2017',	'22H30'	,'LNHPHI',	5	,'LNHSJS',	3	),
('5/10/2017' ,	'19H00'	,'LNHNAS',	3	,'LNHBOS',	4	),
('5/10/2017' ,	'19H00'	,'LNHMON',	3	,'LNHBUF',	2	),
('5/10/2017' ,	'19H00'	,'LNHCOA',	4	,'LNHNYR',	2	),
('5/10/2017' ,	'19H30'	,'LNHWAS',	5	,'LNHOTT',	4	),
('5/10/2017' ,	'19H30'	,'LNHMIN',	2	,'LNHDET',	4	),
('5/10/2017' ,	'20H30'	,'LNHPIT',	1	,'LNHCHI',	10	),
('5/10/2017' ,	'22H00'	,'LNHARI',	4	,'LNHANA',	5	),
('5/10/2017' ,	'22H30'	,'LNHPHI',	0	,'LNHLAK',	2	),
('6/10/2017',	'19H00'	,'LNHNYI',	0	,'LNHCOB',	5	),
('6/10/2017',	'19H30'	,'LNHFLO',	3	,'LNHTBL',	5	),
('6/10/2017',	'20H30'	,'LNHLVK',	2	,'LNHDAL',	1	),
('7/10/2017',	'14H00'	,'LNHCOA',	1	,'LNHNJD',	4	),
('7/10/2017',	'19H00'	,'LNHNYR',	5	,'LNHTOR',	8	),
('7/10/2017',	'19H00'	,'LNHBUF',	3	,'LNHNYI',	6	),
('7/10/2017',	'19H00'	,'LNHMON',	1	,'LNHWAS',	6	),
('7/10/2017',	'19H00'	,'LNHTBL',	4	,'LNHFLO',	5	),
('7/10/2017',	'19H00'	,'LNHDET',	2	,'LNHOTT',	1	),
('7/10/2017',	'19H00'	,'LNHNAS',	0	,'LNHPIT',	4	),
('7/10/2017',	'19H00'	,'LNHMIN',	4	,'LNHCAR',	5	),
('7/10/2017',	'20H00'	,'LNHDAL',	2	,'LNHSTL',	4	),
('7/10/2017',	'20H30'	,'LNHCOB',	1	,'LNHCHI',	5	),
('7/10/2017',	'21H00'	,'LNHLVK',	2	,'LNHARI',	1	),
('7/10/2017',	'22H00'	,'LNHPHI',	3	,'LNHANA',	2	),
('7/10/2017',	'22H00'	,'LNHEDM',	2	,'LNHVAN',	3	),
('7/10/2017',	'22H00'	,'LNHWIN',	3	,'LNHCAL',	6	),
('7/10/2017',	'22H30'	,'LNHLAK',	4	,'LNHSJS',	1	),
('8/10/2017',	'19H00'	,'LNHMON',	0	,'LNHNYR',	2	),
('9/10/2017',	'13H00'	,'LNHCOA',	4	,'LNHBOS',	0	),
('9/10/2017',	'13H00'	,'LNHSTL',	3	,'LNHNYI',	2	),
('9/10/2017',	'15H00'	,'LNHNJD',	6	,'LNHBUF',	2	),
('9/10/2017',	'19H00'	,'LNHCHI',	3	,'LNHTOR',	4	),
('9/10/2017',	'19H30'	,'LNHWAS',	3	,'LNHTBL',	4	),
('9/10/2017',	'21H00'	,'LNHWIN',	5	,'LNHEDM',	2	),
('9/10/2017',	'22H00'	,'LNHCAL',	2	,'LNHANA',	0	),
('10/10/2017',	'19H00'	,'LNHSTL',	3	,'LNHNYR',	1	),
('10/10/2017',	'19H00'	,'LNHCOB',	2	,'LNHCAR',	1	),
('10/10/2017',	'19H30'	,'LNHCHI',	3	,'LNHMON',	1	),
('10/10/2017',	'20H00'	,'LNHPHI',	5	,'LNHNAS',	6	),
('10/10/2017',	'20H30'	,'LNHDET',	2	,'LNHDAL',	4	),
('10/10/2017',	'22H00'	,'LNHOTT',	3	,'LNHVAN',	2	),
('10/10/2017',	'22H00'	,'LNHARI',	2	,'LNHLVK',	5	),
('11/10/2017',	'19H30'	,'LNHNJD',	6	,'LNHTOR',	3	),
('11/10/2017',	'19H30'	,'LNHPIT',	3	,'LNHWAS',	2	),
('11/10/2017',	'21H30'	,'LNHBOS',	3	,'LNHCOA',	6	),
('11/10/2017',	'22H00'	,'LNHNYI',	2	,'LNHANA',	3	),
('11/10/2017',	'22H30'	,'LNHCAL',	4	,'LNHLAK',	3	),
('12/10/2017',	'19H30'	,'LNHPIT',	4	,'LNHTBL',	5	),
('12/10/2017',	'19H30'	,'LNHSTL',	2	,'LNHFLO',	5	),
('12/10/2017',	'20H00'	,'LNHDAL',	1	,'LNHNAS',	4	),
('12/10/2017',	'20H30'	,'LNHMIN',	5	,'LNHCHI',	2	),
('12/10/2017',	'22H00'	,'LNHWIN',	4	,'LNHVAN',	2	),
('12/10/2017',	'22H00'	,'LNHDET',	4	,'LNHARI',	2	),
('12/10/2017',	'22H30'	,'LNHBUF',	2	,'LNHSJS',	3	),
('13/10/2017',	'19H00'	,'LNHWAS',	5	,'LNHNJD',	2	),
('13/10/2017',	'19H00'	,'LNHNYR',	1	,'LNHCOB',	3	),
('13/10/2017',	'21H00'	,'LNHANA',	1	,'LNHCOA',	3	),
('13/10/2017',	'21H00'	,'LNHOTT',	6	,'LNHCAL',	0	),
('13/10/2017',	'22H30'	,'LNHDET',	6	,'LNHLVK',	3	),
('14/10/2017',	'19H00'	,'LNHCAR',	1	,'LNHWIN',	2	),
('14/10/2017',	'19H00'	,'LNHNJD',	3	,'LNHNYR',	2	),
('14/10/2017',	'19H00'	,'LNHTOR',	4	,'LNHMON',	3	),
('14/10/2017',	'19H00'	,'LNHFLO',	3	,'LNHPIT',	4	),
('14/10/2017',	'19H00'	,'LNHWAS',	2	,'LNHPHI',	8	),
('14/10/2017',	'19H00'	,'LNHSTL',	1	,'LNHTBL',	2	),
('14/10/2017',	'20H00'	,'LNHCOA',	1	,'LNHDAL',	3	),
('14/10/2017',	'20H00'	,'LNHCOB',	5	,'LNHMIN',	4	),
('14/10/2017',	'20H30'	,'LNHNAS',	1	,'LNHCHI',	2	),
('14/10/2017',	'21H00'	,'LNHBOS',	6	,'LNHARI',	2	),
('14/10/2017',	'22H00'	,'LNHCAL',	5	,'LNHVAN',	2	),
('14/10/2017',	'22H00'	,'LNHOTT',	6	,'LNHEDM',	1	),
('14/10/2017',	'22H30'	,'LNHNYI',	3	,'LNHSJS',	1	),
('14/10/2017',	'22H30'	,'LNHBUF',	2	,'LNHLAK',	4	),
('15/10/2017',	'19H00'	,'LNHBOS',	1	,'LNHLVK',	3	),
('15/10/2017',	'21H00'	,'LNHBUF',	3	,'LNHANA',	1	),
('15/10/2017',	'22H30'	,'LNHNYI',	2	,'LNHLAK',	3	),
('16/10/2017',	'19H30'	,'LNHTBL',	3	,'LNHDET',	2	),
('17/10/2017',	'19H00'	,'LNHPIT',	5	,'LNHNYR',	4	),
('17/10/2017',	'19H00'	,'LNHTOR',	2	,'LNHWAS',	0	),
('17/10/2017',	'19H00'	,'LNHFLO',	1	,'LNHPHI',	5	),
('17/10/2017',	'19H30'	,'LNHTBL',	4	,'LNHNJD',	5	),
('17/10/2017',	'19H30'	,'LNHVAN',	3	,'LNHOTT',	0	),
('17/10/2017',	'20H00'	,'LNHCOA',	1	,'LNHNAS',	4	),
('17/10/2017',	'20H00'	,'LNHCOB',	5	,'LNHWIN',	2	),
('17/10/2017',	'20H30'	,'LNHARI',	1	,'LNHDAL',	3	),
('17/10/2017',	'21H00'	,'LNHCAR',	5	,'LNHEDM',	3	),
('17/10/2017',	'22H00'	,'LNHBUF',	4	,'LNHLVK',	5	),
('17/10/2017',	'22H30'	,'LNHMON',	2	,'LNHSJS',	5	),
('18/10/2017',	'19H30'	,'LNHDET',	3	,'LNHTOR',	6	),
('18/10/2017',	'20H00'	,'LNHCHI',	2	,'LNHSTL',	5	),
('18/10/2017',	'22H30'	,'LNHMON',	1	,'LNHLAK',	5	),
('19/10/2017',	'19H00'	,'LNHNYI',	4	,'LNHNYR',	3	),
('19/10/2017',	'19H00'	,'LNHTBL',	2	,'LNHCOB',	0	),
('19/10/2017',	'19H00'	,'LNHNAS',	1	,'LNHPHI',	0	),
('19/10/2017',	'19H00'	,'LNHVAN',	3	,'LNHBOS',	6	),
('19/10/2017',	'19H30'	,'LNHNJD',	5	,'LNHOTT',	4	),
('19/10/2017',	'20H30'	,'LNHEDM',	2	,'LNHCHI',	1	),
('19/10/2017',	'21H00'	,'LNHCAR',	2	,'LNHCAL',	1	),
('19/10/2017',	'21H00'	,'LNHSTL',	4	,'LNHCOA',	3	),
('19/10/2017',	'22H00'	,'LNHDAL',	5	,'LNHARI',	4	),
('20/10/2017',	'19H00'	,'LNHVAN',	4	,'LNHBUF',	2	),
('20/10/2017',	'19H00'	,'LNHSJS',	3	,'LNHNJD',	0	),
('20/10/2017',	'19H30'	,'LNHPIT',	4	,'LNHFLO',	3	),
('20/10/2017',	'19H30'	,'LNHWAS',	4	,'LNHDET',	3	),
('20/10/2017',	'20H00'	,'LNHMIN',	3	,'LNHWIN',	4	),
('20/10/2017',	'22H00'	,'LNHMON',	2	,'LNHANA',	6	),
('21/10/2017',	'12H30'	,'LNHNAS',	2	,'LNHNYR',	4	),
('21/10/2017',	'13H00'	,'LNHEDM',	1	,'LNHPHI',	2	),
('21/10/2017',	'19H00'	,'LNHPIT',	1	,'LNHTBL',	7	),
('21/10/2017',	'19H00'	,'LNHBUF',	5	,'LNHBOS',	4	),
('21/10/2017',	'19H00'	,'LNHTOR',	3	,'LNHOTT',	6	),
('21/10/2017',	'19H00'	,'LNHLAK',	6	,'LNHCOB',	4	),
('21/10/2017',	'19H00'	,'LNHSJS',	3	,'LNHNYI',	5	),
('21/10/2017',	'19H30'	,'LNHFLO',	4	,'LNHWAS',	1	),
('21/10/2017',	'20H00'	,'LNHCAR',	3	,'LNHDAL',	4	),
('21/10/2017',	'21H00'	,'LNHCHI',	4	,'LNHARI',	2	),
('21/10/2017',	'22H00'	,'LNHMIN',	4	,'LNHCAL',	2	),
('21/10/2017',	'22H30'	,'LNHSTL',	2	,'LNHLVK',	3	),
('22/10/2017',	'19H00'	,'LNHVAN',	4	,'LNHDET',	1	),
('23/10/2017',	'19H00'	,'LNHLAK',	2	,'LNHTOR',	3	),
('23/10/2017',	'19H00'	,'LNHSJS',	4	,'LNHNYR',	1	),
('24/10/2017',	'19H00'	,'LNHTBL',	5	,'LNHCAR',	1	),
('24/10/2017',	'19H00'	,'LNHEDM',	1	,'LNHPIT',	2	),
('24/10/2017',	'19H00'	,'LNHANA',	6	,'LNHPHI',	2	),
('24/10/2017',	'19H00'	,'LNHARI',	3	,'LNHNYI',	5	),
('24/10/2017',	'19H30'	,'LNHDET',	0	,'LNHBUF',	1	),
('24/10/2017',	'19H30'	,'LNHFLO',	1	,'LNHMON',	5	),
('24/10/2017',	'19H30'	,'LNHLAK',	3	,'LNHOTT',	2	),
('24/10/2017',	'20H00'	,'LNHCAL',	3	,'LNHNAS',	2	),
('24/10/2017',	'20H00'	,'LNHVAN',	1	,'LNHMIN',	0	),
('24/10/2017',	'21H00'	,'LNHDAL',	3	,'LNHCOA',	5	),
('24/10/2017',	'22H00'	,'LNHCHI',	2	,'LNHLVK',	4	),
('25/10/2017',	'20H00'	,'LNHCAL',	2	,'LNHSTL',	5	),
('25/10/2017',	'20H00'	,'LNHBUF',	1	,'LNHCOB',	5	),
('26/10/2017',	'19H00'	,'LNHCAR',	6	,'LNHTOR',	3	),
('26/10/2017',	'19H00'	,'LNHSJS',	1	,'LNHBOS',	2	),
('26/10/2017',	'19H00'	,'LNHWIN',	1	,'LNHPIT',	2	),
('26/10/2017',	'19H00'	,'LNHARI',	2	,'LNHNYR',	5	),
('26/10/2017',	'19H30'	,'LNHPHI',	4	,'LNHOTT',	5	),
('26/10/2017',	'19H30'	,'LNHDET',	2	,'LNHTBL',	3	),
('26/10/2017',	'19H30'	,'LNHANA',	3	,'LNHFLO',	8	),
('26/10/2017',	'19H30'	,'LNHLAK',	4	,'LNHMON',	0	),
('26/10/2017',	'20H00'	,'LNHNYI',	4	,'LNHMIN',	6	),
('26/10/2017',	'21H00'	,'LNHDAL',	4	,'LNHEDM',	5	),
('26/10/2017',	'22H00'	,'LNHWAS',	2	,'LNHVAN',	6	),
('27/10/2017',	'18H00'	,'LNHCOA',	0	,'LNHLVK',	7	),
('27/10/2017',	'19H00'	,'LNHOTT',	4	,'LNHNJD',	5	),
('27/10/2017',	'19H00'	,'LNHWIN',	1	,'LNHCOB',	2	),
('27/10/2017',	'19H30'	,'LNHSTL',	2	,'LNHCAR',	1	),
('27/10/2017',	'20H30'	,'LNHNAS',	2	,'LNHCHI',	1	),
('27/10/2017',	'21H00'	,'LNHDAL',	2	,'LNHCAL',	1	),
('28/10/2017',	'13H00'	,'LNHSJS',	3	,'LNHBUF',	2	),
('28/10/2017',	'19H00'	,'LNHNYR',	4	,'LNHMON',	5	),
('28/10/2017',	'19H00'	,'LNHPHI',	4	,'LNHTOR',	2	),
('28/10/2017',	'19H00'	,'LNHDET',	3	,'LNHFLO',	2	),
('28/10/2017',	'19H00'	,'LNHANA',	4	,'LNHTBL',	1	),
('28/10/2017',	'19H00'	,'LNHLAK',	2	,'LNHBOS',	1	),
('28/10/2017',	'19H00'	,'LNHARI',	3	,'LNHNJD',	4	),
('28/10/2017',	'20H00'	,'LNHNYI',	6	,'LNHNAS',	2	),
('28/10/2017',	'20H00'	,'LNHPIT',	1	,'LNHMIN',	2	),
('28/10/2017',	'20H00'	,'LNHCOB',	1	,'LNHSTL',	4	),
('28/10/2017',	'21H00'	,'LNHCHI',	3	,'LNHCOA',	6	),
('28/10/2017',	'22H00'	,'LNHWAS',	5	,'LNHEDM',	2	),
('29/10/2017',	'17H00'	,'LNHANA',	4	,'LNHCAR',	3	),
('29/10/2017',	'19H00'	,'LNHPIT',	1	,'LNHWIN',	7	),
('29/10/2017',	'21H00'	,'LNHWAS',	1	,'LNHCAL',	2	),
('30/10/2017',	'19H00'	,'LNHBOS',	3	,'LNHCOB',	4	),
('30/10/2017',	'19H00'	,'LNHARI',	4	,'LNHPHI',	3	),
('30/10/2017',	'19H00'	,'LNHLVK',	3	,'LNHNYI',	6	),
('30/10/2017',	'19H30'	,'LNHMON',	8	,'LNHOTT',	3	),
('30/10/2017',	'19H30'	,'LNHTBL',	8	,'LNHFLO',	5	),
('30/10/2017',	'20H00'	,'LNHLAK',	2	,'LNHSTL',	4	),
('30/10/2017',	'22H00'	,'LNHDAL',	2	,'LNHVAN',	1	),
('30/10/2017',	'22H30'	,'LNHTOR',	2	,'LNHSJS',	3	),
('31/10/2017',	'19H00'	,'LNHLVK',	4	,'LNHNYR',	6	),
('31/10/2017',	'19H30'	,'LNHARI',	3	,'LNHDET',	5	),
('31/10/2017',	'20H00'	,'LNHWIN',	2	,'LNHMIN',	1	),
						
('1/11/2017',	'20H00'	,'LNHPHI',	0	,'LNHCHI',	3	),
('1/11/2017',	'20H30'	,'LNHPIT',	3	,'LNHEDM',	2	),
('1/11/2017',	'22H00'	,'LNHNJD',	2	,'LNHVAN',	0	),
('1/11/2017',	'22H00'	,'LNHTOR',	3	,'LNHANA',	1	),
('1/11/2017',	'22H30'	,'LNHNAS',	1	,'LNHSJS',	4	),
('2/11/2017',	'19H00'	,'LNHLVK',	1	,'LNHBOS',	2	),
('2/11/2017',	'19H00'	,'LNHNYI',	3	,'LNHWAS',	4	),
('2/11/2017',	'19H30'	,'LNHDET',	1	,'LNHOTT',	3	),
('2/11/2017',	'19H30'	,'LNHNYR',	2	,'LNHTBL',	1	),
('2/11/2017',	'19H30'	,'LNHCOB',	7	,'LNHFLO',	3	),
('2/11/2017',	'20H00'	,'LNHPHI',	2	,'LNHSTL',	0	),
('2/11/2017',	'20H00'	,'LNHMON',	3	,'LNHMIN',	6	),
('2/11/2017',	'20H00'	,'LNHDAL',	2	,'LNHWIN',	5	),
('2/11/2017',	'21H00'	,'LNHCAR',	3	,'LNHCOA',	5	),
('2/11/2017',	'21H00'	,'LNHPIT',	1	,'LNHCAL',	2	),
('2/11/2017',	'22H00'	,'LNHBUF',	5	,'LNHARI',	4	),
('2/11/2017',	'22H30'	,'LNHTOR',	3	,'LNHLAK',	5	),
('3/11/2017',	'21H00'	,'LNHNJD',	3	,'LNHEDM',	6	),
('3/11/2017',	'22H00'	,'LNHNAS',	5	,'LNHANA',	3	),
('4/11/2017',	'14H00'	,'LNHLVK',	5	,'LNHOTT',	4	),
('4/11/2017',	'19H00'	,'LNHTOR',	4	,'LNHSTL',	6	),
('4/11/2017',	'19H00'	,'LNHMON',	5	,'LNHWIN',	4	),
('4/11/2017',	'19H00'	,'LNHWAS',	3	,'LNHBOS',	2	),
('4/11/2017',	'19H00'	,'LNHCOB',	4	,'LNHTBL',	5	),
('4/11/2017',	'19H00'	,'LNHNYR',	5	,'LNHFLO',	4	),
('4/11/2017',	'19H00'	,'LNHCOA',	4	,'LNHPHI',	5	),
('4/11/2017',	'20H00'	,'LNHBUF',	1	,'LNHDAL',	5	),
('4/11/2017',	'20H00'	,'LNHCHI',	2	,'LNHMIN',	0	),
('4/11/2017',	'21H00'	,'LNHCAR',	1	,'LNHARI',	2	),
('4/11/2017',	'22H00'	,'LNHPIT',	2	,'LNHVAN',	4	),
('4/11/2017',	'22H30'	,'LNHNAS',	4	,'LNHLAK',	3	),
('4/11/2017',	'22H30'	,'LNHANA',	1	,'LNHSJS',	2	),
('5/11/2017',	'16H00'	,'LNHDET',	4	,'LNHEDM',	0	),
('5/11/2017',	'18H00'	,'LNHCOA',	4	,'LNHNYI',	6	),
('5/11/2017',	'19H00'	,'LNHMON',	2	,'LNHCHI',	0	),
('5/11/2017',	'21H00'	,'LNHNJD',	4	,'LNHCAL',	5	),
('6/11/2017',	'19H00'	,'LNHMIN',	0	,'LNHBOS',	0	),
('6/11/2017',	'19H00'	,'LNHLVK',	0	,'LNHTOR',	0	),
('6/11/2017',	'19H00'	,'LNHCOB',	0	,'LNHNYR',	0	),
('6/11/2017',	'19H00'	,'LNHARI',	0	,'LNHWAS',	0	),
('6/11/2017',	'20H30'	,'LNHWIN',	0	,'LNHDAL',	0	),
('6/11/2017',	'22H00'	,'LNHDET',	0	,'LNHVAN',	0	),
('7/11/2017',	'19H00'	,'LNHWAS',	0	,'LNHBUF',	0	),
('7/11/2017',	'19H00'	,'LNHSTL',	0	,'LNHNJD',	0	),
('7/11/2017',	'19H00'	,'LNHEDM',	0	,'LNHNYI',	0	),
('7/11/2017',	'19H00'	,'LNHARI',	0	,'LNHPIT',	0	),
('7/11/2017',	'19H00'	,'LNHFLO',	0	,'LNHCAR',	0	),
('7/11/2017',	'19H00'	,'LNHNAS',	0	,'LNHCOB',	0	),
('7/11/2017',	'19H30'	,'LNHLVK',	0	,'LNHMON',	0	),
('7/11/2017',	'21H00'	,'LNHVAN',	0	,'LNHCAL',	0	),
('7/11/2017',	'22H00'	,'LNHLAK',	0	,'LNHANA',	0	),
('8/11/2017',	'19H30'	,'LNHMIN',	0	,'LNHTOR',	0	),
('8/11/2017',	'20H00'	,'LNHBOS',	0	,'LNHNYR',	0	),
('8/11/2017',	'22H30'	,'LNHTBL',	0	,'LNHSJS',	0	),
('9/11/2017',	'19H00'	,'LNHEDM',	0	,'LNHNJD',	0	),
('9/11/2017',	'19H00'	,'LNHCHI',	0	,'LNHPHI',	0	),
('9/11/2017',	'19H30'	,'LNHMIN',	0	,'LNHMON',	0	),
('9/11/2017',	'20H00'	,'LNHARI',	0	,'LNHSTL',	0	),
('9/11/2017',	'21H00'	,'LNHDET',	0	,'LNHCAL',	0	),
('9/11/2017',	'22H00'	,'LNHVAN',	0	,'LNHANA',	0	),
('9/11/2017',	'22H30'	,'LNHTBL',	0	,'LNHLAK',	0	),
('10/11/2017',	'19H00'	,'LNHFLO',	0	,'LNHBUF',	0	),
('10/11/2017',	'19H00'	,'LNHBOS',	0	,'LNHTOR',	0	),
('10/11/2017',	'19H00'	,'LNHPIT',	0	,'LNHWAS',	0	),
('10/11/2017',	'19H00'	,'LNHCAR',	0	,'LNHCOB',	0	),
('10/11/2017',	'20H30'	,'LNHNYI',	0	,'LNHDAL',	0	),
('10/11/2017',	'22H00'	,'LNHOTT',	0	,'LNHCOA',	0	),
('10/11/2017',	'22H30'	,'LNHWIN',	0	,'LNHLVK',	0	),
('11/11/2017',	'13H00'	,'LNHEDM',	0	,'LNHNYR',	0	),
('11/11/2017',	'19H00'	,'LNHTOR',	0	,'LNHBOS',	0	),
('11/11/2017',	'19H00'	,'LNHBUF',	0	,'LNHMON',	0	),
('11/11/2017',	'19H00'	,'LNHCOA',	0	,'LNHOTT',	0	),
('11/11/2017',	'19H00'	,'LNHCOB',	0	,'LNHDET',	0	),
('11/11/2017',	'19H00'	,'LNHFLO',	0	,'LNHNJD',	0	),
('11/11/2017',	'19H00'	,'LNHMIN',	0	,'LNHPHI',	0	),
('11/11/2017',	'19H00'	,'LNHCHI',	0	,'LNHCAR',	0	),
('11/11/2017',	'20H00'	,'LNHNYI',	0	,'LNHSTL',	0	),
('11/11/2017',	'20H00'	,'LNHPIT',	0	,'LNHNAS',	0	),
('11/11/2017',	'22H00'	,'LNHVAN',	0	,'LNHSJS',	0	),
('11/11/2017',	'22H00'	,'LNHWIN',	0	,'LNHARI',	0	),
('12/11/2017',	'19H00'	,'LNHNJD',	0	,'LNHCHI',	0	),
('12/11/2017',	'19H00'	,'LNHEDM',	0	,'LNHWAS',	0	),
('12/11/2017',	'20H00'	,'LNHTBL',	0	,'LNHANA',	0	),
('12/11/2017',	'22H30'	,'LNHSJS',	0	,'LNHLAK',	0	),
('13/11/2017',	'19H00'	,'LNHDAL',	0	,'LNHCAR',	0	),
('13/11/2017',	'21H00'	,'LNHSTL',	0	,'LNHCAL',	0	),
('14/11/2017',	'19H00'	,'LNHBUF',	0	,'LNHPIT',	0	),
('14/11/2017',	'19H30'	,'LNHCOB',	0	,'LNHMON',	0	),
('14/11/2017',	'19H30'	,'LNHDAL',	0	,'LNHFLO',	0	),
('14/11/2017',	'20H00'	,'LNHWAS',	0	,'LNHNAS',	0	),
('14/11/2017',	'20H00'	,'LNHPHI',	0	,'LNHMIN',	0	),
('14/11/2017',	'20H00'	,'LNHARI',	0	,'LNHWIN',	0	),
('14/11/2017',	'21H00'	,'LNHLVK',	0	,'LNHEDM',	0	),
('14/11/2017',	'22H30'	,'LNHVAN',	0	,'LNHLAK',	0	),
('15/11/2017',	'19H30'	,'LNHCAL',	0	,'LNHDET',	0	),
('15/11/2017',	'20H00'	,'LNHNYR',	0	,'LNHCHI',	0	),
('15/11/2017',	'22H00'	,'LNHBOS',	0	,'LNHANA',	0	),
('16/11/2017',	'19H00'	,'LNHNJD',	0	,'LNHTOR',	0	),
('16/11/2017',	'19H00'	,'LNHCAR',	0	,'LNHNYI',	0	),
('16/11/2017',	'19H30'	,'LNHARI',	0	,'LNHMON',	0	),
('16/11/2017',	'19H30'	,'LNHPIT',	0	,'LNHOTT',	0	),
('16/11/2017',	'19H30'	,'LNHDAL',	0	,'LNHTBL',	0	),
('16/11/2017',	'20H00'	,'LNHNAS',	0	,'LNHMIN',	0	),
('16/11/2017',	'20H00'	,'LNHPHI',	0	,'LNHWIN',	0	),
('16/11/2017',	'21H00'	,'LNHWAS',	0	,'LNHCOA',	0	),
('16/11/2017',	'21H00'	,'LNHSTL',	0	,'LNHEDM',	0	),
('16/11/2017',	'22H00'	,'LNHLVK',	0	,'LNHVAN',	0	),
('16/11/2017',	'22H30'	,'LNHBOS',	0	,'LNHLAK',	0	),
('16/11/2017',	'22H30'	,'LNHFLO',	0	,'LNHSJS',	0	),
('17/11/2017',	'19H00'	,'LNHNYR',	0	,'LNHCOB',	0	),
('17/11/2017',	'19H30'	,'LNHBUF',	0	,'LNHDET',	0	),
('18/11/2017',	'13H00'	,'LNHCAL',	0	,'LNHPHI',	0	),
('18/11/2017',	'14H00'	,'LNHEDM',	0	,'LNHDAL',	0	),
('18/11/2017',	'14H00'	,'LNHARI',	0	,'LNHOTT',	0	),
('18/11/2017',	'15H00'	,'LNHNJD',	0	,'LNHWIN',	0	),
('18/11/2017',	'16H00'	,'LNHFLO',	0	,'LNHLAK',	0	),
('18/11/2017',	'19H00'	,'LNHCAR',	0	,'LNHBUF',	0	),
('18/11/2017',	'19H00'	,'LNHTOR',	0	,'LNHMON',	0	),
('18/11/2017',	'19H00'	,'LNHNYI',	0	,'LNHTBL',	0	),
('18/11/2017',	'19H00'	,'LNHCHI',	0	,'LNHPIT',	0	),
('18/11/2017',	'19H30'	,'LNHMIN',	0	,'LNHWAS',	0	),
('18/11/2017',	'20H00'	,'LNHCOA',	0	,'LNHNAS',	0	),
('18/11/2017',	'22H00'	,'LNHSTL',	0	,'LNHVAN',	0	),
('18/11/2017',	'22H30'	,'LNHBOS',	0	,'LNHSJS',	0	),
('19/11/2017',	'17H00'	,'LNHNYI',	0	,'LNHCAR',	0	),
('19/11/2017',	'18H00'	,'LNHCOA',	0	,'LNHDET',	0	),
('19/11/2017',	'19H00'	,'LNHOTT',	0	,'LNHNYR',	0	),
('19/11/2017',	'20H00'	,'LNHLAK',	0	,'LNHLVK',	0	),
('19/11/2017',	'20H00'	,'LNHFLO',	0	,'LNHANA',	0	),
('20/11/2017',	'19H00'	,'LNHCOB',	0	,'LNHBUF',	0	),
('20/11/2017',	'19H00'	,'LNHARI',	0	,'LNHTOR',	0	),
('20/11/2017',	'19H00'	,'LNHCAL',	0	,'LNHWAS',	0	),
('20/11/2017',	'20H00'	,'LNHWIN',	0	,'LNHNAS',	0	),
('20/11/2017',	'20H00'	,'LNHNJD',	0	,'LNHMIN',	0	),
('20/11/2017',	'22H30'	,'LNHANA',	0	,'LNHSJS',	0	),
('21/11/2017',	'19H00'	,'LNHVAN',	0	,'LNHPHI',	0	),
('21/11/2017',	'20H00'	,'LNHEDM',	0	,'LNHSTL',	0	),
('21/11/2017',	'20H30'	,'LNHMON',	0	,'LNHDAL',	0	),
('22/11/2017',	'19H00'	,'LNHMIN',	0	,'LNHBUF',	0	),
('22/11/2017',	'19H00'	,'LNHEDM',	0	,'LNHDET',	0	),
('22/11/2017',	'19H00'	,'LNHTOR',	0	,'LNHFLO',	0	),
('22/11/2017',	'19H00'	,'LNHBOS',	0	,'LNHNJD',	0	),
('22/11/2017',	'19H00'	,'LNHPHI',	0	,'LNHNYI',	0	),
('22/11/2017',	'19H00'	,'LNHVAN',	0	,'LNHPIT',	0	),
('22/11/2017',	'19H00'	,'LNHOTT',	0	,'LNHWAS',	0	),
('22/11/2017',	'19H00'	,'LNHNYR',	0	,'LNHCAR',	0	),
('22/11/2017',	'19H00'	,'LNHCAL',	0	,'LNHCOB',	0	),
('22/11/2017',	'19H30'	,'LNHCHI',	0	,'LNHTBL',	0	),
('22/11/2017',	'20H00'	,'LNHMON',	0	,'LNHNAS',	0	),
('22/11/2017',	'21H00'	,'LNHDAL',	0	,'LNHCOA',	0	),
('22/11/2017',	'21H00'	,'LNHSJS',	0	,'LNHARI',	0	),
('22/11/2017',	'22H00'	,'LNHLVK',	0	,'LNHANA',	0	),
('22/11/2017',	'22H30'	,'LNHWIN',	0	,'LNHLAK',	0	),
('24/11/2017',	'13H00'	,'LNHPIT',	0	,'LNHBOS',	0	),
('24/11/2017',	'16H00'	,'LNHWIN',	0	,'LNHANA',	0	),
('24/11/2017',	'16H00'	,'LNHCOA',	0	,'LNHMIN',	0	),
('24/11/2017',	'16H00'	,'LNHNYI',	0	,'LNHPHI',	0	),
('24/11/2017',	'17H00'	,'LNHTBL',	0	,'LNHWAS',	0	),
('24/11/2017',	'19H00'	,'LNHEDM',	0	,'LNHBUF',	0	),
('24/11/2017',	'19H00'	,'LNHVAN',	0	,'LNHNJD',	0	),
('24/11/2017',	'19H00'	,'LNHDET',	0	,'LNHNYR',	0	),
('24/11/2017',	'19H00'	,'LNHOTT',	0	,'LNHCOB',	0	),
('24/11/2017',	'19H30'	,'LNHTOR',	0	,'LNHCAR',	0	),
('24/11/2017',	'20H00'	,'LNHNAS',	0	,'LNHSTL',	0	),
('24/11/2017',	'21H00'	,'LNHLAK',	0	,'LNHARI',	0	),
('24/11/2017',	'21H00'	,'LNHCAL',	0	,'LNHDAL',	0	),
('24/11/2017',	'22H00'	,'LNHSJS',	0	,'LNHLVK',	0	),
('25/11/2017',	'19H00'	,'LNHWAS',	0	,'LNHTOR',	0	),
('25/11/2017',	'19H00'	,'LNHBUF',	0	,'LNHMON',	0	),
('25/11/2017',	'19H00'	,'LNHNYI',	0	,'LNHOTT',	0	),
('25/11/2017',	'19H00'	,'LNHNJD',	0	,'LNHDET',	0	),
('25/11/2017',	'19H00'	,'LNHCHI',	0	,'LNHFLO',	0	),
('25/11/2017',	'19H00'	,'LNHTBL',	0	,'LNHPIT',	0	),
('25/11/2017',	'20H00'	,'LNHLVK',	0	,'LNHARI',	0	),
('25/11/2017',	'20H00'	,'LNHMIN',	0	,'LNHSTL',	0	),
('25/11/2017',	'22H00'	,'LNHWIN',	0	,'LNHSJS',	0	),
('25/11/2017',	'22H00'	,'LNHCAL',	0	,'LNHCOA',	0	),
('25/11/2017',	'22H30'	,'LNHANA',	0	,'LNHLAK',	0	),
('26/11/2017',	'13H00'	,'LNHNAS',	0	,'LNHCAR',	0	),
('26/11/2017',	'14H00'	,'LNHVAN',	0	,'LNHNYR',	0	),
('26/11/2017',	'17H00'	,'LNHEDM',	0	,'LNHBOS',	0	),
('27/11/2017',	'19H00'	,'LNHFLO',	0	,'LNHNJD',	0	),
('27/11/2017',	'19H00'	,'LNHPHI',	0	,'LNHPIT',	0	),
('27/11/2017',	'19H30'	,'LNHCOB',	0	,'LNHMON',	0	),
('27/11/2017',	'20H00'	,'LNHMIN',	0	,'LNHWIN',	0	),
('27/11/2017',	'20H30'	,'LNHANA',	0	,'LNHCHI',	0	),
('28/11/2017',	'19H00'	,'LNHTBL',	0	,'LNHBUF',	0	),
('28/11/2017',	'19H00'	,'LNHVAN',	0	,'LNHNYI',	0	),
('28/11/2017',	'19H00'	,'LNHFLO',	0	,'LNHNYR',	0	),
('28/11/2017',	'19H00'	,'LNHSJS',	0	,'LNHPHI',	0	),
('28/11/2017',	'19H00'	,'LNHCAR',	0	,'LNHCOB',	0	),
('28/11/2017',	'19H30'	,'LNHLAK',	0	,'LNHDET',	0	),
('28/11/2017',	'20H00'	,'LNHCHI',	0	,'LNHNAS',	0	),
('28/11/2017',	'21H00'	,'LNHTOR',	0	,'LNHCAL',	0	),
('28/11/2017',	'21H00'	,'LNHARI',	0	,'LNHEDM',	0	),
('28/11/2017',	'22H00'	,'LNHDAL',	0	,'LNHLVK',	0	),
('29/11/2017',	'19H30'	,'LNHTBL',	0	,'LNHBOS',	0	),
('29/11/2017',	'19H30'	,'LNHOTT',	0	,'LNHMON',	0	),
('29/11/2017',	'21H00'	,'LNHANA',	0	,'LNHSTL',	0	),
('29/11/2017',	'21H30'	,'LNHWIN',	0	,'LNHCOA',	0	),
('30/11/2017',	'19H00'	,'LNHLAK',	0	,'LNHWAS',	0	),
('30/11/2017',	'19H30'	,'LNHMON',	0	,'LNHDET',	0	),
('30/11/2017',	'20H00'	,'LNHVAN',	0	,'LNHNAS',	0	),
('30/11/2017',	'20H00'	,'LNHLVK',	0	,'LNHMIN',	0	),
('30/11/2017',	'20H30'	,'LNHDAL',	0	,'LNHCHI',	0	),
('30/11/2017',	'21H00'	,'LNHARI',	0	,'LNHCAL',	0	),
('30/11/2017',	'21H00'	,'LNHTOR',	0	,'LNHEDM',	0	),
						
('1/12/2017',	'19H00'	,'LNHPIT',	0	,'LNHBUF',	0	),
('1/12/2017',	'19H00'	,'LNHOTT',	0	,'LNHNYI',	0	),
('1/12/2017',	'19H00'	,'LNHCAR',	0	,'LNHNYR',	0	),
('1/12/2017',	'19H00'	,'LNHANA',	0	,'LNHCOB',	0	),
('1/12/2017',	'19H30'	,'LNHSJS',	0	,'LNHFLO',	0	),
('1/12/2017',	'20H00'	,'LNHLAK',	0	,'LNHSTL',	0	),
('1/12/2017',	'20H00'	,'LNHLVK',	0	,'LNHWIN',	0	),
('1/12/2017',	'21H00'	,'LNHNJD',	0	,'LNHCOA',	0	),
('2/12/2017',	'13H00'	,'LNHBOS',	0	,'LNHPHI',	0	),
('2/12/2017',	'18H00'	,'LNHSTL',	0	,'LNHMIN',	0	),
('2/12/2017',	'19H00'	,'LNHTOR',	0	,'LNHVAN',	0	),
('2/12/2017',	'19H00'	,'LNHDET',	0	,'LNHMON',	0	),
('2/12/2017',	'19H00'	,'LNHSJS',	0	,'LNHTBL',	0	),
('2/12/2017',	'19H00'	,'LNHBUF',	0	,'LNHPIT',	0	),
('2/12/2017',	'19H00'	,'LNHCOB',	0	,'LNHWAS',	0	),
('2/12/2017',	'20H00'	,'LNHNJD',	0	,'LNHARI',	0	),
('2/12/2017',	'20H00'	,'LNHANA',	0	,'LNHNAS',	0	),
('2/12/2017',	'20H00'	,'LNHFLO',	0	,'LNHCAR',	0	),
('2/12/2017',	'21H00'	,'LNHCHI',	0	,'LNHDAL',	0	),
('2/12/2017',	'22H00'	,'LNHEDM',	0	,'LNHCAL',	0	),
('3/12/2017',	'19H00'	,'LNHLAK',	0	,'LNHCHI',	0	),
('3/12/2017',	'19H00'	,'LNHOTT',	0	,'LNHWIN',	0	),
('3/12/2017',	'20H00'	,'LNHARI',	0	,'LNHLVK',	0	),
('3/12/2017',	'20H00'	,'LNHDAL',	0	,'LNHCOA',	0	),
('4/12/2017',	'19H00'	,'LNHSJS',	0	,'LNHWAS',	0	),
('4/12/2017',	'19H30'	,'LNHNYI',	0	,'LNHFLO',	0	),
('4/12/2017',	'20H00'	,'LNHBOS',	0	,'LNHNAS',	0	),
('4/12/2017',	'21H00'	,'LNHPHI',	0	,'LNHCAL',	0	),
('5/12/2017',	'19H00'	,'LNHNYR',	0	,'LNHPIT',	0	),
('5/12/2017',	'19H00'	,'LNHNJD',	0	,'LNHCOB',	0	),
('5/12/2017',	'19H30'	,'LNHSTL',	0	,'LNHMON',	0	),
('5/12/2017',	'19H30'	,'LNHWIN',	0	,'LNHDET',	0	),
('5/12/2017',	'19H30'	,'LNHNYI',	0	,'LNHTBL',	0	),
('5/12/2017',	'20H30'	,'LNHNAS',	0	,'LNHDAL',	0	),
('5/12/2017',	'21H00'	,'LNHBUF',	0	,'LNHCOA',	0	),
('5/12/2017',	'22H00'	,'LNHCAR',	0	,'LNHVAN',	0	),
('5/12/2017',	'22H00'	,'LNHANA',	0	,'LNHLVK',	0	),
('5/12/2017',	'22H30'	,'LNHMIN',	0	,'LNHLAK',	0	),
('6/12/2017',	'19H30'	,'LNHCAL',	0	,'LNHTOR',	0	),
('6/12/2017',	'20H00'	,'LNHCHI',	0	,'LNHWAS',	0	),
('6/12/2017',	'21H30'	,'LNHPHI',	0	,'LNHEDM',	0	),
('6/12/2017',	'22H00'	,'LNHOTT',	0	,'LNHANA',	0	),
('7/12/2017',	'19H00'	,'LNHARI',	0	,'LNHBOS',	0	),
('7/12/2017',	'19H00'	,'LNHNYI',	0	,'LNHPIT',	0	),
('7/12/2017',	'19H30'	,'LNHCAL',	0	,'LNHMON',	0	),
('7/12/2017',	'19H30'	,'LNHCOA',	0	,'LNHTBL',	0	),
('7/12/2017',	'19H30'	,'LNHWIN',	0	,'LNHFLO',	0	),
('7/12/2017',	'20H00'	,'LNHDAL',	0	,'LNHSTL',	0	),
('7/12/2017',	'22H00'	,'LNHPHI',	0	,'LNHVAN',	0	),
('7/12/2017',	'22H30'	,'LNHOTT',	0	,'LNHLAK',	0	),
('7/12/2017',	'22H30'	,'LNHCAR',	0	,'LNHSJS',	0	),
('8/12/2017',	'19H00'	,'LNHCOB',	0	,'LNHNJD',	0	),
('8/12/2017',	'19H00'	,'LNHNYR',	0	,'LNHWAS',	0	),
('8/12/2017',	'20H00'	,'LNHLVK',	0	,'LNHNAS',	0	),
('8/12/2017',	'20H30'	,'LNHBUF',	0	,'LNHCHI',	0	),
('8/12/2017',	'22H00'	,'LNHMIN',	0	,'LNHANA',	0	),
('9/12/2017',	'15H00'	,'LNHSTL',	0	,'LNHDET',	0	),
('9/12/2017',	'19H00'	,'LNHNYI',	0	,'LNHBOS',	0	),
('9/12/2017',	'19H00'	,'LNHEDM',	0	,'LNHMON',	0	),
('9/12/2017',	'19H00'	,'LNHWIN',	0	,'LNHTBL',	0	),
('9/12/2017',	'19H00'	,'LNHCOA',	0	,'LNHFLO',	0	),
('9/12/2017',	'19H00'	,'LNHNJD',	0	,'LNHNYR',	0	),
('9/12/2017',	'19H00'	,'LNHTOR',	0	,'LNHPIT',	0	),
('9/12/2017',	'19H00'	,'LNHARI',	0	,'LNHCOB',	0	),
('9/12/2017',	'20H00'	,'LNHLVK',	0	,'LNHDAL',	0	),
('9/12/2017',	'22H00'	,'LNHOTT',	0	,'LNHSJS',	0	),
('9/12/2017',	'22H00'	,'LNHVAN',	0	,'LNHCAL',	0	),
('9/12/2017',	'22H30'	,'LNHCAR',	0	,'LNHLAK',	0	),
('10/12/2017',	'19H00'	,'LNHARI',	0	,'LNHCHI',	0	),
('10/12/2017',	'19H00'	,'LNHBUF',	0	,'LNHSTL',	0	),
('10/12/2017',	'19H00'	,'LNHEDM',	0	,'LNHTOR',	0	),
('10/12/2017',	'21H00'	,'LNHMIN',	0	,'LNHSJS',	0	),
('11/12/2017',	'19H00'	,'LNHWAS',	0	,'LNHNYI',	0	),
('11/12/2017',	'19H00'	,'LNHDAL',	0	,'LNHNYR',	0	),
('11/12/2017',	'19H00'	,'LNHCOA',	0	,'LNHPIT',	0	),
('11/12/2017',	'19H30'	,'LNHFLO',	0	,'LNHDET',	0	),
('11/12/2017',	'20H00'	,'LNHVAN',	0	,'LNHWIN',	0	),
('11/12/2017',	'22H00'	,'LNHCAR',	0	,'LNHANA',	0	),
('12/12/2017',	'19H00'	,'LNHOTT',	0	,'LNHBUF',	0	),
('12/12/2017',	'19H00'	,'LNHLAK',	0	,'LNHNJD',	0	),
('12/12/2017',	'19H00'	,'LNHTOR',	0	,'LNHPHI',	0	),
('12/12/2017',	'19H00'	,'LNHCOA',	0	,'LNHWAS',	0	),
('12/12/2017',	'19H00'	,'LNHEDM',	0	,'LNHCOB',	0	),
('12/12/2017',	'20H00'	,'LNHTBL',	0	,'LNHSTL',	0	),
('12/12/2017',	'20H00'	,'LNHCAL',	0	,'LNHMIN',	0	),
('12/12/2017',	'20H30'	,'LNHFLO',	0	,'LNHCHI',	0	),
('12/12/2017',	'22H00'	,'LNHCAR',	0	,'LNHLVK',	0	),
('13/12/2017',	'19H00'	,'LNHNYR',	0	,'LNHOTT',	0	),
('13/12/2017',	'19H00'	,'LNHDAL',	0	,'LNHNYI',	0	),
('13/12/2017',	'20H00'	,'LNHBOS',	0	,'LNHDET',	0	),
('13/12/2017',	'22H00'	,'LNHNAS',	0	,'LNHVAN',	0	),
('14/12/2017',	'19H00'	,'LNHWAS',	0	,'LNHBOS',	0	),
('14/12/2017',	'19H00'	,'LNHBUF',	0	,'LNHPHI',	0	),
('14/12/2017',	'19H00'	,'LNHNYI',	0	,'LNHCOB',	0	),
('14/12/2017',	'19H30'	,'LNHNJD',	0	,'LNHMON',	0	),
('14/12/2017',	'20H00'	,'LNHANA',	0	,'LNHSTL',	0	),
('14/12/2017',	'20H00'	,'LNHTOR',	0	,'LNHMIN',	0	),
('14/12/2017',	'20H00'	,'LNHCHI',	0	,'LNHWIN',	0	),
('14/12/2017',	'21H00'	,'LNHFLO',	0	,'LNHCOA',	0	),
('14/12/2017',	'21H00'	,'LNHSJS',	0	,'LNHCAL',	0	),
('14/12/2017',	'21H00'	,'LNHNAS',	0	,'LNHEDM',	0	),
('14/12/2017',	'21H00'	,'LNHTBL',	0	,'LNHARI',	0	),
('14/12/2017',	'22H00'	,'LNHPIT',	0	,'LNHLVK',	0	),
('15/12/2017',	'19H00'	,'LNHCAR',	0	,'LNHBUF',	0	),
('15/12/2017',	'19H00'	,'LNHDAL',	0	,'LNHNJD',	0	),
('15/12/2017',	'19H00'	,'LNHLAK',	0	,'LNHNYR',	0	),
('15/12/2017',	'19H30'	,'LNHTOR',	0	,'LNHDET',	0	),
('15/12/2017',	'22H00'	,'LNHSJS',	0	,'LNHVAN',	0	),
('16/12/2017',	'14H00'	,'LNHEDM',	0	,'LNHMIN',	0	),
('16/12/2017',	'17H00'	,'LNHNYR',	0	,'LNHBOS',	0	),
('16/12/2017',	'19H00'	,'LNHWIN',	0	,'LNHSTL',	0	),
('16/12/2017',	'19H00'	,'LNHMON',	0	,'LNHOTT',	0	),
('16/12/2017',	'19H00'	,'LNHLAK',	0	,'LNHNYI',	0	),
('16/12/2017',	'19H00'	,'LNHDAL',	0	,'LNHPHI',	0	),
('16/12/2017',	'19H30'	,'LNHANA',	0	,'LNHWAS',	0	),
('16/12/2017',	'20H00'	,'LNHPIT',	0	,'LNHARI',	0	),
('16/12/2017',	'20H00'	,'LNHCOB',	0	,'LNHCAR',	0	),
('16/12/2017',	'21H00'	,'LNHTBL',	0	,'LNHCOA',	0	),
('16/12/2017',	'22H00'	,'LNHNAS',	0	,'LNHCAL',	0	),
('17/12/2017',	'18H00'	,'LNHSTL',	0	,'LNHWIN',	0	),
('17/12/2017',	'19H00'	,'LNHMIN',	0	,'LNHCHI',	0	),
('17/12/2017',	'20H00'	,'LNHCAL',	0	,'LNHVAN',	0	),
('17/12/2017',	'20H00'	,'LNHFLO',	0	,'LNHLVK',	0	),
('18/12/2017',	'19H00'	,'LNHCOB',	0	,'LNHBOS',	0	),
('18/12/2017',	'19H00'	,'LNHANA',	0	,'LNHNJD',	0	),
('18/12/2017',	'19H00'	,'LNHLAK',	0	,'LNHPHI',	0	),
('18/12/2017',	'21H00'	,'LNHPIT',	0	,'LNHCOA',	0	),
('18/12/2017',	'21H00'	,'LNHSJS',	0	,'LNHEDM',	0	),
('19/12/2017',	'14H00'	,'LNHCAR',	0	,'LNHTOR',	0	),
('19/12/2017',	'19H00'	,'LNHBOS',	0	,'LNHBUF',	0	),
('19/12/2017',	'19H00'	,'LNHDET',	0	,'LNHNYI',	0	),
('19/12/2017',	'19H00'	,'LNHANA',	0	,'LNHNYR',	0	),
('19/12/2017',	'19H30'	,'LNHMIN',	0	,'LNHOTT',	0	),
('19/12/2017',	'20H00'	,'LNHWIN',	0	,'LNHNAS',	0	),
('19/12/2017',	'20H30'	,'LNHWAS',	0	,'LNHDAL',	0	),
('19/12/2017',	'21H00'	,'LNHFLO',	0	,'LNHARI',	0	),
('19/12/2017',	'22H00'	,'LNHMON',	0	,'LNHVAN',	0	),
('19/12/2017',	'22H00'	,'LNHTBL',	0	,'LNHLVK',	0	),
('20/12/2017',	'19H30'	,'LNHTOR',	0	,'LNHCOB',	0	),
('20/12/2017',	'20H00'	,'LNHDET',	0	,'LNHPHI',	0	),
('20/12/2017',	'21H30'	,'LNHSTL',	0	,'LNHCAL',	0	),
('21/12/2017',	'19H00'	,'LNHWIN',	0	,'LNHBOS',	0	),
('21/12/2017',	'19H00'	,'LNHNYR',	0	,'LNHNJD',	0	),
('21/12/2017',	'19H00'	,'LNHANA',	0	,'LNHNYI',	0	),
('21/12/2017',	'19H00'	,'LNHCOB',	0	,'LNHPIT',	0	),
('21/12/2017',	'19H30'	,'LNHOTT',	0	,'LNHTBL',	0	),
('21/12/2017',	'20H00'	,'LNHCAR',	0	,'LNHNAS',	0	),
('21/12/2017',	'20H30'	,'LNHCHI',	0	,'LNHDAL',	0	),
('21/12/2017',	'21H00'	,'LNHSTL',	0	,'LNHEDM',	0	),
('21/12/2017',	'22H30'	,'LNHCOA',	0	,'LNHLAK',	0	),
('21/12/2017',	'22H30'	,'LNHVAN',	0	,'LNHSJS',	0	),
('22/12/2017',	'19H00'	,'LNHPHI',	0	,'LNHBUF',	0	),
('22/12/2017',	'19H30'	,'LNHMIN',	0	,'LNHFLO',	0	),
('22/12/2017',	'21H00'	,'LNHMON',	0	,'LNHCAL',	0	),
('22/12/2017',	'21H00'	,'LNHWAS',	0	,'LNHARI',	0	),
('23/12/2017',	'13H00'	,'LNHDET',	0	,'LNHBOS',	0	),
('23/12/2017',	'13H00'	,'LNHWIN',	0	,'LNHNYI',	0	),
('23/12/2017',	'19H00'	,'LNHMON',	0	,'LNHEDM',	0	),
('23/12/2017',	'19H00'	,'LNHMIN',	0	,'LNHTBL',	0	),
('23/12/2017',	'19H00'	,'LNHOTT',	0	,'LNHFLO',	0	),
('23/12/2017',	'19H00'	,'LNHCHI',	0	,'LNHNJD',	0	),
('23/12/2017',	'19H00'	,'LNHTOR',	0	,'LNHNYR',	0	),
('23/12/2017',	'19H00'	,'LNHANA',	0	,'LNHPIT',	0	),
('23/12/2017',	'19H00'	,'LNHBUF',	0	,'LNHCAR',	0	),
('23/12/2017',	'19H00'	,'LNHPHI',	0	,'LNHCOB',	0	),
('23/12/2017',	'20H00'	,'LNHWAS',	0	,'LNHLVK',	0	),
('23/12/2017',	'20H00'	,'LNHCOA',	0	,'LNHARI',	0	),
('23/12/2017',	'20H00'	,'LNHNAS',	0	,'LNHDAL',	0	),
('23/12/2017',	'22H00'	,'LNHSTL',	0	,'LNHVAN',	0	),
('23/12/2017',	'22H00'	,'LNHLAK',	0	,'LNHSJS',	0	),
('27/12/2017',	'19H00'	,'LNHOTT',	0	,'LNHBOS',	0	),
('27/12/2017',	'19H00'	,'LNHDET',	0	,'LNHNJD',	0	),
('27/12/2017',	'19H00'	,'LNHBUF',	0	,'LNHNYI',	0	),
('27/12/2017',	'19H00'	,'LNHWAS',	0	,'LNHNYR',	0	),
('27/12/2017',	'19H00'	,'LNHCOB',	0	,'LNHPIT',	0	),
('27/12/2017',	'19H00'	,'LNHMON',	0	,'LNHCAR',	0	),
('27/12/2017',	'20H00'	,'LNHNAS',	0	,'LNHSTL',	0	),
('27/12/2017',	'20H00'	,'LNHDAL',	0	,'LNHMIN',	0	),
('27/12/2017',	'20H00'	,'LNHEDM',	0	,'LNHWIN',	0	),
('27/12/2017',	'21H00'	,'LNHARI',	0	,'LNHCOA',	0	),
('27/12/2017',	'22H00'	,'LNHLVK',	0	,'LNHANA',	0	),
('28/12/2017',	'19H00'	,'LNHBOS',	0	,'LNHWAS',	0	),
('28/12/2017',	'19H30'	,'LNHMON',	0	,'LNHTBL',	0	),
('28/12/2017',	'19H30'	,'LNHPHI',	0	,'LNHFLO',	0	),
('28/12/2017',	'21H00'	,'LNHTOR',	0	,'LNHARI',	0	),
('28/12/2017',	'22H00'	,'LNHCHI',	0	,'LNHVAN',	0	),
('28/12/2017',	'22H30'	,'LNHLVK',	0	,'LNHLAK',	0	),
('28/12/2017',	'22H30'	,'LNHCAL',	0	,'LNHSJS',	0	),
('29/12/2017',	'19H00'	,'LNHBUF',	0	,'LNHNJD',	0	),
('29/12/2017',	'19H30'	,'LNHCOB',	0	,'LNHOTT',	0	),
('29/12/2017',	'19H30'	,'LNHNYR',	0	,'LNHDET',	0	),
('29/12/2017',	'19H30'	,'LNHPHI',	0	,'LNHTBL',	0	),
('29/12/2017',	'19H30'	,'LNHPIT',	0	,'LNHCAR',	0	),
('29/12/2017',	'20H00'	,'LNHNAS',	0	,'LNHMIN',	0	),
('29/12/2017',	'20H00'	,'LNHNYI',	0	,'LNHWIN',	0	),
('29/12/2017',	'20H30'	,'LNHSTL',	0	,'LNHDAL',	0	),
('29/12/2017',	'21H00'	,'LNHTOR',	0	,'LNHCOA',	0	),
('29/12/2017',	'21H00'	,'LNHCHI',	0	,'LNHEDM',	0	),
('29/12/2017',	'22H00'	,'LNHCAL',	0	,'LNHANA',	0	),
('30/12/2017',	'19H00'	,'LNHBOS',	0	,'LNHOTT',	0	),
('30/12/2017',	'19H00'	,'LNHMON',	0	,'LNHFLO',	0	),
('30/12/2017',	'19H00'	,'LNHNJD',	0	,'LNHWAS',	0	),
('30/12/2017',	'20H00'	,'LNHCAR',	0	,'LNHSTL',	0	),
('30/12/2017',	'20H00'	,'LNHMIN',	0	,'LNHNAS',	0	),
('30/12/2017',	'22H00'	,'LNHLAK',	0	,'LNHVAN',	0	),
('31/12/2017',	'15H30'	,'LNHTOR',	0	,'LNHLVK',	0	),
('31/12/2017',	'16H00'	,'LNHARI',	0	,'LNHANA',	0	),
('31/12/2017',	'18H00'	,'LNHTBL',	0	,'LNHCOB',	0	),
('31/12/2017',	'19H00'	,'LNHWIN',	0	,'LNHEDM',	0	),
('31/12/2017',	'19H00'	,'LNHPIT',	0	,'LNHDET',	0	),
('31/12/2017',	'20H00'	,'LNHNYI',	0	,'LNHCOA',	0	),
('31/12/2017',	'20H00'	,'LNHSJS',	0	,'LNHDAL',	0	),
('31/12/2017',	'21H00'	,'LNHCHI',	0	,'LNHCAL',	0	),
						
('1/1/2018',	'13H00'	,'LNHNYR',	0	,'LNHBUF',	0	),
('2/1/2018',	'19H00'	,'LNHPIT',	0	,'LNHPHI',	0	),
('2/1/2018',	'19H00'	,'LNHBOS',	0	,'LNHNYI',	0	),
('2/1/2018',	'19H00'	,'LNHTBL',	0	,'LNHTOR',	0	),
('2/1/2018',	'19H00'	,'LNHWAS',	0	,'LNHCAR',	0	),
('2/1/2018',	'19H30'	,'LNHSJS',	0	,'LNHMON',	0	),
('2/1/2018',	'20H00'	,'LNHNJD',	0	,'LNHSTL',	0	),
('2/1/2018',	'20H00'	,'LNHFLO',	0	,'LNHMIN',	0	),
('2/1/2018',	'20H30'	,'LNHCOB',	0	,'LNHDAL',	0	),
('2/1/2018',	'21H00'	,'LNHLAK',	0	,'LNHEDM',	0	),
('2/1/2018',	'21H00'	,'LNHWIN',	0	,'LNHCOA',	0	),
('2/1/2018',	'22H00'	,'LNHNAS',	0	,'LNHLVK',	0	),
('2/1/2018',	'22H00'	,'LNHANA',	0	,'LNHVAN',	0	),
('3/1/2018',	'19H30'	,'LNHOTT',	0	,'LNHDET',	0	),
('3/1/2018',	'20H00'	,'LNHCHI',	0	,'LNHNYR',	0	),
('4/1/2018',	'19H00'	,'LNHNYI',	0	,'LNHPHI',	0	),
('4/1/2018',	'19H00'	,'LNHCAR',	0	,'LNHPIT',	0	),
('4/1/2018',	'19H00'	,'LNHFLO',	0	,'LNHBOS',	0	),
('4/1/2018',	'19H00'	,'LNHSJS',	0	,'LNHTOR',	0	),
('4/1/2018',	'19H30'	,'LNHTBL',	0	,'LNHMON',	0	),
('4/1/2018',	'20H00'	,'LNHBUF',	0	,'LNHMIN',	0	),
('4/1/2018',	'20H00'	,'LNHLVK',	0	,'LNHSTL',	0	),
('4/1/2018',	'20H30'	,'LNHNJD',	0	,'LNHDAL',	0	),
('4/1/2018',	'21H00'	,'LNHNAS',	0	,'LNHARI',	0	),
('4/1/2018',	'21H00'	,'LNHANA',	0	,'LNHEDM',	0	),
('4/1/2018',	'21H00'	,'LNHLAK',	0	,'LNHCAL',	0	),
('4/1/2018',	'21H00'	,'LNHCOB',	0	,'LNHCOA',	0	),
('5/1/2018',	'19H00'	,'LNHPIT',	0	,'LNHNYI',	0	),
('5/1/2018',	'19H30'	,'LNHFLO',	0	,'LNHDET',	0	),
('5/1/2018',	'19H30'	,'LNHSJS',	0	,'LNHOTT',	0	),
('5/1/2018',	'20H00'	,'LNHBUF',	0	,'LNHWIN',	0	),
('5/1/2018',	'20H30'	,'LNHLVK',	0	,'LNHCHI',	0	),
('6/1/2018',	'13H00'	,'LNHSTL',	0	,'LNHPHI',	0	),
('6/1/2018',	'15H00'	,'LNHMIN',	0	,'LNHCOA',	0	),
('6/1/2018',	'15H00'	,'LNHEDM',	0	,'LNHDAL',	0	),
('6/1/2018',	'19H00'	,'LNHCAR',	0	,'LNHBOS',	0	),
('6/1/2018',	'19H00'	,'LNHTBL',	0	,'LNHOTT',	0	),
('6/1/2018',	'19H00'	,'LNHVAN',	0	,'LNHTOR',	0	),
('6/1/2018',	'20H00'	,'LNHNYR',	0	,'LNHARI',	0	),
('6/1/2018',	'22H00'	,'LNHANA',	0	,'LNHCAL',	0	),
('6/1/2018',	'22H30'	,'LNHNAS',	0	,'LNHLAK',	0	),
('7/1/2018',	'13H00'	,'LNHNJD',	0	,'LNHNYI',	0	),
('7/1/2018',	'13H00'	,'LNHBUF',	0	,'LNHPHI',	0	),
('7/1/2018',	'15H00'	,'LNHEDM',	0	,'LNHCHI',	0	),
('7/1/2018',	'15H00'	,'LNHSJS',	0	,'LNHWIN',	0	),
('7/1/2018',	'15H00'	,'LNHSTL',	0	,'LNHWAS',	0	),
('7/1/2018',	'17H00'	,'LNHFLO',	0	,'LNHCOB',	0	),
('7/1/2018',	'19H00'	,'LNHTBL',	0	,'LNHDET',	0	),
('7/1/2018',	'19H00'	,'LNHVAN',	0	,'LNHMON',	0	),
('7/1/2018',	'19H30'	,'LNHBOS',	0	,'LNHPIT',	0	),
('7/1/2018',	'21H30'	,'LNHNYR',	0	,'LNHLVK',	0	),
('8/1/2018',	'19H00'	,'LNHCOB',	0	,'LNHTOR',	0	),
('9/1/2018',	'19H00'	,'LNHVAN',	0	,'LNHWAS',	0	),
('9/1/2018',	'19H00'	,'LNHWIN',	0	,'LNHBUF',	0	),
('9/1/2018',	'19H30'	,'LNHCAR',	0	,'LNHTBL',	0	),
('9/1/2018',	'19H30'	,'LNHCHI',	0	,'LNHOTT',	0	),
('9/1/2018',	'20H00'	,'LNHFLO',	0	,'LNHSTL',	0	),
('9/1/2018',	'20H00'	,'LNHCAL',	0	,'LNHMIN',	0	),
('9/1/2018',	'20H00'	,'LNHEDM',	0	,'LNHNAS',	0	),
('10/1/2018',	'19H30'	,'LNHOTT',	0	,'LNHTOR',	0	),
('10/1/2018',	'20H00'	,'LNHMIN',	0	,'LNHCHI',	0	),
('11/1/2018',	'19H00'	,'LNHCAR',	0	,'LNHWAS',	0	),
('11/1/2018',	'19H00'	,'LNHCOB',	0	,'LNHBUF',	0	),
('11/1/2018',	'19H30'	,'LNHCAL',	0	,'LNHTBL',	0	),
('12/1/2018',	'19H00'	,'LNHVAN',	0	,'LNHCOB',	0	),
('12/1/2018',	'19H30'	,'LNHWAS',	0	,'LNHCAR',	0	),
('12/1/2018',	'19H30'	,'LNHCAL',	0	,'LNHFLO',	0	),
('12/1/2018',	'20H30'	,'LNHWIN',	0	,'LNHCHI',	0	),
('12/1/2018',	'21H00'	,'LNHEDM',	0	,'LNHARI',	0	),
('13/1/2018',	'13H00'	,'LNHNYI',	0	,'LNHNYR',	0	),
('13/1/2018',	'13H00'	,'LNHDET',	0	,'LNHPIT',	0	),
('13/1/2018',	'19H00'	,'LNHWIN',	0	,'LNHMIN',	0	),
('13/1/2018',	'19H00'	,'LNHPHI',	0	,'LNHNJD',	0	),
('13/1/2018',	'19H00'	,'LNHBOS',	0	,'LNHMON',	0	),
('13/1/2018',	'21H00'	,'LNHCOA',	0	,'LNHDAL',	0	),
('13/1/2018',	'22H00'	,'LNHEDM',	0	,'LNHLVK',	0	),
('13/1/2018',	'22H30'	,'LNHANA',	0	,'LNHLAK',	0	),
('13/1/2018',	'22H30'	,'LNHARI',	0	,'LNHSJS',	0	),
('14/1/2018',	'12H30'	,'LNHNYR',	0	,'LNHPIT',	0	),
('14/1/2018',	'15H00'	,'LNHCAL',	0	,'LNHCAR',	0	),
('14/1/2018',	'19H00'	,'LNHDET',	0	,'LNHCHI',	0	),
('14/1/2018',	'19H00'	,'LNHVAN',	0	,'LNHMIN',	0	),
('15/1/2018',	'13H00'	,'LNHDAL',	0	,'LNHBOS',	0	),
('15/1/2018',	'15H00'	,'LNHANA',	0	,'LNHCOA',	0	),
('15/1/2018',	'16H00'	,'LNHSJS',	0	,'LNHLAK',	0	),
('15/1/2018',	'19H30'	,'LNHNYI',	0	,'LNHMON',	0	),
('16/1/2018',	'19H00'	,'LNHNJD',	0	,'LNHNYI',	0	),
('16/1/2018',	'19H00'	,'LNHPHI',	0	,'LNHNYR',	0	),
('16/1/2018',	'19H00'	,'LNHSTL',	0	,'LNHTOR',	0	),
('16/1/2018',	'19H30'	,'LNHDAL',	0	,'LNHDET',	0	),
('16/1/2018',	'20H00'	,'LNHLVK',	0	,'LNHNAS',	0	),
('16/1/2018',	'21H00'	,'LNHSJS',	0	,'LNHARI',	0	),
('17/1/2018',	'19H30'	,'LNHMON',	0	,'LNHBOS',	0	),
('17/1/2018',	'22H00'	,'LNHPIT',	0	,'LNHANA',	0	),
('18/1/2018',	'19H00'	,'LNHBOS',	0	,'LNHNYI',	0	),
('18/1/2018',	'19H00'	,'LNHBUF',	0	,'LNHNYR',	0	),
('18/1/2018',	'19H00'	,'LNHTOR',	0	,'LNHPHI',	0	),
('18/1/2018',	'19H00'	,'LNHWAS',	0	,'LNHNJD',	0	),
('18/1/2018',	'19H00'	,'LNHDAL',	0	,'LNHCOB',	0	),
('18/1/2018',	'19H30'	,'LNHSTL',	0	,'LNHOTT',	0	),
('18/1/2018',	'19H30'	,'LNHLVK',	0	,'LNHTBL',	0	),
('18/1/2018',	'20H00'	,'LNHARI',	0	,'LNHNAS',	0	),
('18/1/2018',	'21H00'	,'LNHSJS',	0	,'LNHCOA',	0	),
('18/1/2018',	'22H30'	,'LNHPIT',	0	,'LNHLAK',	0	),
('19/1/2018',	'19H30'	,'LNHMON',	0	,'LNHWAS',	0	),
('19/1/2018',	'19H30'	,'LNHLVK',	0	,'LNHFLO',	0	),
('19/1/2018',	'22H00'	,'LNHLAK',	0	,'LNHANA',	0	),
('20/1/2018',	'13H00'	,'LNHNJD',	0	,'LNHPHI',	0	),
('20/1/2018',	'13H00'	,'LNHDAL',	0	,'LNHBUF',	0	),
('20/1/2018',	'15H00'	,'LNHNYR',	0	,'LNHCOA',	0	),
('20/1/2018',	'15H00'	,'LNHWIN',	0	,'LNHCAL',	0	),
('20/1/2018',	'19H00'	,'LNHBOS',	0	,'LNHMON',	0	),
('20/1/2018',	'19H00'	,'LNHTOR',	0	,'LNHOTT',	0	),
('20/1/2018',	'19H00'	,'LNHCAR',	0	,'LNHDET',	0	),
('20/1/2018',	'20H00'	,'LNHPIT',	0	,'LNHSJS',	0	),
('20/1/2018',	'20H00'	,'LNHFLO',	0	,'LNHNAS',	0	),
('20/1/2018',	'20H00'	,'LNHARI',	0	,'LNHSTL',	0	),
('20/1/2018',	'20H30'	,'LNHNYI',	0	,'LNHCHI',	0	),
('20/1/2018',	'21H00'	,'LNHTBL',	0	,'LNHMIN',	0	),
('20/1/2018',	'22H00'	,'LNHVAN',	0	,'LNHEDM',	0	),
('21/1/2018',	'12H30'	,'LNHPHI',	0	,'LNHWAS',	0	),
('21/1/2018',	'17H00'	,'LNHLVK',	0	,'LNHCAR',	0	),
('21/1/2018',	'20H00'	,'LNHVAN',	0	,'LNHWIN',	0	),
('21/1/2018',	'21H00'	,'LNHSJS',	0	,'LNHANA',	0	),
('21/1/2018',	'22H30'	,'LNHNYR',	0	,'LNHLAK',	0	),
('22/1/2018',	'19H00'	,'LNHDET',	0	,'LNHNJD',	0	),
('22/1/2018',	'19H00'	,'LNHCOA',	0	,'LNHTOR',	0	),
('22/1/2018',	'20H00'	,'LNHOTT',	0	,'LNHMIN',	0	),
('22/1/2018',	'20H30'	,'LNHTBL',	0	,'LNHCHI',	0	),
('22/1/2018',	'21H00'	,'LNHNYI',	0	,'LNHARI',	0	),
('22/1/2018',	'21H00'	,'LNHBUF',	0	,'LNHCAL',	0	),
('23/1/2018',	'19H00'	,'LNHNJD',	0	,'LNHBOS',	0	),
('23/1/2018',	'19H00'	,'LNHCAR',	0	,'LNHPIT',	0	),
('23/1/2018',	'19H30'	,'LNHPHI',	0	,'LNHDET',	0	),
('23/1/2018',	'19H30'	,'LNHCOA',	0	,'LNHMON',	0	),
('23/1/2018',	'20H00'	,'LNHOTT',	0	,'LNHSTL',	0	),
('23/1/2018',	'20H00'	,'LNHTBL',	0	,'LNHNAS',	0	),
('23/1/2018',	'20H30'	,'LNHFLO',	0	,'LNHDAL',	0	),
('23/1/2018',	'21H00'	,'LNHBUF',	0	,'LNHEDM',	0	),
('23/1/2018',	'22H00'	,'LNHNYR',	0	,'LNHANA',	0	),
('23/1/2018',	'22H00'	,'LNHLAK',	0	,'LNHVAN',	0	),
('23/1/2018',	'22H00'	,'LNHCOB',	0	,'LNHLVK',	0	),
('23/1/2018',	'22H30'	,'LNHWIN',	0	,'LNHSJS',	0	),
('24/1/2018',	'20H00'	,'LNHTOR',	0	,'LNHCHI',	0	),
('24/1/2018',	'22H00'	,'LNHLAK',	0	,'LNHCAL',	0	),
('25/1/2018',	'19H00'	,'LNHTBL',	0	,'LNHPHI',	0	),
('25/1/2018',	'19H00'	,'LNHNAS',	0	,'LNHNJD',	0	),
('25/1/2018',	'19H00'	,'LNHMIN',	0	,'LNHPIT',	0	),
('25/1/2018',	'19H30'	,'LNHBOS',	0	,'LNHOTT',	0	),
('25/1/2018',	'19H30'	,'LNHCAR',	0	,'LNHMON',	0	),
('25/1/2018',	'19H30'	,'LNHWAS',	0	,'LNHFLO',	0	),
('25/1/2018',	'19H30'	,'LNHCHI',	0	,'LNHDET',	0	),
('25/1/2018',	'20H00'	,'LNHCOA',	0	,'LNHSTL',	0	),
('25/1/2018',	'20H30'	,'LNHTOR',	0	,'LNHDAL',	0	),
('25/1/2018',	'21H00'	,'LNHCAL',	0	,'LNHEDM',	0	),
('25/1/2018',	'21H00'	,'LNHCOB',	0	,'LNHARI',	0	),
('25/1/2018',	'22H00'	,'LNHNYI',	0	,'LNHLVK',	0	),
('25/1/2018',	'22H00'	,'LNHBUF',	0	,'LNHVAN',	0	),
('25/1/2018',	'22H00'	,'LNHWIN',	0	,'LNHANA',	0	),
('25/1/2018',	'22H30'	,'LNHNYR',	0	,'LNHSJS',	0	),
('30/1/2018',	'19H00'	,'LNHNJD',	0	,'LNHBUF',	0	),
('30/1/2018',	'19H00'	,'LNHOTT',	0	,'LNHCAR',	0	),
('30/1/2018',	'19H00'	,'LNHFLO',	0	,'LNHNYI',	0	),
('30/1/2018',	'19H00'	,'LNHANA',	0	,'LNHBOS',	0	),
('30/1/2018',	'19H00'	,'LNHSJS',	0	,'LNHPIT',	0	),
('30/1/2018',	'19H00'	,'LNHMIN',	0	,'LNHCOB',	0	),
('30/1/2018',	'20H00'	,'LNHMON',	0	,'LNHSTL',	0	),
('30/1/2018',	'20H00'	,'LNHTBL',	0	,'LNHWIN',	0	),
('30/1/2018',	'20H00'	,'LNHCHI',	0	,'LNHNAS',	0	),
('30/1/2018',	'20H30'	,'LNHLAK',	0	,'LNHDAL',	0	),
('30/1/2018',	'21H00'	,'LNHLVK',	0	,'LNHCAL',	0	),
('30/1/2018',	'22H00'	,'LNHCOA',	0	,'LNHVAN',	0	),
('31/1/2018',	'19H30'	,'LNHNYI',	0	,'LNHTOR',	0	),
('31/1/2018',	'20H00'	,'LNHPHI',	0	,'LNHWAS',	0	),
('31/1/2018',	'20H00'	,'LNHSJS',	0	,'LNHDET',	0	),
						
('1/2/2018',	'19H00'	,'LNHSTL',	0	,'LNHBOS',	0	),
('1/2/2018',	'19H00'	,'LNHFLO',	0	,'LNHBUF',	0	),
('1/2/2018',	'19H00'	,'LNHPHI',	0	,'LNHNJD',	0	),
('1/2/2018',	'19H00'	,'LNHTOR',	0	,'LNHNYR',	0	),
('1/2/2018',	'19H00'	,'LNHMON',	0	,'LNHCAR',	0	),
('1/2/2018',	'19H30'	,'LNHANA',	0	,'LNHOTT',	0	),
('1/2/2018',	'20H00'	,'LNHLAK',	0	,'LNHNAS',	0	),
('1/2/2018',	'20H00'	,'LNHLVK',	0	,'LNHWIN',	0	),
('1/2/2018',	'21H00'	,'LNHTBL',	0	,'LNHCAL',	0	),
('1/2/2018',	'21H00'	,'LNHCOA',	0	,'LNHEDM',	0	),
('1/2/2018',	'21H00'	,'LNHDAL',	0	,'LNHARI',	0	),
('1/2/2018',	'22H00'	,'LNHCHI',	0	,'LNHVAN',	0	),
('2/2/2018',	'19H00'	,'LNHWAS',	0	,'LNHPIT',	0	),
('2/2/2018',	'19H00'	,'LNHDET',	0	,'LNHCAR',	0	),
('2/2/2018',	'19H00'	,'LNHSJS',	0	,'LNHCOB',	0	),
('2/2/2018',	'20H00'	,'LNHLVK',	0	,'LNHMIN',	0	),
('3/2/2018',	'13H00'	,'LNHANA',	0	,'LNHMON',	0	),
('3/2/2018',	'13H00'	,'LNHOTT',	0	,'LNHPHI',	0	),
('3/2/2018',	'19H00'	,'LNHCOA',	0	,'LNHWIN',	0	),
('3/2/2018',	'19H00'	,'LNHTOR',	0	,'LNHBOS',	0	),
('3/2/2018',	'19H00'	,'LNHSTL',	0	,'LNHBUF',	0	),
('3/2/2018',	'19H00'	,'LNHDET',	0	,'LNHFLO',	0	),
('3/2/2018',	'19H00'	,'LNHPIT',	0	,'LNHNJD',	0	),
('3/2/2018',	'19H00'	,'LNHCOB',	0	,'LNHNYI',	0	),
('3/2/2018',	'20H00'	,'LNHNYR',	0	,'LNHNAS',	0	),
('3/2/2018',	'20H00'	,'LNHMIN',	0	,'LNHDAL',	0	),
('3/2/2018',	'22H00'	,'LNHTBL',	0	,'LNHVAN',	0	),
('3/2/2018',	'22H00'	,'LNHCHI',	0	,'LNHCAL',	0	),
('3/2/2018',	'22H30'	,'LNHARI',	0	,'LNHLAK',	0	),
('4/2/2018',	'12H30'	,'LNHLVK',	0	,'LNHWAS',	0	),
('4/2/2018',	'13H00'	,'LNHOTT',	0	,'LNHMON',	0	),
('4/2/2018',	'13H00'	,'LNHSJS',	0	,'LNHCAR',	0	),
('5/2/2018',	'19H00'	,'LNHANA',	0	,'LNHTOR',	0	),
('5/2/2018',	'19H00'	,'LNHNAS',	0	,'LNHNYI',	0	),
('5/2/2018',	'20H30'	,'LNHNYR',	0	,'LNHDAL',	0	),
('5/2/2018',	'21H00'	,'LNHTBL',	0	,'LNHEDM',	0	),
('6/2/2018',	'19H00'	,'LNHANA',	0	,'LNHBUF',	0	),
('6/2/2018',	'19H00'	,'LNHLVK',	0	,'LNHPIT',	0	),
('6/2/2018',	'19H00'	,'LNHPHI',	0	,'LNHCAR',	0	),
('6/2/2018',	'19H00'	,'LNHWAS',	0	,'LNHCOB',	0	),
('6/2/2018',	'19H30'	,'LNHNJD',	0	,'LNHOTT',	0	),
('6/2/2018',	'19H30'	,'LNHBOS',	0	,'LNHDET',	0	),
('6/2/2018',	'19H30'	,'LNHVAN',	0	,'LNHFLO',	0	),
('6/2/2018',	'20H00'	,'LNHMIN',	0	,'LNHSTL',	0	),
('6/2/2018',	'20H00'	,'LNHARI',	0	,'LNHWIN',	0	),
('6/2/2018',	'20H30'	,'LNHCAL',	0	,'LNHCHI',	0	),
('6/2/2018',	'21H00'	,'LNHSJS',	0	,'LNHCOA',	0	),
('7/2/2018',	'19H30'	,'LNHNAS',	0	,'LNHTOR',	0	),
('7/2/2018',	'20H00'	,'LNHBOS',	0	,'LNHNYR',	0	),
('7/2/2018',	'22H30'	,'LNHEDM',	0	,'LNHLAK',	0	),
('8/2/2018',	'19H00'	,'LNHNYI',	0	,'LNHBUF',	0	),
('8/2/2018',	'19H00'	,'LNHCAL',	0	,'LNHNJD',	0	),
('8/2/2018',	'19H00'	,'LNHMON',	0	,'LNHPHI',	0	),
('8/2/2018',	'19H30'	,'LNHNAS',	0	,'LNHOTT',	0	),
('8/2/2018',	'19H30'	,'LNHVAN',	0	,'LNHTBL',	0	),
('8/2/2018',	'20H00'	,'LNHCOA',	0	,'LNHSTL',	0	),
('8/2/2018',	'20H00'	,'LNHARI',	0	,'LNHMIN',	0	),
('8/2/2018',	'20H30'	,'LNHDAL',	0	,'LNHCHI',	0	),
('8/2/2018',	'22H30'	,'LNHLVK',	0	,'LNHSJS',	0	),
('9/2/2018',	'19H00'	,'LNHDET',	0	,'LNHNYI',	0	),
('9/2/2018',	'19H00'	,'LNHCAL',	0	,'LNHNYR',	0	),
('9/2/2018',	'19H00'	,'LNHCOB',	0	,'LNHWAS',	0	),
('9/2/2018',	'19H30'	,'LNHLAK',	0	,'LNHFLO',	0	),
('9/2/2018',	'19H30'	,'LNHVAN',	0	,'LNHCAR',	0	),
('9/2/2018',	'20H00'	,'LNHSTL',	0	,'LNHWIN',	0	),
('9/2/2018',	'20H30'	,'LNHPIT',	0	,'LNHDAL',	0	),
('9/2/2018',	'22H00'	,'LNHEDM',	0	,'LNHANA',	0	),
('10/2/2018',	'19H00'	,'LNHBUF',	0	,'LNHBOS',	0	),
('10/2/2018',	'19H00'	,'LNHOTT',	0	,'LNHTOR',	0	),
('10/2/2018',	'19H00'	,'LNHNAS',	0	,'LNHMON',	0	),
('10/2/2018',	'19H00'	,'LNHLAK',	0	,'LNHTBL',	0	),
('10/2/2018',	'19H00'	,'LNHCOA',	0	,'LNHCAR',	0	),
('10/2/2018',	'19H00'	,'LNHNJD',	0	,'LNHCOB',	0	),
('10/2/2018',	'20H00'	,'LNHPHI',	0	,'LNHARI',	0	),
('10/2/2018',	'20H00'	,'LNHCHI',	0	,'LNHMIN',	0	),
('10/2/2018',	'22H00'	,'LNHEDM',	0	,'LNHSJS',	0	),
('11/2/2018',	'15H00'	,'LNHPIT',	0	,'LNHSTL',	0	),
('11/2/2018',	'15H00'	,'LNHNYR',	0	,'LNHWIN',	0	),
('11/2/2018',	'15H00'	,'LNHDET',	0	,'LNHWAS',	0	),
('11/2/2018',	'16H00'	,'LNHVAN',	0	,'LNHDAL',	0	),
('11/2/2018',	'19H00'	,'LNHCOA',	0	,'LNHBUF',	0	),
('11/2/2018',	'19H00'	,'LNHBOS',	0	,'LNHNJD',	0	),
('11/2/2018',	'19H00'	,'LNHCAL',	0	,'LNHNYI',	0	),
('11/2/2018',	'20H00'	,'LNHPHI',	0	,'LNHLVK',	0	),
('11/2/2018',	'20H00'	,'LNHSJS',	0	,'LNHANA',	0	),
('12/2/2018',	'19H00'	,'LNHTBL',	0	,'LNHTOR',	0	),
('12/2/2018',	'21H00'	,'LNHFLO',	0	,'LNHEDM',	0	),
('12/2/2018',	'21H00'	,'LNHCHI',	0	,'LNHARI',	0	),
('13/2/2018',	'19H00'	,'LNHCAL',	0	,'LNHBOS',	0	),
('13/2/2018',	'19H00'	,'LNHTBL',	0	,'LNHBUF',	0	),
('13/2/2018',	'19H00'	,'LNHCOB',	0	,'LNHNYI',	0	),
('13/2/2018',	'19H00'	,'LNHNJD',	0	,'LNHPHI',	0	),
('13/2/2018',	'19H00'	,'LNHOTT',	0	,'LNHPIT',	0	),
('13/2/2018',	'19H00'	,'LNHLAK',	0	,'LNHCAR',	0	),
('13/2/2018',	'19H30'	,'LNHANA',	0	,'LNHDET',	0	),
('13/2/2018',	'20H00'	,'LNHSTL',	0	,'LNHNAS',	0	),
('13/2/2018',	'20H00'	,'LNHNYR',	0	,'LNHMIN',	0	),
('13/2/2018',	'20H00'	,'LNHWAS',	0	,'LNHWIN',	0	),
('13/2/2018',	'22H00'	,'LNHCHI',	0	,'LNHLVK',	0	),
('13/2/2018',	'22H30'	,'LNHARI',	0	,'LNHSJS',	0	),
('14/2/2018',	'19H00'	,'LNHCOB',	0	,'LNHTOR',	0	),
('14/2/2018',	'21H30'	,'LNHMON',	0	,'LNHCOA',	0	),
('14/2/2018',	'22H00'	,'LNHFLO',	0	,'LNHVAN',	0	),
('15/2/2018',	'19H00'	,'LNHCAR',	0	,'LNHNJD',	0	),
('15/2/2018',	'19H00'	,'LNHNYR',	0	,'LNHNYI',	0	),
('15/2/2018',	'19H00'	,'LNHLAK',	0	,'LNHPIT',	0	),
('15/2/2018',	'19H30'	,'LNHBUF',	0	,'LNHOTT',	0	),
('15/2/2018',	'19H30'	,'LNHDET',	0	,'LNHTBL',	0	),
('15/2/2018',	'20H00'	,'LNHCAL',	0	,'LNHNAS',	0	),
('15/2/2018',	'20H00'	,'LNHWAS',	0	,'LNHMIN',	0	),
('15/2/2018',	'20H30'	,'LNHANA',	0	,'LNHCHI',	0	),
('15/2/2018',	'21H00'	,'LNHMON',	0	,'LNHARI',	0	),
('15/2/2018',	'22H00'	,'LNHEDM',	0	,'LNHLVK',	0	),
('15/2/2018',	'22H30'	,'LNHVAN',	0	,'LNHSJS',	0	),
('16/2/2018',	'19H00'	,'LNHPHI',	0	,'LNHCOB',	0	),
('16/2/2018',	'19H30'	,'LNHNYI',	0	,'LNHCAR',	0	),
('16/2/2018',	'20H00'	,'LNHCOA',	0	,'LNHWIN',	0	),
('16/2/2018',	'20H30'	,'LNHSTL',	0	,'LNHDAL',	0	),
('17/2/2018',	'13H00'	,'LNHLAK',	0	,'LNHBUF',	0	),
('17/2/2018',	'14H00'	,'LNHANA',	0	,'LNHMIN',	0	),
('17/2/2018',	'14H00'	,'LNHNYR',	0	,'LNHOTT',	0	),
('17/2/2018',	'16H00'	,'LNHEDM',	0	,'LNHARI',	0	),
('17/2/2018',	'19H00'	,'LNHMON',	0	,'LNHLVK',	0	),
('17/2/2018',	'19H00'	,'LNHNJD',	0	,'LNHTBL',	0	),
('17/2/2018',	'19H00'	,'LNHTOR',	0	,'LNHPIT',	0	),
('17/2/2018',	'20H00'	,'LNHDET',	0	,'LNHNAS',	0	),
('17/2/2018',	'20H30'	,'LNHWAS',	0	,'LNHCHI',	0	),
('17/2/2018',	'22H00'	,'LNHBOS',	0	,'LNHVAN',	0	),
('17/2/2018',	'22H00'	,'LNHFLO',	0	,'LNHCAL',	0	),
('18/2/2018',	'13H00'	,'LNHPHI',	0	,'LNHNYR',	0	),
('18/2/2018',	'15H00'	,'LNHEDM',	0	,'LNHCOA',	0	),
('18/2/2018',	'17H00'	,'LNHNJD',	0	,'LNHCAR',	0	),
('18/2/2018',	'18H00'	,'LNHPIT',	0	,'LNHCOB',	0	),
('18/2/2018',	'19H00'	,'LNHTOR',	0	,'LNHDET',	0	),
('18/2/2018',	'20H00'	,'LNHDAL',	0	,'LNHSJS',	0	),
('18/2/2018',	'20H00'	,'LNHFLO',	0	,'LNHWIN',	0	),
('19/2/2018',	'13H00'	,'LNHMIN',	0	,'LNHNYI',	0	),
('19/2/2018',	'15H00'	,'LNHWAS',	0	,'LNHBUF',	0	),
('19/2/2018',	'16H00'	,'LNHBOS',	0	,'LNHCAL',	0	),
('19/2/2018',	'20H00'	,'LNHOTT',	0	,'LNHNAS',	0	),
('19/2/2018',	'20H30'	,'LNHLAK',	0	,'LNHCHI',	0	),
('19/2/2018',	'22H00'	,'LNHANA',	0	,'LNHLVK',	0	),
('20/2/2018',	'19H00'	,'LNHFLO',	0	,'LNHTOR',	0	),
('20/2/2018',	'19H00'	,'LNHCOB',	0	,'LNHNJD',	0	),
('20/2/2018',	'19H00'	,'LNHMON',	0	,'LNHPHI',	0	),
('20/2/2018',	'19H00'	,'LNHTBL',	0	,'LNHWAS',	0	),
('20/2/2018',	'19H30'	,'LNHNAS',	0	,'LNHDET',	0	),
('20/2/2018',	'20H00'	,'LNHSJS',	0	,'LNHSTL',	0	),
('20/2/2018',	'20H00'	,'LNHLAK',	0	,'LNHWIN',	0	),
('20/2/2018',	'21H00'	,'LNHBOS',	0	,'LNHEDM',	0	),
('20/2/2018',	'22H00'	,'LNHCOA',	0	,'LNHVAN',	0	),
('21/2/2018',	'20H00'	,'LNHOTT',	0	,'LNHCHI',	0	),
('21/2/2018',	'22H00'	,'LNHDAL',	0	,'LNHANA',	0	),
('21/2/2018',	'22H30'	,'LNHCAL',	0	,'LNHLVK',	0	),
('22/2/2018',	'19H00'	,'LNHNYI',	0	,'LNHTOR',	0	),
('22/2/2018',	'19H00'	,'LNHMIN',	0	,'LNHNJD',	0	),
('22/2/2018',	'19H00'	,'LNHCOB',	0	,'LNHPHI',	0	),
('22/2/2018',	'19H30'	,'LNHNYR',	0	,'LNHMON',	0	),
('22/2/2018',	'19H30'	,'LNHTBL',	0	,'LNHOTT',	0	),
('22/2/2018',	'19H30'	,'LNHBUF',	0	,'LNHDET',	0	),
('22/2/2018',	'19H30'	,'LNHWAS',	0	,'LNHFLO',	0	),
('22/2/2018',	'20H00'	,'LNHSJS',	0	,'LNHNAS',	0	),
('22/2/2018',	'21H00'	,'LNHCOA',	0	,'LNHEDM',	0	),
('22/2/2018',	'21H00'	,'LNHCAL',	0	,'LNHARI',	0	),
('22/2/2018',	'22H30'	,'LNHDAL',	0	,'LNHLAK',	0	),
('23/2/2018',	'19H00'	,'LNHMIN',	0	,'LNHNYR',	0	),
('23/2/2018',	'19H30'	,'LNHPIT',	0	,'LNHCAR',	0	),
('23/2/2018',	'20H00'	,'LNHWIN',	0	,'LNHSTL',	0	),
('23/2/2018',	'20H30'	,'LNHSJS',	0	,'LNHCHI',	0	),
('23/2/2018',	'22H30'	,'LNHVAN',	0	,'LNHLVK',	0	),
('24/2/2018',	'14H00'	,'LNHPHI',	0	,'LNHOTT',	0	),
('24/2/2018',	'16H00'	,'LNHCOA',	0	,'LNHCAL',	0	),
('24/2/2018',	'19H00'	,'LNHWIN',	0	,'LNHDAL',	0	),
('24/2/2018',	'19H00'	,'LNHBOS',	0	,'LNHTOR',	0	),
('24/2/2018',	'19H00'	,'LNHTBL',	0	,'LNHMON',	0	),
('24/2/2018',	'19H00'	,'LNHCAR',	0	,'LNHDET',	0	),
('24/2/2018',	'19H00'	,'LNHPIT',	0	,'LNHFLO',	0	),
('24/2/2018',	'19H00'	,'LNHNYI',	0	,'LNHNJD',	0	),
('24/2/2018',	'19H00'	,'LNHBUF',	0	,'LNHWAS',	0	),
('24/2/2018',	'19H00'	,'LNHCHI',	0	,'LNHCOB',	0	),
('24/2/2018',	'20H00'	,'LNHANA',	0	,'LNHARI',	0	),
('24/2/2018',	'22H00'	,'LNHEDM',	0	,'LNHLAK',	0	),
('25/2/2018',	'17H00'	,'LNHBOS',	0	,'LNHBUF',	0	),
('25/2/2018',	'18H00'	,'LNHSTL',	0	,'LNHNAS',	0	),
('25/2/2018',	'19H00'	,'LNHDET',	0	,'LNHNYR',	0	),
('25/2/2018',	'20H00'	,'LNHEDM',	0	,'LNHANA',	0	),
('25/2/2018',	'20H00'	,'LNHSJS',	0	,'LNHMIN',	0	),
('25/2/2018',	'21H30'	,'LNHVAN',	0	,'LNHARI',	0	),
('26/2/2018',	'19H00'	,'LNHWAS',	0	,'LNHCOB',	0	),
('26/2/2018',	'19H30'	,'LNHPHI',	0	,'LNHMON',	0	),
('26/2/2018',	'19H30'	,'LNHTOR',	0	,'LNHTBL',	0	),
('26/2/2018',	'21H00'	,'LNHVAN',	0	,'LNHCOA',	0	),
('26/2/2018',	'22H30'	,'LNHLVK',	0	,'LNHLAK',	0	),
('27/2/2018',	'19H00'	,'LNHCAR',	0	,'LNHBOS',	0	),
('27/2/2018',	'19H00'	,'LNHNJD',	0	,'LNHPIT',	0	),
('27/2/2018',	'19H00'	,'LNHOTT',	0	,'LNHWAS',	0	),
('27/2/2018',	'19H30'	,'LNHTOR',	0	,'LNHFLO',	0	),
('27/2/2018',	'20H00'	,'LNHSTL',	0	,'LNHMIN',	0	),
('27/2/2018',	'20H00'	,'LNHNAS',	0	,'LNHWIN',	0	),
('27/2/2018',	'20H30'	,'LNHCAL',	0	,'LNHDAL',	0	),
('27/2/2018',	'22H00'	,'LNHLAK',	0	,'LNHLVK',	0	),
('27/2/2018',	'22H30'	,'LNHEDM',	0	,'LNHSJS',	0	),
('28/2/2018',	'19H00'	,'LNHNYI',	0	,'LNHMON',	0	),
('28/2/2018',	'19H00'	,'LNHBUF',	0	,'LNHTBL',	0	),
('28/2/2018',	'20H00'	,'LNHDET',	0	,'LNHSTL',	0	),
('28/2/2018',	'21H30'	,'LNHCAL',	0	,'LNHCOA',	0	),
('28/2/2018',	'22H00'	,'LNHNYR',	0	,'LNHVAN',	0	),
						
('1/3/2018',	'19H00'	,'LNHPIT',	0	,'LNHBOS',	0	),
('1/3/2018',	'19H00'	,'LNHCAR',	0	,'LNHPHI',	0	),
('1/3/2018',	'19H30'	,'LNHNJD',	0	,'LNHFLO',	0	),
('1/3/2018',	'20H30'	,'LNHTBL',	0	,'LNHDAL',	0	),
('1/3/2018',	'21H00'	,'LNHNAS',	0	,'LNHEDM',	0	),
('1/3/2018',	'21H00'	,'LNHMIN',	0	,'LNHARI',	0	),
('1/3/2018',	'22H30'	,'LNHCOB',	0	,'LNHLAK',	0	),
('1/3/2018',	'22H30'	,'LNHCHI',	0	,'LNHSJS',	0	),
('2/3/2018',	'19H00'	,'LNHMON',	0	,'LNHNYI',	0	),
('2/3/2018',	'19H30'	,'LNHBUF',	0	,'LNHFLO',	0	),
('2/3/2018',	'19H30'	,'LNHNJD',	0	,'LNHCAR',	0	),
('2/3/2018',	'20H00'	,'LNHDET',	0	,'LNHWIN',	0	),
('2/3/2018',	'21H00'	,'LNHMIN',	0	,'LNHCOA',	0	),
('2/3/2018',	'21H00'	,'LNHNYR',	0	,'LNHCAL',	0	),
('2/3/2018',	'22H00'	,'LNHNAS',	0	,'LNHVAN',	0	)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES
('2/3/2018',	'22H00'	,'LNHOTT',	0	,'LNHLVK',	0	),
('2/3/2018',	'22H00'	,'LNHCOB',	0	,'LNHANA',	0	),
('3/3/2018',	'13H00'	,'LNHPHI',	0	,'LNHTBL',	0	),
('3/3/2018',	'14H00'	,'LNHSTL',	0	,'LNHDAL',	0	),
('3/3/2018',	'16H00'	,'LNHCHI',	0	,'LNHLAK',	0	),
('3/3/2018',	'17H00'	,'LNHMON',	0	,'LNHBOS',	0	),
('3/3/2018',	'17H00'	,'LNHNYI',	0	,'LNHPIT',	0	),
('3/3/2018',	'20H00'	,'LNHOTT',	0	,'LNHARI',	0	),
('3/3/2018',	'20H00'	,'LNHTOR',	0	,'LNHWAS',	0	),
('3/3/2018',	'22H30'	,'LNHNYR',	0	,'LNHEDM',	0	),
('4/3/2018',	'15H00'	,'LNHNAS',	0	,'LNHCOA',	0	),
('4/3/2018',	'15H00'	,'LNHPHI',	0	,'LNHFLO',	0	),
('4/3/2018',	'16H00'	,'LNHCHI',	0	,'LNHANA',	0	),
('4/3/2018',	'17H00'	,'LNHLVK',	0	,'LNHNJD',	0	),
('4/3/2018',	'19H00'	,'LNHWIN',	0	,'LNHCAR',	0	),
('4/3/2018',	'19H30'	,'LNHDET',	0	,'LNHMIN',	0	),
('4/3/2018',	'21H00'	,'LNHCOB',	0	,'LNHSJS',	0	),
('5/3/2018',	'19H00'	,'LNHTOR',	0	,'LNHBUF',	0	),
('5/3/2018',	'19H00'	,'LNHCAL',	0	,'LNHPIT',	0	),
('5/3/2018',	'20H30'	,'LNHOTT',	0	,'LNHDAL',	0	),
('5/3/2018',	'21H00'	,'LNHARI',	0	,'LNHEDM',	0	),
('5/3/2018',	'22H00'	,'LNHNYI',	0	,'LNHVAN',	0	),
('6/3/2018',	'19H00'	,'LNHDET',	0	,'LNHBOS',	0	),
('6/3/2018',	'19H00'	,'LNHMON',	0	,'LNHNJD',	0	),
('6/3/2018',	'19H00'	,'LNHWIN',	0	,'LNHNYR',	0	),
('6/3/2018',	'19H00'	,'LNHLVK',	0	,'LNHCOB',	0	),
('6/3/2018',	'19H30'	,'LNHFLO',	0	,'LNHTBL',	0	),
('6/3/2018',	'20H00'	,'LNHDAL',	0	,'LNHNAS',	0	),
('6/3/2018',	'20H00'	,'LNHCAR',	0	,'LNHMIN',	0	),
('6/3/2018',	'20H30'	,'LNHCOA',	0	,'LNHCHI',	0	),
('6/3/2018',	'22H00'	,'LNHWAS',	0	,'LNHANA',	0	),
('7/3/2018',	'19H30'	,'LNHCAL',	0	,'LNHBUF',	0	),
('7/3/2018',	'20H00'	,'LNHPIT',	0	,'LNHPHI',	0	),
('7/3/2018',	'22H00'	,'LNHARI',	0	,'LNHVAN',	0	),
('8/3/2018',	'19H00'	,'LNHPHI',	0	,'LNHBOS',	0	),
('8/3/2018',	'19H00'	,'LNHWIN',	0	,'LNHNJD',	0	),
('8/3/2018',	'19H00'	,'LNHCOA',	0	,'LNHCOB',	0	),
('8/3/2018',	'19H30'	,'LNHBUF',	0	,'LNHOTT',	0	),
('8/3/2018',	'19H30'	,'LNHLVK',	0	,'LNHDET',	0	),
('8/3/2018',	'19H30'	,'LNHNYR',	0	,'LNHTBL',	0	),
('8/3/2018',	'19H30'	,'LNHMON',	0	,'LNHFLO',	0	),
('8/3/2018',	'20H00'	,'LNHANA',	0	,'LNHNAS',	0	),
('8/3/2018',	'20H30'	,'LNHCAR',	0	,'LNHCHI',	0	),
('8/3/2018',	'21H00'	,'LNHNYI',	0	,'LNHEDM',	0	),
('8/3/2018',	'22H30'	,'LNHWAS',	0	,'LNHLAK',	0	),
('8/3/2018',	'22H30'	,'LNHSTL',	0	,'LNHSJS',	0	),
('9/3/2018',	'19H00'	,'LNHDET',	0	,'LNHCOB',	0	),
('9/3/2018',	'19H30'	,'LNHCAL',	0	,'LNHOTT',	0	),
('9/3/2018',	'20H30'	,'LNHANA',	0	,'LNHDAL',	0	),
('9/3/2018',	'22H00'	,'LNHMIN',	0	,'LNHVAN',	0	),
('10/3/2018',	'13H00'	,'LNHCHI',	0	,'LNHBOS',	0	),
('10/3/2018',	'13H00'	,'LNHLVK',	0	,'LNHBUF',	0	),
('10/3/2018',	'13H00'	,'LNHMON',	0	,'LNHTBL',	0	),
('10/3/2018',	'13H00'	,'LNHWIN',	0	,'LNHPHI',	0	),
('10/3/2018',	'15H00'	,'LNHARI',	0	,'LNHCOA',	0	),
('10/3/2018',	'16H00'	,'LNHSTL',	0	,'LNHLAK',	0	),
('10/3/2018',	'16H00'	,'LNHWAS',	0	,'LNHSJS',	0	),
('10/3/2018',	'19H00'	,'LNHPIT',	0	,'LNHTOR',	0	),
('10/3/2018',	'19H00'	,'LNHNYR',	0	,'LNHFLO',	0	),
('10/3/2018',	'20H00'	,'LNHNJD',	0	,'LNHNAS',	0	),
('10/3/2018',	'22H00'	,'LNHMIN',	0	,'LNHEDM',	0	),
('11/3/2018',	'12H30'	,'LNHBOS',	0	,'LNHCHI',	0	),
('11/3/2018',	'19H00'	,'LNHNYI',	0	,'LNHCAL',	0	),
('11/3/2018',	'19H30'	,'LNHDAL',	0	,'LNHPIT',	0	),
('11/3/2018',	'21H00'	,'LNHVAN',	0	,'LNHARI',	0	),
('12/3/2018',	'19H00'	,'LNHCAR',	0	,'LNHNYR',	0	),
('12/3/2018',	'19H00'	,'LNHLVK',	0	,'LNHPHI',	0	),
('12/3/2018',	'19H00'	,'LNHWIN',	0	,'LNHWAS',	0	),
('12/3/2018',	'19H00'	,'LNHMON',	0	,'LNHCOB',	0	),
('12/3/2018',	'19H30'	,'LNHOTT',	0	,'LNHFLO',	0	),
('12/3/2018',	'22H00'	,'LNHSTL',	0	,'LNHANA',	0	),
('12/3/2018',	'22H30'	,'LNHVAN',	0	,'LNHLAK',	0	),
('12/3/2018',	'22H30'	,'LNHDET',	0	,'LNHSJS',	0	),
('13/3/2018',	'19H00'	,'LNHBOS',	0	,'LNHCAR',	0	),
('13/3/2018',	'19H30'	,'LNHDAL',	0	,'LNHMON',	0	),
('13/3/2018',	'19H30'	,'LNHOTT',	0	,'LNHTBL',	0	),
('13/3/2018',	'20H00'	,'LNHWIN',	0	,'LNHNAS',	0	),
('13/3/2018',	'20H00'	,'LNHCOA',	0	,'LNHMIN',	0	),
('13/3/2018',	'21H00'	,'LNHEDM',	0	,'LNHCAL',	0	),
('13/3/2018',	'22H00'	,'LNHLAK',	0	,'LNHARI',	0	),
('14/3/2018',	'19H00'	,'LNHDAL',	0	,'LNHTOR',	0	),
('14/3/2018',	'20H00'	,'LNHPIT',	0	,'LNHNYR',	0	),
('14/3/2018',	'21H30'	,'LNHSJS',	0	,'LNHEDM',	0	),
('14/3/2018',	'22H00'	,'LNHNJD',	0	,'LNHLVK',	0	),
('14/3/2018',	'22H00'	,'LNHVAN',	0	,'LNHANA',	0	),
('15/3/2018',	'19H00'	,'LNHTOR',	0	,'LNHBUF',	0	),
('15/3/2018',	'19H00'	,'LNHWAS',	0	,'LNHNYI',	0	),
('15/3/2018',	'19H00'	,'LNHCOB',	0	,'LNHPHI',	0	),
('15/3/2018',	'19H30'	,'LNHPIT',	0	,'LNHMON',	0	),
('15/3/2018',	'19H30'	,'LNHBOS',	0	,'LNHFLO',	0	),
('15/3/2018',	'20H00'	,'LNHCOA',	0	,'LNHSTL',	0	),
('15/3/2018',	'20H00'	,'LNHCHI',	0	,'LNHWIN',	0	),
('15/3/2018',	'22H00'	,'LNHNAS',	0	,'LNHARI',	0	),
('15/3/2018',	'22H30'	,'LNHDET',	0	,'LNHLAK',	0	),
('16/3/2018',	'19H00'	,'LNHNYI',	0	,'LNHWAS',	0	),
('16/3/2018',	'19H30'	,'LNHDAL',	0	,'LNHOTT',	0	),
('16/3/2018',	'21H00'	,'LNHNAS',	0	,'LNHCOA',	0	),
('16/3/2018',	'21H00'	,'LNHSJS',	0	,'LNHCAL',	0	),
('16/3/2018',	'22H00'	,'LNHDET',	0	,'LNHANA',	0	),
('17/3/2018',	'13H00'	,'LNHCHI',	0	,'LNHBUF',	0	),
('17/3/2018',	'14H00'	,'LNHEDM',	0	,'LNHFLO',	0	),
('17/3/2018',	'16H00'	,'LNHNJD',	0	,'LNHLAK',	0	),
('17/3/2018',	'19H00'	,'LNHMON',	0	,'LNHTOR',	0	),
('17/3/2018',	'19H00'	,'LNHBOS',	0	,'LNHTBL',	0	),
('17/3/2018',	'19H00'	,'LNHPHI',	0	,'LNHCAR',	0	),
('17/3/2018',	'19H00'	,'LNHOTT',	0	,'LNHCOB',	0	),
('17/3/2018',	'20H00'	,'LNHNYR',	0	,'LNHSTL',	0	),
('17/3/2018',	'21H00'	,'LNHMIN',	0	,'LNHARI',	0	),
('17/3/2018',	'22H00'	,'LNHSJS',	0	,'LNHVAN',	0	),
('18/3/2018',	'15H00'	,'LNHDET',	0	,'LNHCOA',	0	),
('18/3/2018',	'16H00'	,'LNHCAL',	0	,'LNHLVK',	0	),
('18/3/2018',	'17H00'	,'LNHEDM',	0	,'LNHTBL',	0	),
('18/3/2018',	'17H00'	,'LNHCAR',	0	,'LNHNYI',	0	),
('18/3/2018',	'17H00'	,'LNHWAS',	0	,'LNHPHI',	0	),
('18/3/2018',	'19H30'	,'LNHSTL',	0	,'LNHCHI',	0	),
('18/3/2018',	'19H30'	,'LNHDAL',	0	,'LNHWIN',	0	),
('18/3/2018',	'21H00'	,'LNHNJD',	0	,'LNHANA',	0	),
('19/3/2018',	'19H00'	,'LNHCOB',	0	,'LNHBOS',	0	),
('19/3/2018',	'19H00'	,'LNHNAS',	0	,'LNHBUF',	0	),
('19/3/2018',	'19H30'	,'LNHFLO',	0	,'LNHMON',	0	),
('19/3/2018',	'20H00'	,'LNHLAK',	0	,'LNHMIN',	0	),
('19/3/2018',	'22H00'	,'LNHCAL',	0	,'LNHARI',	0	),
('20/3/2018',	'19H00'	,'LNHPIT',	0	,'LNHNYI',	0	),
('20/3/2018',	'19H00'	,'LNHCOB',	0	,'LNHNYR',	0	),
('20/3/2018',	'19H00'	,'LNHDAL',	0	,'LNHWAS',	0	),
('20/3/2018',	'19H00'	,'LNHEDM',	0	,'LNHCAR',	0	),
('20/3/2018',	'19H30'	,'LNHFLO',	0	,'LNHOTT',	0	),
('20/3/2018',	'19H30'	,'LNHPHI',	0	,'LNHDET',	0	),
('20/3/2018',	'19H30'	,'LNHTOR',	0	,'LNHTBL',	0	),
('20/3/2018',	'20H00'	,'LNHLAK',	0	,'LNHWIN',	0	),
('20/3/2018',	'20H30'	,'LNHCOA',	0	,'LNHCHI',	0	),
('20/3/2018',	'22H00'	,'LNHVAN',	0	,'LNHLVK',	0	),
('20/3/2018',	'22H30'	,'LNHNJD',	0	,'LNHSJS',	0	),
('21/3/2018',	'19H00'	,'LNHARI',	0	,'LNHBUF',	0	),
('21/3/2018',	'19H00'	,'LNHMON',	0	,'LNHPIT',	0	),
('21/3/2018',	'20H00'	,'LNHBOS',	0	,'LNHSTL',	0	),
('21/3/2018',	'21H30'	,'LNHANA',	0	,'LNHCAL',	0	),
('22/3/2018',	'19H00'	,'LNHTBL',	0	,'LNHNYI',	0	),
('22/3/2018',	'19H00'	,'LNHNYR',	0	,'LNHPHI',	0	),
('22/3/2018',	'19H00'	,'LNHARI',	0	,'LNHCAR',	0	),
('22/3/2018',	'19H00'	,'LNHFLO',	0	,'LNHCOB',	0	),
('22/3/2018',	'19H30'	,'LNHEDM',	0	,'LNHOTT',	0	),
('22/3/2018',	'19H30'	,'LNHWAS',	0	,'LNHDET',	0	),
('22/3/2018',	'20H00'	,'LNHTOR',	0	,'LNHNAS',	0	),
('22/3/2018',	'20H30'	,'LNHVAN',	0	,'LNHCHI',	0	),
('22/3/2018',	'21H00'	,'LNHLAK',	0	,'LNHCOA',	0	),
('22/3/2018',	'22H30'	,'LNHLVK',	0	,'LNHSJS',	0	),
('23/3/2018',	'19H00'	,'LNHMON',	0	,'LNHBUF',	0	),
('23/3/2018',	'19H00'	,'LNHNJD',	0	,'LNHPIT',	0	),
('23/3/2018',	'20H00'	,'LNHVAN',	0	,'LNHSTL',	0	),
('23/3/2018',	'20H00'	,'LNHANA',	0	,'LNHWIN',	0	),
('23/3/2018',	'20H30'	,'LNHBOS',	0	,'LNHDAL',	0	),
('24/3/2018',	'15H00'	,'LNHLVK',	0	,'LNHCOA',	0	),
('24/3/2018',	'16H00'	,'LNHCAL',	0	,'LNHSJS',	0	),
('24/3/2018',	'19H00'	,'LNHDET',	0	,'LNHTOR',	0	),
('24/3/2018',	'19H00'	,'LNHWAS',	0	,'LNHMON',	0	),
('24/3/2018',	'19H00'	,'LNHCAR',	0	,'LNHOTT',	0	),
('24/3/2018',	'19H00'	,'LNHARI',	0	,'LNHFLO',	0	),
('24/3/2018',	'19H00'	,'LNHTBL',	0	,'LNHNJD',	0	),
('24/3/2018',	'19H00'	,'LNHCHI',	0	,'LNHNYI',	0	),
('24/3/2018',	'19H00'	,'LNHBUF',	0	,'LNHNYR',	0	),
('24/3/2018',	'19H00'	,'LNHSTL',	0	,'LNHCOB',	0	),
('24/3/2018',	'20H00'	,'LNHNAS',	0	,'LNHMIN',	0	),
('24/3/2018',	'22H00'	,'LNHLAK',	0	,'LNHEDM',	0	),
('25/3/2018',	'12H30'	,'LNHPHI',	0	,'LNHPIT',	0	),
('25/3/2018',	'19H00'	,'LNHVAN',	0	,'LNHDAL',	0	),
('25/3/2018',	'19H00'	,'LNHNAS',	0	,'LNHWIN',	0	),
('25/3/2018',	'19H30'	,'LNHBOS',	0	,'LNHMIN',	0	),
('25/3/2018',	'21H30'	,'LNHANA',	0	,'LNHEDM',	0	),
('26/3/2018',	'19H00'	,'LNHBUF',	0	,'LNHTOR',	0	),
('26/3/2018',	'19H00'	,'LNHFLO',	0	,'LNHNYI',	0	),
('26/3/2018',	'19H00'	,'LNHWAS',	0	,'LNHNYR',	0	),
('26/3/2018',	'19H00'	,'LNHOTT',	0	,'LNHCAR',	0	),
('26/3/2018',	'19H30'	,'LNHDET',	0	,'LNHMON',	0	),
('26/3/2018',	'19H30'	,'LNHARI',	0	,'LNHTBL',	0	),
('26/3/2018',	'20H30'	,'LNHSJS',	0	,'LNHCHI',	0	),
('26/3/2018',	'22H00'	,'LNHCOA',	0	,'LNHLVK',	0	),
('26/3/2018',	'22H30'	,'LNHCAL',	0	,'LNHLAK',	0	),
('27/3/2018',	'19H00'	,'LNHCAR',	0	,'LNHNJD',	0	),
('27/3/2018',	'19H30'	,'LNHNYI',	0	,'LNHOTT',	0	),
('27/3/2018',	'19H30'	,'LNHPIT',	0	,'LNHDET',	0	),
('27/3/2018',	'20H00'	,'LNHSJS',	0	,'LNHSTL',	0	),
('27/3/2018',	'20H00'	,'LNHMIN',	0	,'LNHNAS',	0	),
('27/3/2018',	'20H00'	,'LNHBOS',	0	,'LNHWIN',	0	),
('27/3/2018',	'20H30'	,'LNHPHI',	0	,'LNHDAL',	0	),
('27/3/2018',	'21H00'	,'LNHCOB',	0	,'LNHEDM',	0	),
('27/3/2018',	'22H00'	,'LNHANA',	0	,'LNHVAN',	0	),
('28/3/2018',	'19H30'	,'LNHFLO',	0	,'LNHTOR',	0	),
('28/3/2018',	'20H00'	,'LNHNYR',	0	,'LNHWAS',	0	),
('28/3/2018',	'22H00'	,'LNHARI',	0	,'LNHLVK',	0	),
('28/3/2018',	'22H00'	,'LNHPHI',	0	,'LNHCOA',	0	),
('29/3/2018',	'19H00'	,'LNHTBL',	0	,'LNHBOS',	0	),
('29/3/2018',	'19H00'	,'LNHDET',	0	,'LNHBUF',	0	),
('29/3/2018',	'19H00'	,'LNHPIT',	0	,'LNHNJD',	0	),
('29/3/2018',	'19H30'	,'LNHFLO',	0	,'LNHOTT',	0	),
('29/3/2018',	'20H00'	,'LNHSJS',	0	,'LNHNAS',	0	),
('29/3/2018',	'20H00'	,'LNHDAL',	0	,'LNHMIN',	0	),
('29/3/2018',	'20H30'	,'LNHWIN',	0	,'LNHCHI',	0	),
('29/3/2018',	'21H00'	,'LNHCOB',	0	,'LNHCAL',	0	),
('29/3/2018',	'22H00'	,'LNHEDM',	0	,'LNHVAN',	0	),
('29/3/2018',	'22H30'	,'LNHARI',	0	,'LNHLAK',	0	),
('30/3/2018',	'19H00'	,'LNHTOR',	0	,'LNHNYI',	0	),
('30/3/2018',	'19H00'	,'LNHTBL',	0	,'LNHNYR',	0	),
('30/3/2018',	'19H00'	,'LNHCAR',	0	,'LNHWAS',	0	),
('30/3/2018',	'21H00'	,'LNHCHI',	0	,'LNHCOA',	0	),
('30/3/2018',	'22H00'	,'LNHLAK',	0	,'LNHANA',	0	),
('30/3/2018',	'22H30'	,'LNHSTL',	0	,'LNHLVK',	0	),
('31/3/2018',	'13H00'	,'LNHFLO',	0	,'LNHBOS',	0	),
('31/3/2018',	'14H00'	,'LNHOTT',	0	,'LNHDET',	0	),
('31/3/2018',	'16H00'	,'LNHCOB',	0	,'LNHVAN',	0	),
('31/3/2018',	'19H00'	,'LNHWIN',	0	,'LNHTOR',	0	),
('31/3/2018',	'19H00'	,'LNHNYI',	0	,'LNHNJD',	0	),
('31/3/2018',	'19H00'	,'LNHMON',	0	,'LNHPIT',	0	),
('31/3/2018',	'19H00'	,'LNHNYR',	0	,'LNHCAR',	0	),
('31/3/2018',	'20H00'	,'LNHBUF',	0	,'LNHNAS',	0	),
('31/3/2018',	'20H00'	,'LNHMIN',	0	,'LNHDAL',	0	),
('31/3/2018',	'21H00'	,'LNHSTL',	0	,'LNHARI',	0	),
('31/3/2018',	'22H00'	,'LNHEDM',	0	,'LNHCAL',	0	),
('31/3/2018',	'22H30'	,'LNHSJS',	0	,'LNHLVK',	0	),
						
('1/4/2018',	'12H30'	,'LNHBOS',	0	,'LNHPHI',	0	),
('1/4/2018',	'18H00'	,'LNHNAS',	0	,'LNHTBL',	0	),
('1/4/2018',	'19H00'	,'LNHNJD',	0	,'LNHMON',	0	),
('1/4/2018',	'19H30'	,'LNHWAS',	0	,'LNHPIT',	0	),
('1/4/2018',	'21H00'	,'LNHCOA',	0	,'LNHANA',	0	),
('2/4/2018',	'19H00'	,'LNHBUF',	0	,'LNHTOR',	0	),
('2/4/2018',	'19H30'	,'LNHWIN',	0	,'LNHOTT',	0	),
('2/4/2018',	'19H30'	,'LNHCAR',	0	,'LNHFLO',	0	),
('2/4/2018',	'20H00'	,'LNHWAS',	0	,'LNHSTL',	0	),
('2/4/2018',	'20H00'	,'LNHEDM',	0	,'LNHMIN',	0	),
('2/4/2018',	'22H30'	,'LNHCOA',	0	,'LNHLAK',	0	),
('3/4/2018',	'19H00'	,'LNHNYR',	0	,'LNHNJD',	0	),
('3/4/2018',	'19H00'	,'LNHPHI',	0	,'LNHNYI',	0	),
('3/4/2018',	'19H00'	,'LNHDET',	0	,'LNHCOB',	0	),
('3/4/2018',	'19H30'	,'LNHWIN',	0	,'LNHMON',	0	),
('3/4/2018',	'19H30'	,'LNHBOS',	0	,'LNHTBL',	0	),
('3/4/2018',	'19H30'	,'LNHNAS',	0	,'LNHFLO',	0	),
('3/4/2018',	'21H00'	,'LNHARI',	0	,'LNHCAL',	0	),
('3/4/2018',	'22H00'	,'LNHLVK',	0	,'LNHVAN',	0	),
('3/4/2018',	'22H30'	,'LNHDAL',	0	,'LNHSJS',	0	),
('4/4/2018',	'19H30'	,'LNHOTT',	0	,'LNHBUF',	0	),
('4/4/2018',	'20H00'	,'LNHCHI',	0	,'LNHSTL',	0	),
('4/4/2018',	'22H00'	,'LNHMIN',	0	,'LNHANA',	0	),
('5/4/2018',	'19H00'	,'LNHTOR',	0	,'LNHNJD',	0	),
('5/4/2018',	'19H00'	,'LNHNYR',	0	,'LNHNYI',	0	),
('5/4/2018',	'19H00'	,'LNHCAR',	0	,'LNHPHI',	0	),
('5/4/2018',	'19H00'	,'LNHNAS',	0	,'LNHWAS',	0	),
('5/4/2018',	'19H00'	,'LNHPIT',	0	,'LNHCOB',	0	),
('5/4/2018',	'19H30'	,'LNHMON',	0	,'LNHDET',	0	),
('5/4/2018',	'19H30'	,'LNHBOS',	0	,'LNHFLO',	0	),
('5/4/2018',	'20H00'	,'LNHCAL',	0	,'LNHWIN',	0	),
('5/4/2018',	'21H00'	,'LNHLVK',	0	,'LNHEDM',	0	),
('5/4/2018',	'22H00'	,'LNHARI',	0	,'LNHVAN',	0	),
('5/4/2018',	'22H30'	,'LNHMIN',	0	,'LNHLAK',	0	),
('5/4/2018',	'22H30'	,'LNHCOA',	0	,'LNHSJS',	0	),
('6/4/2018',	'19H00'	,'LNHOTT',	0	,'LNHPIT',	0	),
('6/4/2018',	'19H30'	,'LNHBUF',	0	,'LNHTBL',	0	),
('6/4/2018',	'20H30'	,'LNHSTL',	0	,'LNHCHI',	0	),
('6/4/2018',	'22H00'	,'LNHDAL',	0	,'LNHANA',	0	),
('7/4/2018',	'15H00'	,'LNHNYR',	0	,'LNHPHI',	0	),
('7/4/2018',	'19H00'	,'LNHCHI',	0	,'LNHWIN',	0	),
('7/4/2018',	'19H00'	,'LNHOTT',	0	,'LNHBOS',	0	),
('7/4/2018',	'19H00'	,'LNHMON',	0	,'LNHTOR',	0	),
('7/4/2018',	'19H00'	,'LNHNYI',	0	,'LNHDET',	0	),
('7/4/2018',	'19H00'	,'LNHBUF',	0	,'LNHFLO',	0	),
('7/4/2018',	'19H00'	,'LNHNJD',	0	,'LNHWAS',	0	),
('7/4/2018',	'19H00'	,'LNHTBL',	0	,'LNHCAR',	0	),
('7/4/2018',	'20H00'	,'LNHCOB',	0	,'LNHNAS',	0	),
('7/4/2018',	'21H00'	,'LNHANA',	0	,'LNHARI',	0	),
('7/4/2018',	'21H00'	,'LNHSTL',	0	,'LNHCOA',	0	),
('7/4/2018',	'22H00'	,'LNHLVK',	0	,'LNHCAL',	0	),
('7/4/2018',	'22H00'	,'LNHVAN',	0	,'LNHEDM',	0	),
('7/4/2018',	'22H30'	,'LNHDAL',	0	,'LNHLAK',	0	),
('7/4/2018',	'22H30'	,'LNHMIN',	0	,'LNHSJS',	0	)



GO
print '***********************************************************************************************'
print 'Ajout des parties NFL...'
print '***********************************************************************************************'

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '07/09/2017', '20H30', 'NFLKCC' , 42, 'NFLNEP', 27) 					
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLNYJ' , 12, 'NFLBUF', 21) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLPHI' , 30, 'NFLWAS', 17) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLOAK' , 26, 'NFLTEN', 16) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLJAC' , 29, 'NFLHOU', 7) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLARI' , 23, 'NFLDET', 35) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLATL' , 23, 'NFLCHI', 17) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLBAL' , 20, 'NFLCIN', 0) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '13H00', 'NFLPIT' , 21, 'NFLCLE', 18) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '16H05', 'NFLIND' , 9,  'NFLLAR', 46) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '16H25', 'NFLSEA' , 9,  'NFLGBP', 17) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '16H25', 'NFLCAR' , 23, 'NFLSFN', 3) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '10/09/2017', '20H30', 'NFLNYG' , 3, 'NFLDAL', 19) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '11/09/2017', '19H10', 'NFLNOS' , 19, 'NFLMIN', 29) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '11/09/2017', '22H20', 'NFLLAC' , 21, 'NFLDEN', 24) 

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES( '14/09/2017','20H25','NFLHOU',13,'NFLCIN',9) 
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLCLE',10,'NFLBAL',24)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLCHI',7,'NFLTBB',29)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLMIN',9,'NFLPIT',26)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLNEP',36,'NFLNOS',20)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLPHI',20,'NFLKCC',27)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLTEN',37,'NFLJAC',16)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLARI',16,'NFLIND',13)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','13H00','NFLBUF',3,'NFLCAR',9)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','16H05','NFLNYJ',20,'NFLOAK',45)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','16H05','NFLMIA',19,'NFLLAC',17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','16H25','NFLSFN',9,'NFLSEA',12)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','16H25','NFLWAS',27,'NFLLAR',20)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','16H25','NFLDAL',17,'NFLDEN',42)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/09/2017','20H30','NFLGBP',23,'NFLATL',34)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('18/09/2017','20H30','NFLDET',24,'NFLNYG',10)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('21/09/2017' ,	'20H25'	,'NFLLAR' ,	41	,'NFLSFN' ,	39)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'9H30'	,'NFLBAL' ,	7	,'NFLJAC' ,	44)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLCLE' ,	28	,'NFLIND' ,	31)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLNYG' ,	24	,'NFLPHI' ,	27)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLMIA' ,	6	,'NFLNYJ' ,	20)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLDEN' ,	16	,'NFLBUF' ,	26)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLNOS' ,	34	,'NFLCAR' ,	13)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLPIT' ,	17	,'NFLCHI' ,	23)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLATL' ,	30	,'NFLDET' ,	26)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLTBB' ,	17	,'NFLMIN' ,	34)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'13H00'	,'NFLHOU' ,	33	,'NFLNEP' ,	36)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'16H05'	,'NFLSEA' ,	27	,'NFLTEN' ,	33)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'16H25'	,'NFLCIN' ,	24	,'NFLGBP' ,	27)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'16H25'	,'NFLKCC' ,	24	,'NFLLAC' ,	10)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/09/2017' ,	'20H30'	,'NFLOAK' ,	10	,'NFLWAS' ,	27)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('25/09/2017' ,	'20H30'	,'NFLDAL' ,	28	,'NFLARI' ,	17)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('28/09/2017' ,	'20H25'	,'NFLCHI' ,	14	,'NFLGBP' ,	35)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'9H30'	,'NFLNOS' ,	20	,'NFLMIA' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLCIN' ,	31	,'NFLCLE' ,	7)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLTEN' ,	14	,'NFLHOU' ,	57)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLJAC' ,	20	,'NFLNYJ' ,	23)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLCAR' ,	33	,'NFLNEP' ,	30)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLDET' ,	14	,'NFLMIN' ,	7)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLBUF' ,	23	,'NFLATL' ,	17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLPIT' ,	26	,'NFLBAL' ,	9)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'13H00'	,'NFLLAR' ,	35	,'NFLDAL' ,	30)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'16H05'	,'NFLPHI' ,	26	,'NFLLAC' ,	24)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'16H05'	,'NFLNYG' ,	23	,'NFLTBB' ,	25)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'16H05'	,'NFLSFN' ,	15	,'NFLARI' ,	18)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'16H25'	,'NFLOAK' ,	10	,'NFLDEN' ,	16)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('01/10/2017' ,	'20H30'	,'NFLIND' ,	18	,'NFLSEA' ,	46)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('02/10/2017' ,	'20H30'	,'NFLWAS' ,	20	,'NFLKCC' ,	29)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/10/2017' ,	'20H25'	,'NFLNEP' ,	19	,'NFLTBB' ,	14)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLNYJ' ,	17	,'NFLCLE' ,	14)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLCAR' ,	27	,'NFLDET' ,	24)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLSFN' ,	23	,'NFLIND' ,	26)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLTEN' ,	10	,'NFLMIA' ,	16)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLBUF' ,	16	,'NFLCIN' ,	20)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLLAC' ,	27	,'NFLNYG' ,	22)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLJAC' ,	30	,'NFLPIT' ,	9)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'13H00'	,'NFLARI' ,	7	,'NFLPHI' ,	34)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'16H05'	,'NFLSEA' ,	16	,'NFLLAR' ,	10)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'16H05'	,'NFLBAL' ,	30	,'NFLOAK' ,	17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'16H25'	,'NFLGBP' ,	35	,'NFLDAL' ,	31)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('08/10/2017' ,	'20H30'	,'NFLKCC' ,	42	,'NFLHOU' ,	34)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('09/10/2017' ,	'20H30'	,'NFLMIN' ,	20	,'NFLCHI' ,	17)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/10/2017' ,	'20H25'	,'NFLPHI' ,	28	,'NFLCAR' ,	23)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'13H00'	,'NFLCHI' ,	27	,'NFLBAL' ,	24)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'13H00'	,'NFLCLE' ,	17	,'NFLHOU' ,	33)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'13H00'	,'NFLGBP' ,	10	,'NFLMIN' ,	23)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'13H00'	,'NFLDET' ,	38	,'NFLNOS' ,	52)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'13H00'	,'NFLMIA' ,	20	,'NFLATL' ,	17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'13H00'	,'NFLNEP' ,	24	,'NFLNYJ' ,	17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'13H00'	,'NFLSFN' ,	24	,'NFLWAS' ,	26)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'16H05'	,'NFLTBB' ,	33	,'NFLARI' ,	38)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'16H05'	,'NFLLAR' ,	27	,'NFLJAC' ,	17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'16H25'	,'NFLLAC' ,	17	,'NFLOAK' ,	16)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'16H25'	,'NFLPIT' ,	19	,'NFLKCC' ,	13)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('15/10/2017' ,	'20H30'	,'NFLNYG' ,	23	,'NFLDEN' ,	10)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('16/10/2017' ,	'20H30'	,'NFLIND' ,	22	,'NFLTEN' ,	36)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/10/2017' ,	'20H25'	,'NFLKCC' ,	30	,'NFLOAK' ,	31)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLTBB' ,	27	,'NFLBUF' ,	30)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLCIN' ,	14	,'NFLPIT' ,	29)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLBAL' ,	16	,'NFLMIN' ,	24)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLNYJ' ,	28	,'NFLMIA' ,	31)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLARI' ,	0	,'NFLLAR' ,	33)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLCAR' ,	3	,'NFLCHI' ,	17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLTEN' ,	12	,'NFLCLE' ,	9)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLNOS' ,	26	,'NFLGBP' ,	17)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'13H00'	,'NFLJAC' ,	27	,'NFLIND' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'16H05'	,'NFLDAL' ,	40	,'NFLSFN' ,	10)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'16H25'	,'NFLSEA' ,	24	,'NFLNYG' ,	7)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'16H25'	,'NFLDEN' ,	0	,'NFLLAC' ,	21)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('22/10/2017' ,	'20H30'	,'NFLATL' ,	7	,'NFLNEP' ,	23)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('23/10/2017' ,	'20H30'	,'NFLWAS' ,	24	,'NFLPHI' ,	34)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/10/2017' ,	'20H25'	,'NFLMIA' ,	0	,'NFLBAL' ,	40)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'9H30'	,'NFLMIN' ,	33	,'NFLCLE' ,	16)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'13H00'	,'NFLATL' ,	25	,'NFLNYJ' ,	20)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'13H00'	,'NFLCAR' ,	17	,'NFLTBB' ,	3)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'13H00'	,'NFLSFN' ,	10	,'NFLPHI' ,	33)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'13H00'	,'NFLCHI' ,	12	,'NFLNOS' ,	20)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'13H00'	,'NFLLAC' ,	13	,'NFLNEP' ,	21)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'13H00'	,'NFLOAK' ,	14	,'NFLBUF' ,	34)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'13H00'	,'NFLIND' ,	23	,'NFLCIN' ,	24)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'16H05'	,'NFLHOU' ,	38	,'NFLSEA' ,	41)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'16H25'	,'NFLDAL' ,	33	,'NFLWAS' ,	19)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('29/10/2017' ,	'20H30'	,'NFLPIT' ,	20	,'NFLDET' ,	15)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('30/10/2017' ,	'20H30'	,'NFLDEN' ,	19	,'NFLKCC' ,	29)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('02/11/2017' ,	'20H25'	,'NFLBUF' ,	21	,'NFLNYJ' ,	34)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'13H00'	,'NFLIND' ,	0	,'NFLHOU' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'13H00'	,'NFLCIN' ,	0	,'NFLJAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'13H00'	,'NFLTBB' ,	0	,'NFLNOS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'13H00'	,'NFLLAR' ,	0	,'NFLNYG' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'13H00'	,'NFLATL' ,	0	,'NFLCAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'13H00'	,'NFLDEN' ,	0	,'NFLPHI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'13H00'	,'NFLBAL' ,	0	,'NFLTEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'16H05'	,'NFLARI' ,	0	,'NFLSFN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'16H05'	,'NFLWAS' ,	0	,'NFLSEA' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'16H25'	,'NFLKCC' ,	0	,'NFLDAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('05/11/2017' ,	'20H30'	,'NFLOAK' ,	0	,'NFLMIA' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('06/11/2017' ,	'20H30'	,'NFLDET' ,	0	,'NFLGBP' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('09/11/2017' ,	'20H25'	,'NFLSEA' ,	0	,'NFLARI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLGBP' ,	0	,'NFLCHI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLCLE' ,	0	,'NFLDET' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLPIT' ,	0	,'NFLIND' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLLAC' ,	0	,'NFLJAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLNOS' ,	0	,'NFLBUF' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLNYJ' ,	0	,'NFLTBB' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLMIN' ,	0	,'NFLWAS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'13H00'	,'NFLCIN' ,	0	,'NFLTEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'16H05'	,'NFLHOU' ,	0	,'NFLLAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'16H25'	,'NFLDAL' ,	0	,'NFLATL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'16H25'	,'NFLNYG' ,	0	,'NFLSFN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('12/11/2017' ,	'20H30'	,'NFLNEP' ,	0	,'NFLDEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('13/11/2017' ,	'20H30'	,'NFLMIA' ,	0	,'NFLCAR' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('16/11/2017' ,	'20H25'	,'NFLTEN' ,	0	,'NFLPIT' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'13H00'	,'NFLJAC' ,	0	,'NFLCLE' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'13H00'	,'NFLBAL' ,	0	,'NFLGBP' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'13H00'	,'NFLARI' ,	0	,'NFLHOU' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'13H00'	,'NFLLAR' ,	0	,'NFLMIN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'13H00'	,'NFLDET' ,	0	,'NFLCHI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'13H00'	,'NFLWAS' ,	0	,'NFLNOS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'13H00'	,'NFLKCC' ,	0	,'NFLNYG' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'16H05'	,'NFLBUF' ,	0	,'NFLLAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'16H25'	,'NFLCIN' ,	0	,'NFLDEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'16H25'	,'NFLNEP' ,	0	,'NFLOAK' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('19/11/2017' ,	'20H30'	,'NFLPHI' ,	0	,'NFLDAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('20/11/2017' ,	'20H30'	,'NFLATL' ,	0	,'NFLSEA' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('23/11/2017' ,	'12H30'	,'NFLMIN' ,	0	,'NFLDET' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('23/11/2017' ,	'16H30'	,'NFLLAC' ,	0	,'NFLDAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('23/11/2017' ,	'20H30'	,'NFLNYG' ,	0	,'NFLWAS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'13H00'	,'NFLBUF' ,	0	,'NFLKCC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'13H00'	,'NFLTEN' ,	0	,'NFLIND' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'13H00'	,'NFLCLE' ,	0	,'NFLCIN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'13H00'	,'NFLTBB' ,	0	,'NFLATL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'13H00'	,'NFLMIA' ,	0	,'NFLNEP' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'13H00'	,'NFLCHI' ,	0	,'NFLPHI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'13H00'	,'NFLCAR' ,	0	,'NFLNYJ' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'16H05'	,'NFLNOS' ,	0	,'NFLLAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'16H05'	,'NFLSEA' ,	0	,'NFLSFN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'16H25'	,'NFLJAC' ,	0	,'NFLARI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'16H25'	,'NFLDEN' ,	0	,'NFLOAK' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('26/11/2017' ,	'20H30'	,'NFLGBP' ,	0	,'NFLPIT' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('27/11/2017' ,	'20H30'	,'NFLHOU' ,	0	,'NFLBAL' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('30/11/2017' ,	'20H25'	,'NFLWAS' ,	0	,'NFLDAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLMIN' ,	0	,'NFLATL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLHOU' ,	0	,'NFLTEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLKCC' ,	0	,'NFLNYJ' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLCAR' ,	0	,'NFLNOS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLDEN' ,	0	,'NFLMIA' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLDET' ,	0	,'NFLBAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLNEP' ,	0	,'NFLBUF' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLSFN' ,	0	,'NFLCHI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLTBB' ,	0	,'NFLGBP' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'13H00'	,'NFLIND' ,	0	,'NFLJAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'16H05'	,'NFLCLE' ,	0	,'NFLLAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'16H25'	,'NFLNYG' ,	0	,'NFLOAK' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'16H25'	,'NFLLAR' ,	0	,'NFLARI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('03/12/2017' ,	'20H30'	,'NFLPHI' ,	0	,'NFLSEA' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('04/12/2017' ,	'20H30'	,'NFLPIT' ,	0	,'NFLCIN' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('07/12/2017' ,	'20H25'	,'NFLNOS' ,	0	,'NFLATL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLIND' ,	0	,'NFLBUF' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLDET' ,	0	,'NFLTBB' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLOAK' ,	0	,'NFLKCC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLSEA' ,	0	,'NFLJAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLSFN' ,	0	,'NFLHOU' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLGBP' ,	0	,'NFLCLE' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLCHI' ,	0	,'NFLCIN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'13H00'	,'NFLMIN' ,	0	,'NFLCAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'16H05'	,'NFLWAS' ,	0	,'NFLLAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'16H05'	,'NFLNYJ' ,	0	,'NFLDEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'16H05'	,'NFLTEN' ,	0	,'NFLARI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'16H25'	,'NFLDAL' ,	0	,'NFLNYG' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'16H25'	,'NFLPHI' ,	0	,'NFLLAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('10/12/2017' ,	'20H30'	,'NFLBAL' ,	0	,'NFLPIT' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('11/12/2017' ,	'20H30'	,'NFLNEP' ,	0	,'NFLMIA' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('14/12/2017' ,	'20H25'	,'NFLDEN' ,	0	,'NFLIND' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('16/12/2017' ,	'16H30'	,'NFLCHI' ,	0	,'NFLDET' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('16/12/2017' ,	'20H25'	,'NFLLAC' ,	0	,'NFLKCC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLHOU' ,	0	,'NFLJAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLBAL' ,	0	,'NFLCLE' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLGBP' ,	0	,'NFLCAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLMIA' ,	0	,'NFLBUF' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLCIN' ,	0	,'NFLMIN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLARI' ,	0	,'NFLWAS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLPHI' ,	0	,'NFLNYG' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'13H00'	,'NFLNYJ' ,	0	,'NFLNOS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'16H05'	,'NFLLAR' ,	0	,'NFLSEA' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'16H25'	,'NFLTEN' ,	0	,'NFLSFN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'16H25'	,'NFLNEP' ,	0	,'NFLPIT' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('17/12/2017' ,	'20H30'	,'NFLDAL' ,	0	,'NFLOAK' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('18/12/2017' ,	'20H30'	,'NFLATL' ,	0	,'NFLTBB' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('23/12/2017' ,	'16H30'	,'NFLIND' ,	0	,'NFLBAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('23/12/2017' ,	'20H30'	,'NFLMIN' ,	0	,'NFLGBP' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLDET' ,	0	,'NFLCIN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLMIA' ,	0	,'NFLKCC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLBUF' ,	0	,'NFLNEP' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLCLE' ,	0	,'NFLCHI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLTBB' ,	0	,'NFLCAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLATL' ,	0	,'NFLNOS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLDEN' ,	0	,'NFLWAS' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLLAR' ,	0	,'NFLTEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'13H00'	,'NFLLAC' ,	0	,'NFLNYJ' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'16H05'	,'NFLJAC' ,	0	,'NFLSFN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'16H25'	,'NFLSEA' ,	0	,'NFLDAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('24/12/2017' ,	'16H25'	,'NFLNYG' ,	0	,'NFLARI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('25/12/2017' ,	'16H30'	,'NFLPIT' ,	0	,'NFLHOU' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('25/12/2017' ,	'20H30'	,'NFLOAK' ,	0	,'NFLPHI' ,	0)

insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLCAR' ,	0	,'NFLATL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLCIN' ,	0	,'NFLBAL' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLJAC' ,	0	,'NFLTEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLNOS' ,	0	,'NFLTBB' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLCLE' ,	0	,'NFLPIT' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLGBP' ,	0	,'NFLDET' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLHOU' ,	0	,'NFLIND' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLBUF' ,	0	,'NFLMIA' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLCHI' ,	0	,'NFLMIN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLNYJ' ,	0	,'NFLNEP' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLWAS' ,	0	,'NFLNYG' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'13H00'	,'NFLDAL' ,	0	,'NFLPHI' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'16H25'	,'NFLOAK' ,	0	,'NFLLAC' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'16H25'	,'NFLKCC' ,	0	,'NFLDEN' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'16H25'	,'NFLSFN' ,	0	,'NFLLAR' ,	0)
insert into [T_Parties] (par_date, par_Heure,fk_Equ_no_Vis, Par_pts_vis, fk_Equ_no_Rec,Par_pts_rec) vALUES('31/12/2017' ,	'16H25'	,'NFLARI' ,	0	,'NFLSEA' ,	0)
GO






Select 'Base de données p54_calendrier créée'
print ' '
print '***********************************************************************************************'
print 'Base de données p54_Calendrier créée...'
print '***********************************************************************************************'
GO