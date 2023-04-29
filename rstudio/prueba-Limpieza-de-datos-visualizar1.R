#VISUALIZAR DATO
#Cantidad de clientes de cada hotel que usaron agente y/o compañia
#Total de hoteles - 119390
length(hotel_data_NULL$hotel[hotel_data_NULL$hotel])

  #Resort Hotel total - 40060
length(hotel_data_NULL$hotel[hotel_data_NULL$hotel == "Resort Hotel"])

    #Agente - total - 31851
length(hotel_data_NULL$hotel[hotel_data_NULL$agent != "NULL" & hotel_data_NULL$hotel == "Resort Hotel"])
    #No Agente - total - 8209
length(hotel_data_NULL$hotel[hotel_data_NULL$agent == "NULL" & hotel_data_NULL$hotel == "Resort Hotel"])

    #Compañia - total - 3108
length(hotel_data_NULL$hotel[hotel_data_NULL$company != "NULL" & hotel_data_NULL$hotel == "Resort Hotel"])
    #No Compañia - total - 36952
length(hotel_data_NULL$hotel[hotel_data_NULL$company == "NULL" & hotel_data_NULL$hotel == "Resort Hotel"])

    #Agente y Compañia - total - 217
length(hotel_data_NULL$hotel[hotel_data_NULL$agent != "NULL" & hotel_data_NULL$company != "NULL"])
    #No Agente y No Compañia - total  - 9760
length(hotel_data_NULL$hotel[hotel_data_NULL$agent == "NULL" & hotel_data_NULL$company == "NULL"])







  #City Hotel total - 79330
length(hotel_data_NULL$hotel[hotel_data_NULL$hotel == "City Hotel"])
#Agente - total - 31851
length(hotel_data_NULL$hotel[hotel_data_NULL$agent != "NULL" & hotel_data_NULL$hotel == "Resort Hotel"])
#No Agente - total - 8209
length(hotel_data_NULL$hotel[hotel_data_NULL$agent == "NULL" & hotel_data_NULL$hotel == "Resort Hotel"])