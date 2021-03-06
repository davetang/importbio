% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/importgtf.R
\name{importgtf}
\alias{importgtf}
\title{Import GTF as a tibble}
\usage{
importgtf(infile, sep = "\\\\s")
}
\arguments{
\item{infile}{GTF file to import}

\item{sep}{separator for group field}
}
\value{
A tibble
}
\description{
Import GTF as a tibble
}
\examples{
importgtf(system.file("extdata", "gencode.v38.annotation.sample.gtf.gz", package = "importbio"))
}
