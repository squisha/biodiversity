
sideUI <- function(id, data) {
  
  ns <- NS(id)
  
  sci_choices <- stringr::str_wrap(unique(data$scientificName), width = 40)
  sci_choices2 <- stringr::str_replace_all(sci_choices, "\\n", "<br>")
  
  vern_choices <- stringr::str_wrap(unique(data$vernacularName), width = 40)
  vern_choices2 <- stringr::str_replace_all(vern_choices, "\\n", "<br>")
  
  sidebarMenu(


  tags$script(HTML(
    "var CONTROL_INTERVAL = setInterval(function(){ 
            if($('#searchme').length > 0 ){
                  $('#searchme').on('show.bs.select', function(){
                      var input = $('.bootstrap-select:has(select[id=\"searchme\"]) .bs-searchbox > input');
                      var opts = $(this).parent().find('div[role=\"listbox\"] ul li');
                      var opts0 = $(this).parent().find('div[role=\"listbox\"]');
                      opts.hide();
                      opts0.hide();
                      
                      input.on('input', function(e){
                          if ($(this).val() !== \"\") {opts.show(); opts0.show();}
                          else {opts.hide(); opts0.hide();}
                      });
                  });
                  
    clearInterval(CONTROL_INTERVAL);
    }}, 200);
      "
  )),
  
  tags$style(HTML(".bs-select-all {display: none;}
          .bs-deselect-all {width: 100% !important;}")),
  pickerInput(
    inputId = id,
    label = "Search",
    choices = list(
      `Scientific Name` = sci_choices,
      `Vernacular Name` = vern_choices
    ),
    multiple = TRUE,
    options = pickerOptions(title = "Search",
                            `live-search` = TRUE,
                            actionsBox = TRUE,
                            deselectAllText = "Clear Search",
                            ),
    choicesOpt = list(
      content = c(sci_choices2,
                     vern_choices2)
    )
    )
  )
}
