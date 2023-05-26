#' Import NetMHCIIpan output as a tibble
#'
#' `importnetmhciipan()` reads NetMHCIIpan output (default parameters) and saves the contents in a tibble.
#'
#' You will recieve a warning about parsing failures. This is because NetMHCIIpan output contains free text, e.g. Number of strong binders: 3 Number of weak binders: 5. This line is automatically removed but you will still receive a warning.
#'
#' Columns:
#'
#' * `pos`: Residue number (starting from 1)
#' * `mhc`: MHC molecule name
#' * `peptide`: Amino acid sequence
#' * `offset`: Starting position offset of the optimal binding core (starting from 0)
#' * `core`: Binding core register
#' * `core_rel`: Reliability of the binding core, expressed as the fraction of networks in the ensemble selecting the optimal core
#' * `id`: Annotation of the input sequence, if specified
#' * `score_el`: Eluted ligand prediction score
#' * `perc_rank_el`: Percentile rank of eluted ligand prediction score
#' * `exp_bind`: If the input was given in PEPTIDE format with an annotated affinity value (mainly for benchmarking purposes).
#' * `bind_level`: (SB: strong binder, WB: weak binder). The peptide will be identified as a strong binder if the % Rank is below the specified threshold for the strong binders. The peptide will be identified as a weak binder if the % Rank is above the threshold of the strong binders but below the specified threshold for the weak binders.
#'
#' @param infile NetMHCIIpan output file to import
#'
#' @return A tibble
#' @export
#' @import readr
#' @import dplyr
#'
#' @examples
#' importblast(system.file("extdata", "netmhciipan.out.gz", package = "importbio"))
importnetmhciipan <- function(infile){

  my_colnames <- c(
    "pos",
    "mhc",
    "peptide",
    "offset",
    "core",
    "core_rel",
    "id",
    "score_el",
    "perc_rank_el",
    "exp_bind",
    "bind_level"
  )

  my_coltypes <- list(
    pos = "i",
    mhc = "c",
    peptide = "c",
    offset = "i",
    core = "c",
    core_rel = "d",
    id = "c",
    score_el = "d",
    perc_rank_el = "d",
    exp_bind = "d",
    bind_level = "c"
  )

  start <- min(grep("^\\s+\\d+", readr::read_lines(infile)))

  read_table(
    file = infile,
    comment = "-",
    skip = start - 1,
    col_names = my_colnames,
    col_types = as.col_spec(unlist(my_coltypes))
  ) %>%
    filter(!is.na(pos))
}
