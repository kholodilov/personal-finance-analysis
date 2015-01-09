source("format.R")
source("finance.R")

spendee_data <- load_spendee_data("/Users/dmitry/Dropbox/Documents/Spendee/Spendee_feed_from_2014-03-01_to_2015-01-08.csv")
expense_categories <- categories(spendee_data$expenses)
