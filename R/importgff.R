#' Import GFF as a tibble
#'
#' `importgff()` reads GFF output and saves the contents in a tibble.
#'
#' Columns:
#'
#' * `seqname`: The name of the sequence; must be a chromosome or scaffold.
#' * `source`: The program that generated this feature.
#' * `feature`: The name of this type of feature, e.g. "CDS", "start_codon", "stop_codon", and "exon"
#' * `start`: The starting position of the feature in the sequence; the first base is numbered 1.
#' * `end`: The ending position of the feature (inclusive).
#' * `score`: A score between 0 and 1000.
#' * `strand`: Valid entries include "+", "-", or ".".
#' * `frame`: If the feature is a coding exon, frame should be a number between 0-2 that represents the reading frame of the first base. If the feature is not a coding exon, the value should be ".".
#' * `group`: All lines with the same group are linked together into a single item.
#'
#' @param infile GFF file to import
#' @param sep separator for group field
#' @param ... parameters to pass to importgftf
#'
#' @return A tibble
#' @export
#' @importFrom magrittr %>%
#' @import dplyr
#' @import tidyr
#'
#' @examples
#' importgff(system.file("extdata", "gencode.v38.annotation.sample.gff3.gz", package = "importbio"))
importgff <- function(infile, sep = "=", ...){
   importgftf(infile, sep, ...)
}
