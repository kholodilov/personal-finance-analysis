source("format.R")

test_load_spendee_data <- function() {
  spendee_data <- load_spendee_data("tests/spendee_sample.csv")
  
  checkEquals(nrow(spendee_data$incomes), 1)
  checkEquals(nrow(spendee_data$expenses), 4)
  checkEquals(nrow(spendee_data$savings), 1)
  
  checkEquals(spendee_data$incomes[1,"Date"], as.Date("2014-03-04"))
}
