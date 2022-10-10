library(shiny)
library(DT)
library(tidyverse)
library(shinyalert)
library(lubridate)
library(bib2df)
sink(stderr(), type = "output")

# --------------------------------------------------------------------------------------------------------------

fname_bibtex <- "/home/ptr/paperpile/thepile.bib"
dir_pds <- ""


server <- function(input, output, session) {

  df_references <- reactive({

  	df <- bib2df(fname_bibtex)
  	message(nrow(df))
    df %>% 
      select(BIBTEXKEY, YEAR, TITLE, AUTHOR)

  })

  # --------------------------------------------------------------------------------------------------------------------------------------

  output$dt_references <- DT::renderDataTable({
    df_references() %>%
      DT::datatable(selection = list(mode = "multiple"),
                    rownames = FALSE,
                    class = "compact hover",
                    options = list(pageLength = 50))
  })


}
