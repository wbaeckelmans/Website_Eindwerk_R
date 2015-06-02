
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("The Reporting Tool Selection Model"),

  # The layout
  fixedRow(
    column(9,
       radioButtons("data",label = "Data", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       radioButtons("visualisatie",label = "Visualisation", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       radioButtons("price",label = "Price", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       radioButtons("self",label = "Self-service", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       radioButtons("predictive",label = "Predictive Analytics", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       radioButtons("mobile",label = "Mobile", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       radioButtons("colla",label = "Collaboration", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       radioButtons("security",label = "Security", list("Onbelangrijk", "Minder belangrijk", "Neutraal", "Belangrijk", "Zeer belangrijk"), "", inline = TRUE),
       
       fixedRow(
             column(3,
                    "Advies van het model",
                    textOutput("MyChoice1"),
                    textOutput("MyChoice2"),
                    textOutput("MyChoice3"),
                    textOutput("MyChoice4"),
                    textOutput("MyChoice5"),
                    textOutput("MyChoice6"),
                    textOutput("MyChoice7"),
                    textOutput("MyChoice8")
             ),
             column(6,
                    "Radar charts"
             )
           )
    )
  )
)
)