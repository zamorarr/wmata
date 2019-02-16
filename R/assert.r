assert_is_line_code <- function(x) {
  codes <- c("RD", "YL", "GR", "BL", "OR", "SV")
  if (!(x %in% codes)) {
    stop(paste("line code should be one of" , paste(codes, collapse = ",")), call. = FALSE)
  }
}
