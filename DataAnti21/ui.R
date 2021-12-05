#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)
library(shinyWidgets)
library(shinythemes)
library(plotly)


# Outcomes SANCIONADOS
san = data.frame(
  var = colnames(df_sancionados[2:13]),
  num = 1:12
)

outcomes_list <- as.list(san$num)



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  #theme = shinytheme("flatly"),
  theme = bs_theme(version = 4, bootswatch = "flatly"),

    # Application title
    titlePanel("Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),
        # Show a plot of the generated distribution
        mainPanel(
           # plotOutput("distPlot"),
            plotlyOutput("distPlot"),
            h4("Resultados"),
            tableOutput("df_sancionados")
              
        )
    )
))
