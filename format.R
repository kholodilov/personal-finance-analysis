load_spendee_data <- function(file_path) {
  spendee_feed <- read.delim(file_path, header=T,sep=",")
  names(spendee_feed)<-c("Date", "Category", "Comment", "Value")
  spendee_feed$Date <- as.Date(spendee_feed$Date, format="%b %d, %Y")
  incomes <- subset(spendee_feed, Value > 0)
  expenses_and_savings <- subset(spendee_feed, Value < 0)
  expenses_and_savings$Value <- (-expenses_and_savings$Value)
  expenses <- subset(expenses_and_savings, Category != "Savings")
  savings <- subset(expenses_and_savings, Category == "Savings")
  list(incomes = incomes, expenses = expenses, savings = savings)
}
