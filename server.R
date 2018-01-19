library(shiny)
library(leaflet)
# Crate the map icon
coffeeIcon <- makeIcon(
    iconUrl = "data/Coffee.png",
    iconWidth = 31,
    iconHeight = 31,
    iconAnchorX = 31,
    iconAnchorY = 16
)

starDF <-
    read.csv(file = "data/starbucks_us_locations.csv", header = TRUE, sep = ",")


shinyServer(function(input, output) {
   
   starDFmod <- reactive({
        state <- paste("-", input$select,"-", sep = " ")
        return(starDF[grepl(state,starDF$state),])
    })
   
   output$starMap <- renderLeaflet({
      starDFmod() %>% leaflet() %>% addTiles() %>% 
             addMarkers(icon = coffeeIcon, clusterOptions = markerClusterOptions(), 
                        popup = starDFmod()[,4])
   })
})
