#' WMATA API
#'
#' Make request to WMATA API.
#'
#' @param path path to endpoint
#' @keywords internal
wmata_api <- function(path, query = NULL) {
  stopifnot(length(path) == 1L)

  baseurl <- "https://api.wmata.com"
  url <- httr::modify_url(baseurl, path = path, query = query)

  # get api key
  api_key <- Sys.getenv("WMATA_KEY")
  if (nchar(api_key) == 0) {
    msg <- paste("You must put your WMATA API key in your .Renviron file.",
                 "It should look like this.\n",
                 "WMATA_KEY=XXXXXXXX")
    stop(msg, call. = FALSE)
  }

  # build headers
  request <- httr::add_headers(
    "api_key" = api_key,
    "Content-Type" = "application/json",
    "Accept" = "application/json")

  # get response
  response <- httr::GET(url, request)

  # check response type
  if (httr::http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  # parse content
  content <- httr::content(response, "text", encoding = "UTF-8")
  json <- jsonlite::fromJSON(content, simplifyVector = FALSE)

  # check errors
  if (httr::http_error(response)) {
    stop(
      sprintf(
        "%s\nWMATA API request failed [%s]\n%s\n",
        url,
        httr::status_code(response),
        json$message
      ),
      call. = FALSE
    )
  }

  # return object
  new_wmata(json, path)
}

#' Create a new wmata object
#' @param json list data from json api
#' @param path path to location of data
#' @keywords internal
new_wmata <- function(json, path) {
  class(json) <- c("wmata_api", class(json))
  attr(json, "path") <- path
  json
}

#' @export
print.wmata_api <- function(x, ...) {
  cat("<wmata ", attr(x, "path"), ">\n", sep = "")
  utils::str(x, 2, give.attr = FALSE)
  invisible(x)
}
