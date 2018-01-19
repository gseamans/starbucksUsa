library(shiny)
library(leaflet)

# Read the dataset for the list of states
sdf <- read.csv(file = "data/states.csv", header = TRUE, sep = ",")

ui <- shinyUI(pageWithSidebar(
    titlePanel(div(style="text-align:center","Starbucks USA"), windowTitle = "Data Products Week4"),
    sidebarPanel(
        selectInput(
            "select",
            label = h3("Select the State"),
            choices = setNames(as.character(sdf$abbr), as.character(sdf$state))),
            div(style="text-align:center","Select the state to generate a map of Starbucks locations. The data is somewhat dated. 
                You can scroll in/out, drill down,  and click on coffee cups to get the address.")
    ),
    
    mainPanel(
        leafletOutput("starMap")
    ))
)
