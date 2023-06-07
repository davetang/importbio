#' Import bam-readcount output as a tibble
#'
#' `importbamreadcount()` reads a bam-readcount tab-delimited file and saves
#' the contents in a tibble.
#'
#' Columns:
#'
#' 1. Chromosome
#' 2. Position
#' 3. Reference base
#' 4. Depth
#' 5. Stats for base `=`
#' 6. Stats for base `A`
#' 7. Stats for base `C`
#' 8. Stats for base `G`
#' 9. Stats for base `T`
#' 10. Stats for base `N`
#' 11. Stats for indel
#'
#' Each reported base/indel contains a set of `:`-separated fields with the following statistics:
#'
#' Field | Description
#' ----- | -----------
#' base | The base, eg `C`
#' count | Number of reads
#' avg_mapping_quality | Mean mapping quality
#' avg_basequality | Mean base quality
#' avg_se_mapping_quality | Mean single ended mapping quality
#' num_plus_strand | Number of reads on the plus/forward strand
#' num_minus_strand | Number of reads on the minus/reverse strand
#' avg_pos_as_fraction | Average position on the read as a fraction, calculated with respect to the length after clipping. This value is normalized to the center of the read: bases occurring strictly at the center of the read have a value of 1
#' , those occurring strictly at the ends should approach a value of 0
#' avg_num_mismatches_as_fraction | Average number of mismatches on these reads per base
#' avg_sum_mismatch_qualities | Average sum of the base qualities of mismatches in the reads
#' num_q2_containing_reads | Number of reads with q2 runs at the 3’ end
#' avg_distance_to_q2_start_in_q2_reads | Average distance of position (as fraction of unclipped read length) to the start of the q2 run
#' avg_clipped_length | Average clipped read length
#' avg_distance_to_effective_3p_end | Average distance to the 3’ prime end of the read (as fraction of unclipped read length)
#'
#' @param infile bam-readcount tab-delimited file to import
#' @param warnings show warnings
#'
#' @return A tibble
#' @export
#' @import readr
#'
#' @examples
#' importbamreadcount(system.file("extdata", "hg38.bwa.bamreadcount.tsv.gz", package = "importbio"))
importbamreadcount <- function(infile, warnings = FALSE){
  my_colnames <- c(
    "chr",
    "pos",
    "ref",
    "depth",
    "base_equal",
    "base_a",
    "base_c",
    "base_g",
    "base_t",
    "base_n",
    "base_indel"
  )

  my_coltypes <- cols(
    chr = "c",
    pos = "i",
    ref = "c",
    depth = "i",
    base_equal = "c",
    base_a = "c",
    base_c = "c",
    base_g = "c",
    base_t = "c",
    base_n = "c",
    base_indel = "c"
  )

  if(warnings){
    read_table(
      file = infile,
      col_names = my_colnames,
      col_types = my_coltypes
    ) -> dat
  } else {
    suppressWarnings(
      read_table(
        file = infile,
        col_names = my_colnames,
        col_types = my_coltypes
      ) -> dat
    )
  }

  # nicer way to write this?
  dat$base_equal <- lapply(dat$base_equal, parse_base)
  dat$base_a <- lapply(dat$base_a, parse_base)
  dat$base_c <- lapply(dat$base_c, parse_base)
  dat$base_g <- lapply(dat$base_g, parse_base)
  dat$base_t <- lapply(dat$base_t, parse_base)
  dat$base_n <- lapply(dat$base_n, parse_base)
  dat$base_indel <- lapply(dat$base_indel, parse_base)
  return(dat)
}

#' Parse base strings
#'
#' Meant for internal use only.
#'
#' @param x input string containing read stats
#'
#' @return A tibble
parse_base <- function(x){
  if(is.na(x)){
    return(NA)
  }
  y <- c(
    'base',
    'count',
    'avg_mapping_quality',
    'avg_basequality',
    'avg_se_mapping_quality',
    'num_plus_strand',
    'num_minus_strand',
    'avg_pos_as_fraction',
    'avg_num_mismatches_as_fraction',
    'avg_sum_mismatch_qualities',
    'num_q2_containing_reads',
    'avg_distance_to_q2_start_in_q2_reads',
    'avg_clipped_length',
    'avg_distance_to_effective_3p_end'
  )

  my_coltypes <- cols(
    base = 'c',
    count = 'i',
    avg_mapping_quality = 'd',
    avg_basequality = 'd',
    avg_se_mapping_quality = 'd',
    num_plus_strand = 'i',
    num_minus_strand = 'i',
    avg_pos_as_fraction = 'd',
    avg_num_mismatches_as_fraction = 'd',
    avg_sum_mismatch_qualities = 'd',
    num_q2_containing_reads = 'i',
    avg_distance_to_q2_start_in_q2_reads = 'd',
    avg_clipped_length = 'd',
    avg_distance_to_effective_3p_end = 'd'
  )
  s <- unlist(strsplit(x = as.character(x), split = ':'))
  names(s) <- y
  # changing type is really slow
  # type_convert(tibble(as.data.frame(t(s))), col_types = my_coltypes)

  tibble(as.data.frame(t(s)))
}
