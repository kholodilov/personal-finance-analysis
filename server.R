library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$expensesPlot <- renderPlot({
    
    data <- aggregate_by_month(filter_by_category(spendee_data$expenses, input$category))
    
    # Render a barplot
    barplot(data$Value,
            names.arg = data$Month,
            main="Expenses by month",
            ylab="Expenses",
            xlab="Month")
  })

})
