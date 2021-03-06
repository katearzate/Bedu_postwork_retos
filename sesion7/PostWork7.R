# ---------------- POSTWORK SESION 7 ---------------------
#
#Utilizando el manejador de BDD Mongodb Compass (previamente instalado), deber�s de realizar las siguientes acciones:
#
#1.Alojar el fichero data.csv en una base de datos llamada match_games, nombrando al collection como match
#2.Una vez hecho esto, realizar un count para conocer el n�mero de registros que se tiene en la base
#3.Realiza una consulta utilizando la sintaxis de Mongodb, en la base de datos para conocer el n�mero de goles que meti� 
#el Real Madrid el 20 de diciembre de 2015 y contra que equipo jug�, �perdi� � fue goleada?
library(mongolite)	

setwd("../Sesi�n 7/") 
match=data.table::fread("../data.csv")	
names(match)	

collection = mongo(collection = "match", db = "match_games")
collection$insert(match)  #insertando el CVS a la BDD	

# N�mero de registros	
collection$count()	

# Visualizar el fichero 	
collection$find()	

# Basic queries: �Cu�ntos goles meti� como local el Real Madrid el la fecha estipulada?	
collection$find('{"date":"2015-12-20", "home_team":"Real Madrid"}')	#No se encontr� ningun dato en ese a�o

#Agregar otro CVS a la DDB	
collection = mongo(collection = "mtcars", db = "match_games") # create connection, database and collection	
collection$insert(mtcars)	

# Cerrando la conexi�n	
rm(collection)