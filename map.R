library(leaflet)
library(shinycssloaders)

mapServer <- function(id, data) {
  moduleServer(
    id,
    function(input, output, session) {
      output$map <- renderLeaflet({
        leaflet(options = leafletOptions(zoomControl = FALSE,preferCanvas = TRUE)) %>% addProviderTiles("CartoDB.Positron", group="CartoDB") %>%
          addProviderTiles("Esri.WorldImagery", group = "ESRI World Image") %>%
          addCircleMarkers(lng = data$longitudeDecimal, lat = data$latitudeDecimal,
                           clusterOptions = markerClusterOptions()
          )
      })
    })
}


mapUI <- function(id) {
  ns <- NS(id)
  leafletOutput(ns("map")) %>% withSpinner()
}