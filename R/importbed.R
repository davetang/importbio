#' Import BED as a tibble
#'
#' @param infile BED file to import
#'
#' @return A tibble
#' @export
#' @importFrom magrittr %>%
#' @import readr
#'
#' @examples
#' importbed(system.file("extdata", "refseq.bed.gz", package = "importbio"))
importbed <- function(infile){
  my_colnames <- c(
    "chrom", # The name of the chromosome (e.g. chr3, chrY, chr2_random) or scaffold (e.g. scaffold10671).
    "chromStart", # The starting position of the feature in the chromosome or scaffold. The first base in a chromosome is numbered 0.
    "chromEnd", # The ending position of the feature in the chromosome or scaffold. The chromEnd base is not included in the display of the feature, however, the number in position format will be represented. For example, the first 100 bases of chromosome 1 are defined as chrom=1, chromStart=0, chromEnd=100, and span the bases numbered 0-99 in our software (not 0-100), but will represent the position notation chr1:1-100. Read more here.
    "name", # Defines the name of the BED line. This label is displayed to the left of the BED line in the Genome Browser window when the track is open to full display mode or directly to the left of the item in pack mode.
    "score", # A score between 0 and 1000. If the track line useScore attribute is set to 1 for this annotation data set, the score value will determine the level of gray in which this feature is displayed (higher numbers = darker gray). This table shows the Genome Browser's translation of BED score values into shades of gray:
    "strand", # Defines the strand. Either "." (=no strand) or "+" or "-".
    "thickStart", # The starting position at which the feature is drawn thickly (for example, the start codon in gene displays). When there is no thick part, thickStart and thickEnd are usually set to the chromStart position.
    "thickEnd", # The ending position at which the feature is drawn thickly (for example the stop codon in gene displays).
    "itemRgb", # An RGB value of the form R,G,B (e.g. 255,0,0). If the track line itemRgb attribute is set to "On", this RBG value will determine the display color of the data contained in this BED line. NOTE: It is recommended that a simple color scheme (eight colors or less) be used with this attribute to avoid overwhelming the color resources of the Genome Browser and your Internet browser.
    "blockCount", # The number of blocks (exons) in the BED line.
    "blockSizes", # A comma-separated list of the block sizes. The number of items in this list should correspond to blockCount.
    "blockStarts" # A comma-separated list of block starts. All of the blockStart positions should be calculated relative to chromStart. The number of items in this list should correspond to blockCount.
  )

  my_coltypes <- list(
    chrom = "f",
    chromStart = "i",
    chromEnd = "i",
    name = "c",
    score = "c",
    strand = "c",
    thickStart = "i",
    thickEnd = "i",
    itemRgb = "c",
    blockCount = "i",
    blockSizes = "c",
    blockStarts = "c"
  )

  read_tsv(
    file = infile,
    comment = "#",
    col_names = FALSE,
    n_max = 1000
  ) %>%
    ncol() -> no_col

  stopifnot(no_col >= 3)

  read_tsv(
    file = infile,
    col_names = my_colnames[1:no_col],
    col_types = as.col_spec(unlist(my_coltypes[1:no_col])),
    comment = "#"
  )
}
