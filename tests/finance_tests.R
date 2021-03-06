source("finance.R")

test_aggregate_by_month <- function() {
  Date <- c(as.Date("2014-03-01"), as.Date("2014-03-02"), as.Date("2014-05-01"), as.Date("2014-06-01"))
  Value <-c(50, 100, 200, 300)
  data <- data.frame(Date, Value)
  
  aggregated <- aggregate_by_month(data, c("2014-03", "2014-04", "2014-05"))
  
  checkEquals(nrow(aggregated), 3) # 2014-06 is absent
  checkEquals(aggregated[1,"Month"], "2014-03")
  checkEquals(aggregated[1,"Value"], 150)
  checkEquals(aggregated[2,"Month"], "2014-04")
  checkEquals(aggregated[2,"Value"], 0)
  checkEquals(aggregated[3,"Month"], "2014-05")
  checkEquals(aggregated[3,"Value"], 200)
}

test_categories <- function() {
  Category <- c("c1", "c2", "c3", "c2", "c3", "c0")
  data <- data.frame(Category)
  
  categories <- categories(data)
  
  checkEquals(categories, c("c0", "c1", "c2", "c3"))
}

test_filter_by_category <- function() {

  Category <- c("c1", "c2", "c3", "c2")
  Value    <- c(50,   100,  200,  300)
  data <- data.frame(Category, Value)
  
  filtered <- filter_by_category(data, "c2")
  
  checkEquals(nrow(filtered), 2)
  checkEquals(as.character(filtered[1,"Category"]), "c2")
  checkEquals(filtered[1,"Value"], 100)
  checkEquals(as.character(filtered[2,"Category"]), "c2")
  checkEquals(filtered[2,"Value"], 300)
}
