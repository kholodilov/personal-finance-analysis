library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Personal finance reports"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      sidebarPanel(
        checkboxInput("all_categories", "All expense categories",
                      value = TRUE),
        selectInput("category", "Expense category:", 
                    choices=expense_categories),
        checkboxInput("show_savings", "Savings",
                      value = FALSE),
        checkboxInput("show_incomes", "Incomes",
                      value = FALSE)        
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("expensesPlot"),
        plotOutput("savingsPlot"),
        plotOutput("incomesPlot")
      )
      
    )
  )
)
