library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Salary Projections"),
  
  sidebarLayout(
    
    sidebarPanel(
      
#       nYears=20
#       baseSalary=100000
#       stayRaise=2
#       promotionYears=6
#       promotionRaise=5
#       jumpYears=3
#       jumpRaise=10
#       inflation=2.5
      
      numericInput("nYears", 
                   label = "Number of Years", 
                   value = 20),
      numericInput("baseSalary", 
                   label = "Starting Salary($)", 
                   value = 100000),
      numericInput("stayRaise", 
                   label = "Yearly Raise (%)", 
                   value = 2),
      numericInput("promotionYears", 
                   label = "Number of Years for Promotion", 
                   value = 6),
      numericInput("promotionRaise", 
                   label = "Promotion Raise (%)", 
                   value = 5),
      numericInput("jumpYears", 
                   label = "Years Between Job Changes", 
                   value = 3),
      numericInput("jumpRaise", 
                   label = "Raise for Changing Jobs (%)", 
                   value = 10),
      checkboxInput("useInflation",
                    label = "Include Inflation"),
      numericInput("inflation", 
                   label = "Inflation (%)", 
                   value = 2.5)
      
      
    ),
    
    mainPanel(
      plotOutput("salaryChart")
      
    )
    
  )
  
))
  
  
  