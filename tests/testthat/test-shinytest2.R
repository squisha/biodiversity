library(shinytest2)

test_that("{shinytest2} recording: clear_search", {
  app <- AppDriver$new(name = "clear_search", height = 835, width = 899)
  app$set_inputs(sidebarId = FALSE)
  app$set_inputs(help_switch = TRUE)
  app$set_inputs(help_switch = FALSE)
  app$set_inputs(sidebarId = TRUE)
  app$set_inputs(side = character(0))
  app$expect_values()
})

