#Para poder predecir de manera eficiente ciertos eventos reemplazaremos los valores NA por los promedios de cada columna
#En este caso, las columnas agent y company son las que poseen valores NA
#dataframe limpio
hotel_data_agentlimpio <- hotel_data[!is.na(hotel_data$agent),]


#Podemos aplicar l eliminación de filas cuyo agent es NA debido a que son pocos casos y no alteraria en gran medida la predicción
length(hotel_data$agent)
sum(is.na(hotel_data$agent))
sum(!is.na(hotel_data$agent))


#tipo de comidas que se repiten más por agente que realiza la reserva
#por lo tanto al usar esos agentes siempre tendrás cierto tipo de comida


#contar total de agentes
length(hotel_data_agentlimpio$agent)

#contar total de agentes de cada tipo
contar_tipo_agent <- function(dataframe, variable){
  id <- table(dataframe[[variable]])
  return(id)
}
contar_tipo_agent(hotel_data_agentlimpio, 'agent')

#tipos de agente más usados
agent_mas_usados <- function(dataframe, variable, n){
  mas_usados <- contar_tipo_agent(dataframe, variable)
  n_mas_usados <- sort(mas_usados, decreasing = TRUE)
  return(n_mas_usados[1:n])
}
agent_mas_usados(hotel_data_agentlimpio, 'agent', 5)

#grafico
grafico_agent_mas_usados <- function(dataframe, variable, n){
  mas_usados <- contar_tipo_agent(dataframe, variable)
  n_mas_usados <- sort(mas_usados, decreasing = TRUE)
  id_agents <- names(n_mas_usados[1:n])
  valor_agents <- n_mas_usados[1:n]
  color_agent <- c(rep("#C4FB24", 1), rep("#4BFB24", 1), rep("#24FB6F", 1), rep("#24FBC4", 1), rep("#24D1FB", 1), rep("black", length(id_agents)))
  barplot(valor_agents, names.arg=id_agents, xlab = 'ID Agents', ylab = 'Frecuencia', col = color_agent)
}
grafico_agent_mas_usados(hotel_data_agentlimpio, 'agent', 5)

#tipo de paquete más usados por estos agentes
meal_por_agente <- function(dataframe, variableA, variableM, n){
  contador <- table(dataframe[, variableA], dataframe[, variableM])
  
  n_mas_usados <- sort(table(dataframe[, variableA]), decreasing = TRUE)
  id_agents <- names(n_mas_usados[1:n])
  
  for (agent in id_agents) {
    cat(paste0('agentID: ', agent, '\n'))
    mas_usados <- contador[agent, ]
    print(mas_usados[order(mas_usados, decreasing = TRUE)])
    cat("\n")
  }
}
meal_por_agente(hotel_data_agentlimpio, 'agent', 'meal', 5)

#grafico
install.packages("ggplot2")
library(ggplot2)

grafico_meal_por_agente <- function(dataframe, variableA, variableM, n) {
  contador <- table(dataframe[, variableA], dataframe[, variableM])
  
  n_mas_usados <- sort(table(dataframe[, variableA]), decreasing = TRUE)
  id_agents <- names(n_mas_usados[1:n])
  
  agent_dataframe <- data.frame()
  for (agente in id_agents) {
    mas_usados <- as.data.frame(contador[agente, ])
    colnames(mas_usados) <- c("Frecuencia")
    mas_usados$Agente <- agente
    mas_usados$Meal <- rownames(mas_usados)
    agent_dataframe <- rbind(agent_dataframe, mas_usados)
    
  }
  
  ggplot(agent_dataframe, aes(x = Agente, y = Frecuencia, fill = Meal)) + 
    geom_bar(stat = "identity") + 
    theme(axis.text.x = element_text(angle = 0)) + 
    labs(title = "Paquetes por agent", x = "ID agent", y = "Frecuencia")
}
grafico_meal_por_agente(hotel_data_agentlimpio, 'agent', 'meal', 5)

