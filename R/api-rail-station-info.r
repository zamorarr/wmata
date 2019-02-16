#' Rail Station Information
#'
#' Rail line and station information, including locations, fares, times, and parking.
#'
#' @name rail-station-information
#' @references \url{https://developer.wmata.com/docs/}
NULL


#' @describeIn rail-station-information Returns a list of station location and address information based on a given LineCode.
#' Omit the LineCode to return all stations. The response is an array of objects
#' identical to those returned in the Station Information method.
#'
#' @param line_code Two-letter line code abbreviation (optional)
#' @export
station_list <- function(line_code = NULL) {
  if (!is.null(line_code)) {
    assert_is_line_code(line_code)
  }

  path <- "Rail.svc/json/jStations"
  query <- list(LineCode = line_code)
  wmata_api(path, query)
}

#' @describeIn rail-station-information Returns opening and scheduled first/last
#' train times based on a given StationCode. Omit the StationCode to return
#' timing information for all stations. Note that for stations with multiple
#' platforms (e.g.: Metro Center, L'Enfant Plaza, etc.), a distinct call is
#' required for each StationCode to retrieve the full set of train times at
#' such stations.
#'
#' @param station_code Station code. Use the Station List method to return a list of all station codes. (optional)
#' @export
station_timings <- function(station_code = NULL) {
  path <- "Rail.svc/json/jStationTimes"
  query <- list(StationCode = station_code)
  wmata_api(path, query)
}
