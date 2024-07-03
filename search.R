
searchUI <- function(id) {
  ns <- NS(id)
  
  dashboardSidebar(


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
    label = "Search Bar",
    choices = paste0(LETTERS,sample(LETTERS, 26)),
    multiple = TRUE,
    options = pickerOptions(title = "Search Me",
                            `live-search` = TRUE,
                            actionsBox = TRUE,
                            deselectAllText = "Clear Search"))
  )
  }