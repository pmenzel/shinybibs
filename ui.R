library(shiny)
library(shinycssloaders)
library(shinyalert)
library(DT)


ui <- navbarPage("Shiny Bibs", id="nav",
        tabPanel("References",
                 fluidRow(
                   DT::dataTableOutput("dt_references")
                 )
        )
      )

