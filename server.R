library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$expensesPlot <- renderPlot({
    
    expenses_in_category <- filter_by_category(spendee_data$expenses, input$category)
    expenses_by_month <- aggregate_by_month(expenses_in_category, selected_months)
    
    # Render a barplot
    barplot(expenses_by_month$Value,
            names.arg = expenses_by_month$Month,
            main="Expenses by month",
            ylab="Expenses",
            xlab="Month")
  })

})
