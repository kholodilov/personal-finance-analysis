source("format.R")
source("finance.R")

selected_months <- c("2014-03", "2014-04", "2014-05", "2014-06", "2014-07", "2014-08", "2014-09", "2014-10", "2014-11", "2014-12")

spendee_data <- load_spendee_data("/Users/dmitry/Dropbox/Documents/Spendee/Spendee_feed_from_2014-03-01_to_2015-01-08.csv")
expense_categories <- categories(spendee_data$expenses)
