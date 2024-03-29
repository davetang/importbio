% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/importnetmhciipan.R
\name{importnetmhciipan}
\alias{importnetmhciipan}
\title{Import NetMHCIIpan output as a tibble}
\usage{
importnetmhciipan(infile)
}
\arguments{
\item{infile}{NetMHCIIpan output file to import}
}
\value{
A tibble
}
\description{
\code{importnetmhciipan()} reads NetMHCIIpan output (default parameters) and saves the contents in a tibble.
}
\details{
Columns:
\itemize{
\item \code{pos}: Residue number (starting from 1)
\item \code{mhc}: MHC molecule name
\item \code{peptide}: Amino acid sequence
\item \code{offset}: Starting position offset of the optimal binding core (starting from 0)
\item \code{core}: Binding core register
\item \code{core_rel}: Reliability of the binding core, expressed as the fraction of networks in the ensemble selecting the optimal core
\item \code{id}: Annotation of the input sequence, if specified
\item \code{score_el}: Eluted ligand prediction score
\item \code{perc_rank_el}: Percentile rank of eluted ligand prediction score
\item \code{exp_bind}: If the input was given in PEPTIDE format with an annotated affinity value (mainly for benchmarking purposes).
\item \code{bind_level}: (SB: strong binder, WB: weak binder). The peptide will be identified as a strong binder if the \% Rank is below the specified threshold for the strong binders. The peptide will be identified as a weak binder if the \% Rank is above the threshold of the strong binders but below the specified threshold for the weak binders.
}
}
\examples{
importnetmhciipan(system.file("extdata", "netmhciipan.out.gz", package = "importbio"))
}
