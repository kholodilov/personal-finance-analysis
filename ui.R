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
        checkboxInput("all_categories", "All categories",
                      value = TRUE),
        selectInput("category", "Category:", 
                    choices=expense_categories)
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("expensesPlot")  
      )
      
    )
  )
)
