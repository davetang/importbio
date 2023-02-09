#' Import BLAST tabular output as a tibble
#'
#' `importblast()` reads a BLAST tab-delimited file (output format 6 or 7, where lines starting with a `#` are ignored) and saves the contents in a tibble.
#'
#' @param infile BLAST tab-delimited file to import
#'
#' @return A tibble
#' @export
#' @import readr
#'
#' @examples
#' importblast(system.file("extdata", "blastout.tsv.gz", package = "importbio"))
importblast <- function(infile){
  my_colnames <- c(
    "query",
    "subject",
    "perc_id",
    "aln_len",
    "mismatches",
    "gap_opens",
    "q_start",
    "q_end",
    "s_start",
    "s_end",
    "evalue",
    "bit_score"
  )

  my_coltypes <- list(
    query = "c",
    subject = "c",
    perc_id = "d",
    aln_len = "i",
    mismatches = "i",
    gap_opens = "i",
    q_start = "i",
    q_end = "i",
    s_start = "i",
    s_end = "i",
    evalue = "d",
    bit_score = "d"
  )

  read_tsv(
    file = infile,
    comment = "#",
    col_names = my_colnames,
    col_types = as.col_spec(unlist(my_coltypes))
  )
}
