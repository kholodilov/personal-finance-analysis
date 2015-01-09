library(shiny)

source("format.R")
source("finance.R")

spendee_data <- load_spendee_data("/Users/dmitry/Dropbox/Documents/Spendee/Spendee_feed_from_2014-03-01_to_2015-01-08.csv")
expenses_by_month <- aggregate_by_month(spendee_data$expenses)

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