#' Real-Time Rail Predictions
#'
#' Real-time rail prediction methods.
#'
#' @name real-time-rail-predictions
#' @references \url{https://developer.wmata.com/docs/}
NULL

#' @describeIn real-time-rail-predictions Returns next train arrival information for one or more stations. Will return an empty set of results when no predictions are available. Use All for the StationCodes parameter to return predictions for all stations.
#'
#' @param station_codes  Character vector of station codes. For all predictions, use "All".
#' @export
next_trains <- function(station_codes) {
  station_codes <- paste(station_codes, collapse = ",")
  basepath <- "StationPrediction.svc/json/GetPrediction"
  path <- paste(basepath, station_codes, sep = "/")
  wmata_api(path)
}

