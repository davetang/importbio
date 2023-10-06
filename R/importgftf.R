#' Import GFF/GTF as a tibble
#'
#' `importgftf()` reads GFF/GTF output and saves the contents in a tibble.
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
#' @param infile GFF/GTF file to import
#' @param sep separator for group field
#' @param keep_feature specify feature to keep
#'
#' @return A tibble
#' @export importgftf
#' @importFrom magrittr %>%
#' @import dplyr
#' @import tidyr
#'
#' @examples
#' importgftf(system.file("extdata", "gencode.v38.annotation.sample.gtf.gz", package = "importbio"),
#'            sep="\\s")
importgftf <- function(infile, sep, keep_feature = "*"){
  my_colnames <- c(
    "seqname",
    "source",
    "feature",
    "start",
    "end",
    "score",
    "strand",
    "frame",
    "group"
  )
  my_coltypes <- readr::cols_only(
    seqname = "f",
    source = "c",
    feature = "c",
    start = "i",
    end = "i",
    score = "c",
    strand = "c",
    frame = "c",
    group = "c"
  )

  readr::read_tsv(
    file = infile,
    col_names = my_colnames,
    col_types = my_coltypes,
    comment = "#"
  ) %>%
    filter(grepl(keep_feature, feature)) %>%
    mutate(group = sub(pattern = ";$", replacement = "", x = .data$group)) %>%
    separate_rows(.data$group, sep = ";\\s*") %>%
    separate(.data$group, c('key', 'value'), sep = sep) %>%
    mutate(value = gsub(pattern = "\"", replacement = "", x = .data$value)) %>%
    distinct() %>%
    pivot_wider(id_cols = my_colnames[1:8], names_from = .data$key, values_from = .data$value, values_fn = list)
}
