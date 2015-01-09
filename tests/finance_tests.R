source("finance.R")

test_aggregate_by_month <- function() {
  Date <- c(as.Date("2014-03-01"), as.Date("2014-03-02"), as.Date("2014-04-01"), as.Date("2014-05-01"))
  Value <-c(50, 100, 200, 300)
  data <- data.frame(Date, Value)
  
  aggregated <- aggregate_by_month(data)
  
  checkEquals(nrow(aggregated), 3)
  checkEquals(aggregated[1,"Month"], "2014-03")
  checkEquals(aggregated[1,"Value"], 150)
  checkEquals(aggregated[2,"Month"], "2014-04")
  checkEquals(aggregated[2,"Value"], 200)
  checkEquals(aggregated[3,"Month"], "2014-05")
  checkEquals(aggregated[3,"Value"], 300)
}

test_categories <- function() {
  Category <- c("c1", "c2", "c3", "c2", "c3", "c0")
  data <- data.frame(Category)
  
  categories <- categories(data)
  
  checkEquals(categories, c("c0", "c1", "c2", "c3"))
}
