library(shiny)

shinyServer(function(input, output) {
  
  output$expensesPlot <- renderPlot({
    
    expenses <- if (input$all_categories) { spendee_data$expenses }
                else { filter_by_category(spendee_data$expenses, input$category) }
    expenses_by_month <- aggregate_by_month(expenses, selected_months)
    
    output <- rbind(expenses_by_month$Value)
    if (input$show_incomes) {
      incomes_by_month <- aggregate_by_month(spendee_data$incomes, selected_months)
      output <- rbind(incomes_by_month$Value, output)
    }

    if (input$show_savings) {
      savings_by_month <- aggregate_by_month(spendee_data$savings, selected_months)
      output <- rbind(output, savings_by_month$Value)
    }
    
    barplot(output,
            names.arg = selected_months,
            main="Value by month",
            ylab="Value",
            xlab="Month",
            beside=TRUE)
  })
  
})
