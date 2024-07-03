library(reactable)
library(reactablefmtr)
library(tidyr)
library(lubridate)
library(shinycssloaders)


tabeServer <- function(id, data, theme) {
  moduleServer(
    id,
    function(input, output, session) {
      
      output$tabe <- renderReactable({
        reactable(
          data,
          theme=theme,
          compact = TRUE,
          pagination = TRUE,
          showSortIcon = FALSE,
          defaultSortOrder = 'desc',
          defaultColDef = colDef(
            maxWidth = 50,
            align = 'center',
            cell = tooltip(number_fmt = scales::comma),
            style = color_scales(data, text_size = 24, span = TRUE)
          ),
          columns = list(
            scientific_vernacular_names = colDef(
              name = "Scientific / Vernacular Name",
              minWidth = 100,
              maxWidth = 175,
              align = 'left',
              html = TRUE
            )
          )
        ) %>% 
          add_title('Total Species Observations') %>% 
          add_source('Data sourced from Global Biodiversity Information Facility') 
      })
    })
}


tabeUI <- function(id) {
  ns <- NS(id)
  reactableOutput(ns("tabe")) %>% withSpinner()
}

