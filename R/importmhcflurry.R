#' Import mhcflurry-predict output as a tibble
#'
#' `importmhcflurry()` reads the CSV predictions from `mhcflurry-predict` and saves the contents in a tibble.
#'
#' Columns:
#'
#' * `id`: identifier.
#' * `allele`: HLA allele.
#' * `peptide`: peptide sequence.
#' * `mhcflurry_affinity`: binding affinity predictions as affinities (KD) in nM; lower values indicate stronger binders and a commonly-used threshold for peptides with a reasonable chance of being immunogenic is 500 nM.
#' * `mhcflurry_affinity_percentile`: the percentile of the affinity prediction among a large number of random peptides tested on that allele (range 0 - 100). Lower is stronger. Two percent is a commonly-used threshold.
#' * `mhcflurry_processing_score`: antigen processing score, which range from 0 to 1 with higher values indicating more favourable processing. The processing predictor is experimental.
#' * `mhcflurry_presentation_score`: antigen presentation score, which range from 0 to 1 with higher values indicating more favourable presentation.
#' * `mhcflurry_presentation_percentile`: this is not officially documented; should be the percentile of the presentation score among a large number of random peptides.
#'
#' @param infile `mhcflurry-predict` csv-delimited file to import
#'
#' @return A tibble
#' @export
#' @import readr
#'
#' @examples
#' importmhcflurry(system.file("extdata", "mhcflurry.pred.csv.gz", package = "importbio"))
importmhcflurry <- function(infile){
  my_colnames <- c(
    "id",
    "allele",
    "peptide",
    "mhcflurry_affinity",
    "mhcflurry_affinity_percentile",
    "mhcflurry_processing_score",
    "mhcflurry_presentation_score",
    "mhcflurry_presentation_percentile"
  )

  my_coltypes <- list(
    id = "c",
    allele = "c",
    peptide = "c",
    mhcflurry_affinity = "d",
    mhcflurry_affinity_percentile = "d",
    mhcflurry_processing_score = "d",
    mhcflurry_presentation_score = "d",
    mhcflurry_presentation_percentile = "d"
  )

  read_csv(
    file = infile,
    comment = "#",
    skip = 1,
    col_names = my_colnames,
    col_types = as.col_spec(unlist(my_coltypes))
  )
}
