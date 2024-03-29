% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/importblast.R
\name{importblast}
\alias{importblast}
\title{Import BLAST tabular output as a tibble}
\usage{
importblast(infile)
}
\arguments{
\item{infile}{BLAST tab-delimited file to import}
}
\value{
A tibble
}
\description{
\code{importblast()} reads a BLAST tab-delimited file (output format 6 or 7, where lines starting with a \verb{#} are ignored) and saves the contents in a tibble.
}
\details{
Columns:
\itemize{
\item \code{query}: query or source (gene) sequence id
\item \code{subject}: subject or target (reference genome) sequence id
\item \code{perc_id}: percentage of identical positions
\item \code{aln_len}: alignment length (sequence overlap)
\item \code{mismatches}: number of mismatches
\item \code{gap_opens}: number of gap openings
\item \code{q_start}: start of alignment in query
\item \code{q_end}: end of alignment in query
\item \code{s_start}: start of alignment in subject
\item \code{s_end}: end of alignment in subject
\item \code{evalue}: The BLAST E-value is the number of expected hits of similar quality (score) that could be found just by chance.
\item \code{bit_score}: bit score; The higher the bit-score, the better the sequence similarity. The bit-score is the requires size of a sequence database in which the current match could be found just by chance. The bit-score is a log2 scaled and normalised raw-score.
}
}
\examples{
importblast(system.file("extdata", "blastout.tsv.gz", package = "importbio"))
}
