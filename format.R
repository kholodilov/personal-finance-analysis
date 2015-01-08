load_spendee_data <- function(file_path) {
  spendee_feed <- read.delim(file_path, header=T,sep=",")
  spendee_feed$Date <- as.Date(spendee_feed$Date, format="%b %d, %Y")
  spendee_feed
}