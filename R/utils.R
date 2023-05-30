#' Helper functions
#'
#' `skip_line()` skips line/s that match a regex
#'
#' @param x An input vector
#' @param regex A regular expression
#' @return A vector
#' @export skip_lines
#'
#' @examples
#' skip_lines(1:10, 1)
#' skip_lines(c('the', 'quick', 'thread', 'THREE'), '^th')
skip_lines <- function(x, regex = "^#"){
  wanted <- !grepl(pattern = regex, x = x, perl = TRUE)
  return(x[wanted])
}
