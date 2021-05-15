
<!-- README.md is generated from README.Rmd. Please edit that file -->

# importbio

<!-- badges: start -->
<!-- badges: end -->

Import common bioinformatic file formats into R as tibbles.

## Installation

You can install importbio using the `remotes` package.

``` r
install.packages("remotes")
remotes::install_github('davetang/importbio')
```

## Example

``` r
library(importbio)
importvcf(system.file("extdata", "Pfeiffer.vcf.gz", package = "importbio"))
#> Warning: 37709 parsing failures.
#> row col  expected     actual                                                                                                                            file
#>   1  -- 8 columns 10 columns '/private/var/folders/f1/q44czgwd56z93tvqj9f2x1tm0000gn/T/RtmpqHcPKd/temp_libpath7126a9d7d1a/importbio/extdata/Pfeiffer.vcf.gz'
#>   2  -- 8 columns 10 columns '/private/var/folders/f1/q44czgwd56z93tvqj9f2x1tm0000gn/T/RtmpqHcPKd/temp_libpath7126a9d7d1a/importbio/extdata/Pfeiffer.vcf.gz'
#>   3  -- 8 columns 10 columns '/private/var/folders/f1/q44czgwd56z93tvqj9f2x1tm0000gn/T/RtmpqHcPKd/temp_libpath7126a9d7d1a/importbio/extdata/Pfeiffer.vcf.gz'
#>   4  -- 8 columns 10 columns '/private/var/folders/f1/q44czgwd56z93tvqj9f2x1tm0000gn/T/RtmpqHcPKd/temp_libpath7126a9d7d1a/importbio/extdata/Pfeiffer.vcf.gz'
#>   5  -- 8 columns 10 columns '/private/var/folders/f1/q44czgwd56z93tvqj9f2x1tm0000gn/T/RtmpqHcPKd/temp_libpath7126a9d7d1a/importbio/extdata/Pfeiffer.vcf.gz'
#> ... ... ......... .......... ...............................................................................................................................
#> See problems(...) for more details.
#> # A tibble: 37,709 x 10
#>    vid     chrom    pos id     ref   alt     qual filter info              type 
#>    <chr>   <fct>  <int> <chr>  <chr> <chr>  <dbl> <chr>  <chr>             <chr>
#>  1 1_8665… 1     866511 rs607… C     CCCCT  259.  PASS   AC=2;AF=1.00;AN=… ins  
#>  2 1_8793… 1     879317 rs752… C     T      151.  PASS   AC=1;AF=0.50;AN=… snv  
#>  3 1_8794… 1     879482 .      G     C      485.  PASS   AC=1;AF=0.50;AN=… snv  
#>  4 1_8803… 1     880390 rs374… C     A      288.  PASS   AC=1;AF=0.50;AN=… snv  
#>  5 1_8816… 1     881627 rs227… G     A      486.  PASS   AC=1;AF=0.50;AN=… snv  
#>  6 1_8840… 1     884091 rs752… C     G       65.5 PASS   AC=1;AF=0.50;AN=… snv  
#>  7 1_8841… 1     884101 rs497… A     C       85.8 PASS   AC=1;AF=0.50;AN=… snv  
#>  8 1_8924… 1     892460 rs412… G     C     1737.  PASS   AC=1;AF=0.50;AN=… snv  
#>  9 1_8977… 1     897730 rs754… C     T      225.  PASS   AC=1;AF=0.50;AN=… snv  
#> 10 1_9092… 1     909238 rs382… G     C      248.  PASS   AC=1;AF=0.50;AN=… snv  
#> # … with 37,699 more rows
```
