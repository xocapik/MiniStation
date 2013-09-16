/*
*     Multilanguage support
*
*     by Xocapik
*
*		--using lists in memory or using database?¿?¿?--
*/


//List in memory
var/list/langEs = file2list("config/lang/es.txt")
var/list/langEn = file2list("config/lang/en.txt")

client/proc/langGetString(var/id as text)
	var/text


	if (prefs.lang==0) //español
		text = langEs[id]
	else //ingles
		text = langEn[id]

	return text

//Database
/*
SQL - not tested
CREATE TABLE T_lang (
  id 	int 	PRIMARY KEY
 ,es	text 	NOT NULL
 ,en	text 	NOT NULL
 ,note	text
);

client/proc/langGetString(var/id as text)
	var/SQLquery
	var/langcode

	if (prefs.lang==0) //español
		langcode = "es"
	else //ingles
		langcode = "en"


	SQLquery = "SELECT [langcode] FROM T_Lang WHERE id=[id]"
	var/DBQuery/query = dbcon.NewQuery(SQLquery)
	query.Execute()
	return query.item[1]
*/


//each sentence or word has his own id
#define R_NEW_PLAYER_OPTIONS 1
#define R_SETUP_CHARACTER 2
#define R_DECLARE_READY 3
#define R_YOU_READY 4
#define R_CANCEL 5
#define R_JOIN_GAME 6
#define R_OBSERVE 7
#define R_SPANISH 8
#define R_ENGLISH 9