#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(stringr)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Outcomes SANCIONADOS
    san = data.frame(
      var = colnames(df_sancionados[2:13]),
      num = 1:12
    )
  
    outcomes_list <- as.list(san$num)
    
    names(outcomes_list) <- san$var
    
    ordered_query <- function(dataframe, colnum, ascending){
      newdata <- dataframe[!is.na(dataframe[[colnum]]),] 
      if(ascending == TRUE)
      {
        #Ascending
        acc <- newdata[order(newdata[[colnum]]),]
      }else{
        #Descending
        acc <- newdata[order(-newdata[[colnum]]),]
      }
      return(acc)
    }
    
    ###DEMO
  
  
    output$view <- renderTable({
      top_ordered_query(df_sancionados)
    })
    
        # generate bins based on input$bins from ui.R
       # x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
      #  hist(x, breaks = bins, col = 'darkgray', border = 'white')

   # })

})
