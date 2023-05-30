#' Import BLAST tabular output as a tibble
#'
#' `importblast()` reads a BLAST tab-delimited file (output format 6 or 7, where lines starting with a `#` are ignored) and saves the contents in a tibble.
#'
#' Columns:
#'
#' * `query`: query or source (gene) sequence id
#' * `subject`: subject or target (reference genome) sequence id
#' * `perc_id`: percentage of identical positions
#' * `aln_len`: alignment length (sequence overlap)
#' * `mismatches`: number of mismatches
#' * `gap_opens`: number of gap openings
#' * `q_start`: start of alignment in query
#' * `q_end`: end of alignment in query
#' * `s_start`: start of alignment in subject
#' * `s_end`: end of alignment in subject
#' * `evalue`: The BLAST E-value is the number of expected hits of similar quality (score) that could be found just by chance.
#' * `bit_score`: bit score; The higher the bit-score, the better the sequence similarity. The bit-score is the requires size of a sequence database in which the current match could be found just by chance. The bit-score is a log2 scaled and normalised raw-score.
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
