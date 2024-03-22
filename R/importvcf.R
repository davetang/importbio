#' Import VCF as tibble
#'
#' `importvcf()` reads VCF output and saves the contents in a tibble.
#'
#' See [Learning the Variant Call Format](https://github.com/davetang/learning_vcf_file) for more information.
#'
#' @param infile VCF to import
#'
#' @return A tibble
#' @export
#' @importFrom magrittr %>%
#' @import dplyr
#'
#' @examples
#' importvcf(system.file("extdata", "Pfeiffer.vcf.gz", package = "importbio"))
importvcf <- function(infile){
  readr::read_tsv(
    file = infile,
    col_types = readr::cols(.default = "c"),
    comment = "##"
  ) %>%
    dplyr::rename("CHROM" = "#CHROM") %>%
    dplyr::mutate(
      type = case_when(
        nchar(REF) == 1 & nchar(ALT) == 1 ~ "snv",
        nchar(REF) > 1 & nchar(ALT) == 1 ~ "del",
        nchar(REF) == 1 & nchar(ALT) > 1 ~ "ins",
        nchar(REF) > 1 & nchar(ALT) > 1 & nchar(REF) == nchar(ALT) ~ "complex")
    ) %>%
    dplyr::mutate(CHROM = factor(CHROM), POS = as.integer(POS), type = factor(type)) %>%
    dplyr::mutate(vid = paste(.data$CHROM, .data$POS, .data$REF, .data$ALT, sep = "_")) %>%
    dplyr::select(.data$vid, tidyselect::everything())
}
