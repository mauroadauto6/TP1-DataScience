#CARGA DE DATOS
hotel_data_NONULL <- read.csv("C:/Users/U S U A R I O/Documents/UPC/Ciclo V/Fundamentos de Data Science/TP1/hotel_bookings.csv", na.strings = "NULL")
hotel_data_NULL <- read.csv("C:/Users/U S U A R I O/Documents/UPC/Ciclo V/Fundamentos de Data Science/TP1/hotel_bookings.csv")

#INSPECCIONAR DATOS
View(hotel_data_NULL)
View(hotel_data_NONULL)

str(hotel_data_NULL)
hotel_data_NULL$hotel <- as.factor(hotel_data_NULL$hotel)
hotel_data_NULL$is_canceled <- as.factor(hotel_data_NULL$is_canceled)
hotel_data_NULL$meal <- as.factor(hotel_data_NULL$meal)
hotel_data_NULL$market_segment <- as.factor(hotel_data_NULL$market_segment)
hotel_data_NULL$distribution_channel <- as.factor(hotel_data_NULL$distribution_channel)
hotel_data_NULL$is_repeated_guest <- as.factor(hotel_data_NULL$is_repeated_guest)
hotel_data_NULL$deposit_type <- as.factor(hotel_data_NULL$deposit_type)
hotel_data_NULL$customer_type <- as.factor(hotel_data_NULL$customer_type)
hotel_data_NULL$reservation_status <- as.factor(hotel_data_NULL$reservation_status)
hotel_data_NULL$reserved_room_type <- as.factor(hotel_data_NULL$reserved_room_type)
hotel_data_NULL$assigned_room_type <- as.factor(hotel_data_NULL$assigned_room_type)

sin_valor <- function(x){
  sum = 0
  for(i in 1:ncol(x))
  {
    cat("En la columna",colnames(x[i]),"total de valores NA:",colSums(is.na(x[i])),"\n")
  }
}
sin_valor(hotel_data_NONULL)

#VISUALIZAR DATO

table(hotel_data_NULL$meal)
barplot(table(hotel_data_NULL$meal), main="Paquete elegido por los clientes", names= c("Comida y Desayuno", "Paquete Completo", "Medio Paquete", "No eligió paquete", "Indefinido"))
