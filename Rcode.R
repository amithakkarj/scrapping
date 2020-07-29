install.packages('rvest')
install.packages('jsonlite')
library('jsonlite')
library('rvest')

url <- 'https://us.megabus.com/journey-planner/api/journeys/prices?originId=466&destinationId=412&departureDate=2019-11-19&totalPassengers=1&concessionCount=0&nusCount=0&otherDisabilityCount=0&wheelchairSeated=0&pcaCount=0'
webpage <- read_html(url)
webpage
my_paragraphs <- html_nodes(webpage, "p")
my_paragraphs

library(httr)
r <-GET('https://us.megabus.com/journey-planner/api/journeys/prices?originId=466&destinationId=412&departureDate=2019-12-1&totalPassengers=1&concessionCount=0&nusCount=0&otherDisabilityCount=0&wheelchairSeated=0&pcaCount=0')
json <- content(r,as="parsed")
json
json_data_frame <- as.data.frame(json)

write.csv(json,"download.csv",row.names = FALSE)



  