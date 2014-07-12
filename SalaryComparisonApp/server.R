library(shiny)
library(ggplot2)
library(reshape)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$salaryChart <- renderPlot({

    if (input$useInflation) {
      inflation = input$inflation
      title="Salary Projection (Present Purchasing Power)"
      
    }
    else {
      inflation = 0
      title="Salary Projection (Future Dollars)"
    }
    
  data <- raiseCompare(input$nYears,
                       input$baseSalary,
                       input$stayRaise,
                       input$promotionYears,
                       input$promotionRaise,
                       input$jumpYears,
                       input$jumpRaise,
                       inflation)
  
  newdata=melt(data,id='year',variable_name='Action')
  qplot(year,value,data=newdata,geom="line",color=Action,main=title,size=I(1.5))
  })
  
})
