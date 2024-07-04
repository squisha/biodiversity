
library(shinyjs)
library(dplyr)
library(shinyWidgets)
library(bs4Dash)
library(reactable)
library(fresh)



#options(spinner.color="#0275D8", spinner.color.background="#ffffff", spinner.size=2)
#options(digits=10)

#source("map.R", local=T)
#source("sidebar.R", local=T)
#source("table.R", local=T)
#source("footer.R", local=T)$value

shinyUI(dashboardPage(
  fullscreen = TRUE,
  help = FALSE,
  title = "Bio Diversity",
  header = dashboardHeader(
    skin='dark',
    title =  dashboardBrand(
      title = "Bio Diversity",
      color = "white",
      image = "bio-logo.png"
    )
  ),
  sidebar = dashboardSidebar(), 
  #dashboardSidebar(uiOutput("reactive_sidebar")),
  controlbar = NULL,
  body = dashboardBody(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    use_theme(create_theme(bs4dash_layout(sidebar_width = "425px"))),
    #useShinyjs(),
    #fluidRow(tabBox(
     # width = 12,
      #solidHeader = FALSE,
      #collapsible = TRUE,
      #maximizable=TRUE,
      #type="tabs",
      #elevation = 2,
      #height = '50%',
      #tabPanel(
       # title = "Map"
        #mapUI("BioMap")
        #)
  #  )
  #),
    #fluidRow(tabBox(
     # width = 12,
      #solidHeader = FALSE,
      #collapsible = TRUE,
      #maximizable=TRUE,
      #type="tabs",
      #elevation = 2,
      #height = '100%',
      #tabPanel(
        #title = "Data"
        #tabeUI("BioTabe")
                    
     # )
    #)#,
    #div(id = "noselect", style = "position: absolute; bottom: 0; right: 0;")
    #)
  )
))