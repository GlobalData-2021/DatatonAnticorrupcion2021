#install.packages("mongolite")

library(mongolite)

# Conexion DataBase
connection_string = 'mongodb+srv://DataAnt21:DataAnt21@cluster0.fgcec.mongodb.net/DataAnt21'

# Conexion Collection: serPub_sancion
sP_s_collection = mongo(collection="serPub_sancion", db="DataAnt21", url=connection_string)

# Conexion Collection: serPub_contraPub
sPs_cP_collection = mongo(collection="serPub_contraPub", db="DataAnt21", url=connection_string)

# Conexion Collection: declaraciones
declara_collection = mongo(collection="declaraciones", db="DataAnt21", url=connection_string)

simpleFiltro = sP_s_collection$find('{"expediente": "SANC/bed70faf"}')

df <- as.data.frame(simpleFiltro)
head(df)

primero = declaraciones_collection$aggregate('[{"$project":{
  "declaracion.situacionPatrimonial.datosCurricularesDeclarante.escolaridad.0.nivel.valor":1,
  "declaracion.situacionPatrimonial.datosEmpleoCargoComision.datosEmpleoCargoComision": 1
}}]')

dfp <- as.data.frame(primero)
head(dfp)

#----------------

lic = declara_collection$find()

dfl <- as.data.frame(lic)
head(dfl)

#--------------------------

lid = declara_collection$find('{"id": "ca1336ce-9a12-413a-bab3-b57d85a0948d" }')

dfld <- as.data.frame(lid)
head(dfld)

#-----

sancionados = sP_s_collection$find()
df_sancionados <- as.data.frame(sancionados)
head(dfl)

# ---- 


servidorPub = sPs_cP_collection$find()
dfserPub <- as.data.frame(servidorPub)
head(dfserPub)

#-----

san_mujeres = sP_s_collection$aggregate('[{"$group":{"servidorPublicoSancionado.sexo": "M", "Count": {"$sum":1}}}]')
dfsm <- as.data.frame(san_mujeres)
head(dfsm)
