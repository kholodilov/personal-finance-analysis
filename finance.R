aggregate_by_month <- function(data, months) {
  aggregated <- aggregate(data$Value, by=list(strftime(data$Date, "%Y-%m")), FUN=sum)
  names(aggregated) <- c("Month", "Value")
  # filter data by months - add missing in data, remove missing in months
  merged <- merge(aggregated, expand.grid(Month = months), all.y = TRUE)
  merged[is.na(merged)] <- 0
  merged
}

categories <- function(data) {
  sort(sapply(unique(data$Category), as.character))
}

filter_by_category <- function(data, category) {
  subset(data, Category == category)
}
