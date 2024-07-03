library(shinycssloaders)

source("map.R", local=T)
source("sidebar.R", local=T)
source("table.R", local=T)

pol_oc <- read.csv("./pol_oc.csv")

function(input, output, session) {
  
  rv <- reactiveValues(
    pol_oc = NULL,
    pol_oc_L = NULL,
    theme = NULL
  )
  
  
  observeEvent(
    list(
      input$side,
      input$'dark_mode'),
    {
      rv$theme = if(input$'dark_mode'==T) {
        midnightblue()
      } else { nytimes() }
      
      
      req(input$side)
      rv$pol_oc <- if(is.null(input$side)) {
        tibble(eventDate = Date(),  scientificName = character(), vernacularName = character(),
               longitudeDecimal = numeric(), latitudeDecimal = numeric())} else {
        pol_oc |>
        filter(scientificName %in% input$side | vernacularName %in% input$side) }
      
      req(rv$pol_oc)
      if(nrow(rv$pol_oc)==0) {
        createAlert(
          id = "noselect",
          options = list(
            title = "Alert",
            closable = TRUE,
            width = 12,
            elevations = 4,
            status = "primary",
            content = "No data available for that selection, or lack thereof. Use the left sidebar to search for something"
          )
        ) } else {
          closeAlert(id = "noselect")
        }
      
      mapServer("BioMap", rv$pol_oc)
      
      rv$pol_oc_L <- rv$pol_oc |> mutate(
        year = year(ymd(eventDate)),
        scientific_vernacular_names = paste0("<b>",scientificName,"</b><br>", vernacularName)) |> 
        select(year, scientific_vernacular_names) |>
        group_by(year, scientific_vernacular_names) %>%
        summarize(day_cnt = n()) |>
        pivot_wider(names_from = year, values_from = day_cnt)
      
      #tabeServer("BioTabe", rv$pol_oc_L, rv$theme)
    }
  )
  


  
  output$reactive_sidebar <- renderUI({
    
    sideUI("side", data = pol_oc |> select(scientificName, vernacularName) ) 
    
    })
        

}
