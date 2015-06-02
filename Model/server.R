
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(pmr)

shinyServer(function(input, output) {
# Omzetten input naar numerieke waarden 
  data <- reactive({
  if(input$data == "Onbelangrijk") {
    data <- 1
  } else if (input$data == "Minder belangrijk") {
    data <- 3
  } else if (input$data == "Neutraal") {
    data <- 5
  } else if (input$data == "Belangrijk") {
    data <- 7
  } else {
    data <- 9
  } })
  
  visualisatie <- reactive({
    if(input$visualisatie == "Onbelangrijk") {
      visualisatie <- 1
    } else if (input$visualisatie == "Minder belangrijk") {
      visualisatie <- 3
    } else if (input$visualisatie == "Neutraal") {
      visualisatie <- 5
    } else if (input$visualisatie == "Belangrijk") {
      visualisatie <- 7
    } else {
      visualisatie <- 9
    } })
  
  price <- reactive({
    if(input$price == "Onbelangrijk") {
      price <- 1
    } else if (input$price == "Minder belangrijk") {
      price <- 3
    } else if (input$price == "Neutraal") {
      price <- 5
    } else if (input$price == "Belangrijk") {
      price <- 7
    } else {
      price <- 9
    } })
  
  self <- reactive({
    if(input$self == "Onbelangrijk") {
      self <- 1
    } else if (input$self == "Minder belangrijk") {
      self <- 3
    } else if (input$self == "Neutraal") {
      self <- 5
    } else if (input$self == "Belangrijk") {
      self <- 7
    } else {
      self <- 9
    } })
  
  pre <- reactive({
    if(input$predictive== "Onbelangrijk") {
      pre <- 1
    } else if (input$predictive == "Minder belangrijk") {
      pre <- 3
    } else if (input$predictive == "Neutraal") {
      pre <- 5
    } else if (input$predictive == "Belangrijk") {
      pre <- 7
    } else {
      pre <- 9
    } })
  
  mobile <- reactive({
    if(input$mobile == "Onbelangrijk") {
      mobile <- 1
    } else if (input$mobile == "Minder belangrijk") {
      mobile <- 3
    } else if (input$mobile == "Neutraal") {
      mobile <- 5
    } else if (input$mobile == "Belangrijk") {
      mobile <- 7
    } else {
      mobile <- 9
    } })
  
  colla <- reactive({
    if(input$colla == "Onbelangrijk") {
      colla <- 1
    } else if (input$colla == "Minder belangrijk") {
      colla <- 3
    } else if (input$colla == "Neutraal") {
      colla <- 5
    } else if (input$colla == "Belangrijk") {
      colla <- 7
    } else {
      colla <- 9
    } })
  
  security <- reactive({
    if(input$security == "Onbelangrijk") {
      security <- 1
    } else if (input$security == "Minder belangrijk") {
      security <- 3
    } else if (input$security == "Neutraal") {
      security <- 5
    } else if (input$security == "Belangrijk") {
      security <- 7
    } else {
      security <- 9
    } })
# ---------------------------------------------------->
  
# Building the matrix
  criteria <- c(data, visualisatie, price, self, pre, mobile, colla, security)
  MATR <- matrix(criteria, nrow = 8, ncol = 8)
  MATR2 <- MATR; for(i in seq_len(nrow(MATR2))) MATR2[i, ] <- MATR2[i, ] / criteria

  headers <- c("Data", "Visualisation", "Price", "Self-service", "Predictive Analytics", "Mobile", "Collaboration", "Security")
  dimnames(MATR2) = list(headers, headers)
# --------------------------------------------------->

# Toepassen AHP en berekenen gewogen scores criteria
  
  ahp_criteria <- ahp(MATR2)
  gewscores_criteria <- ahp_criteria$weighting
  gewscores_criteria <- round(gewscores_criteria, digits = 2)
  
  gewscore_data <- gewscores_criteria[1]
  gewscore_vis <- gewscores_criteria[2]
  gewscore_price <- gewscores_criteria[3]
  gewscore_self <- gewscores_criteria[4]
  gewscore_pre <- gewscores_criteria[5]
  gewscore_mobi <- gewscores_criteria[6]
  gewscore_colla <- gewscores_criteria[7]
  gewscore_secur <- gewscores_criteria[8]
# ---------------------------------------------------->
  output$MyChoice1 <- data
  output$MyChoice2 <- visualisatie
  output$MyChoice3 <- price
  output$MyChoice4 <- self
  output$MyChoice5 <- pre
  output$MyChoice6 <- mobile
  output$MyChoice7 <- colla
  output$MyChoice8 <- security
})
