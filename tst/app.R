library(shiny)
library(dqshiny)

# create 100K random words
opts <- sapply(1:100000, function(i) paste0(sample(letters, 7), collapse=""))

ui <- fluidPage(
  
  fluidRow(
    column(3,
           autocomplete_input("auto1", "Unnamed:", opts, 
                              placeholder = " Search Value",
                              max_options = 1000),
           autocomplete_input("auto2", "Named:", 
                              placeholder = "Search Value",
                              max_options = 1000,
                              structure(opts, names = opts[order(opts)]))
    )
  )
)


server <-  function(input, output) {
}


shinyApp(ui, server)