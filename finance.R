aggregate_by_month <- function(data) {
  aggregated <- aggregate(data$Value, by=list(strftime(data$Date, "%Y-%m")), FUN=sum)
  names(aggregated) <- c("Month", "Value")
  aggregated
}

categories <- function(data) {
  sort(sapply(unique(data$Category), as.character))
}

filter_by_category <- function(data, category) {
  subset(data, Category == category)
}
