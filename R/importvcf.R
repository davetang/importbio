#' Import VCF as tibble
#'
#' `importvcf()` reads VCF output and saves the contents in a tibble. Note that this function (currently) only saves the genomic information and not the genotype of samples that may be present.
#'
#' See [Learning the Variant Call Format](https://github.com/davetang/learning_vcf_file) for more information.
#'
#' @param infile VCF to import
#' @param skip_info Boolean for whether to store the INFO column
#'
#' @return A tibble
#' @export
#' @importFrom magrittr %>%
#' @import dplyr
#'
#' @examples
#' importvcf(system.file("extdata", "Pfeiffer.vcf.gz", package = "importbio"))
importvcf <- function(infile, skip_info=FALSE){
  my_colnames <- c("chrom", "pos", "id", "ref", "alt", "qual", "filter")
  my_coltypes <- readr::cols_only(
    chrom = "f",
    pos = "i",
    id = "c",
    ref = "c",
    alt = "c",
    qual = "c",
    filter = "c"
  )

  if(skip_info == FALSE){
    my_colnames <- c(my_colnames, 'info')
    my_colinfo <- readr::cols_only(info = "c")
    my_coltypes <- c(my_coltypes$cols, my_colinfo$cols)
  }

  readr::read_tsv(
    file = infile,
    col_names = FALSE,
    col_types = readr::cols(.default = "c"),
    comment = "#"
  ) %>%
    select(1:length(my_colnames)) -> my_vcf

  colnames(my_vcf) <- my_colnames

  my_vcf %>%
    readr::type_convert(col_types = my_coltypes) %>%
    mutate(
      type = case_when(
        nchar(ref) == 1 & nchar(alt) == 1 ~ "snv",
        nchar(ref) > 1 & nchar(alt) == 1 ~ "del",
        nchar(ref) == 1 & nchar(alt) > 1 ~ "ins",
        nchar(ref) > 1 & nchar(alt) > 1 & nchar(ref) == nchar(alt) ~ "complex")
    ) %>%
    mutate(vid = paste(.data$chrom, .data$pos, .data$ref, .data$alt, sep = "_")) %>%
    select(.data$vid, tidyselect::everything())
}
