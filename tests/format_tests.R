source("format.R")

test_load_spendee_data <- function() {
  spendee_data <- load_spendee_data("tests/spendee_sample.csv")
  checkEquals(colnames(spendee_data), c("Date","Categories","Note","Value"))
}
