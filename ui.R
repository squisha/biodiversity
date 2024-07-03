
library(shinyjs)
library(dplyr)
library(shinycssloaders)
library(shinyauthr)
library(shinyWidgets)
library(bs4Dash)
library(reactable)
library(fresh)



options(spinner.color="#0275D8", spinner.color.background="#ffffff", spinner.size=2)
options(digits=10)

source("map.R", local=T)
source("sidebar.R", local=T)
source("table.R", local=T)


shinyUI(dashboardPage(
  fullscreen = TRUE,
  help = NULL,
  title = "Bio Diversity",
  header = dashboardHeader(
    skin='dark',
    title =  dashboardBrand(
      title = "Marketing",
      color = "white",
      image = "https://play-lh.googleusercontent.com/oGungDhFuHgenpkPMAlYomWe4hC5JNKZlYPYKueuuBir9QyrmYXZYnIffjb_DDiUuQQ"
    )),
  sidebar = dashboardSidebar(uiOutput("reactive_sidebar")),
  controlbar = NULL,
  body = dashboardBody(
    use_theme(create_theme(bs4dash_layout(sidebar_width = "425px"))),
    useShinyjs(),
    tags$script(
      "
        $(document).ready(function() {
            var el = $('#text');
            el.on('shiny:recalculated', function(e){
                setTimeout(function() {
                     el.scrollTop(el.prop('scrollHeight'));
                }, 400)
            });
        });
        "
    ),
    fluidRow(tabBox(
      width = 12,
      solidHeader = FALSE,
      collapsible = TRUE,
      maximizable=TRUE,
      type="tabs",
      elevation = 2,
      height = '50%',
      tabPanel(
        title = "Map",
        mapUI("BioMap"))
    )),
    fluidRow(tabBox(
      width = 12,
      solidHeader = FALSE,
      collapsible = TRUE,
      maximizable=TRUE,
      type="tabs",
      elevation = 2,
      height = '100%',
      tabPanel(
        title = "Data",
        tabeUI("BioTabe")
                    
      )
    ),
    div(id = "noselect", style = "position: absolute; bottom: 0; right: 0;"))
    
  )
))