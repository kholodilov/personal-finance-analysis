library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$expensesPlot <- renderPlot({
    
    # Render a barplot
    barplot(expenses_by_month$Value,
            names.arg = expenses_by_month$Month,
            main="Expenses by month",
            ylab="Expenses",
            xlab="Month")
  })

})
