#' Import VCF as tibble
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
  my_colnames <- c("chrom", "pos", "id", "ref", "alt", "qual", "filter", "info")
  my_coltypes <- readr::cols_only(chrom = "f",
                                  pos = "i",
                                  id = "c",
                                  ref = "c",
                                  alt = "c",
                                  qual = "d",
                                  filter = "c",
                                  info = "c")

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
