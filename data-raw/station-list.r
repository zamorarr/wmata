library(dplyr)
library(purrr)
library(tibble)

# get station list
j <- station_list()

# parse data to a data frame
stations <- map_dfr(j$Stations, function(x) {
  # make sure nested lists are treated as lists
  x <- modify_if(x, ~ length(.x) > 1, list)

  # convert nulls to NAs
  x <- modify_if(x, is.null, ~ NA)

  # convert list to data frame
  as_tibble(x)
})

# fix columns
stations <- stations %>%
  mutate_at(vars(starts_with("StationTogether")), ~ if_else(.x == "", NA_character_, .x))

# save data
usethis::use_data(stations, overwrite = TRUE)
