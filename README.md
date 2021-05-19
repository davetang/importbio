
<!-- README.md is generated from README.Rmd. Please edit that file -->

# importbio

<!-- badges: start -->
<!-- badges: end -->

A package for importing common bioinformatic file formats into R as
[tibbles](https://r4ds.had.co.nz/tibbles.html).

## Installation

You can install importbio using the `remotes` package.

``` r
install.packages("remotes")
remotes::install_github('davetang/importbio')
```

## Examples

Import a VCF file.

``` r
importvcf(system.file("extdata", "Pfeiffer.vcf.gz", package = "importbio"))
#> # A tibble: 101 x 10
#>    vid     chrom    pos id     ref   alt     qual filter info              type 
#>    <chr>   <fct>  <int> <chr>  <chr> <chr>  <dbl> <chr>  <chr>             <chr>
#>  1 1_8665~ 1     866511 rs607~ C     CCCCT  259.  PASS   AC=2;AF=1.00;AN=~ ins  
#>  2 1_8793~ 1     879317 rs752~ C     T      151.  PASS   AC=1;AF=0.50;AN=~ snv  
#>  3 1_8794~ 1     879482 .      G     C      485.  PASS   AC=1;AF=0.50;AN=~ snv  
#>  4 1_8803~ 1     880390 rs374~ C     A      288.  PASS   AC=1;AF=0.50;AN=~ snv  
#>  5 1_8816~ 1     881627 rs227~ G     A      486.  PASS   AC=1;AF=0.50;AN=~ snv  
#>  6 1_8840~ 1     884091 rs752~ C     G       65.5 PASS   AC=1;AF=0.50;AN=~ snv  
#>  7 1_8841~ 1     884101 rs497~ A     C       85.8 PASS   AC=1;AF=0.50;AN=~ snv  
#>  8 1_8924~ 1     892460 rs412~ G     C     1737.  PASS   AC=1;AF=0.50;AN=~ snv  
#>  9 1_8977~ 1     897730 rs754~ C     T      225.  PASS   AC=1;AF=0.50;AN=~ snv  
#> 10 1_9092~ 1     909238 rs382~ G     C      248.  PASS   AC=1;AF=0.50;AN=~ snv  
#> # ... with 91 more rows
```

Import a BED file.

``` r
importbed(system.file("extdata", "refseq.bed.gz", package = "importbio"))
#> # A tibble: 101 x 12
#>    chrom chromStart chromEnd name       score strand thickStart thickEnd itemRgb
#>    <fct>      <int>    <int> <chr>      <chr> <chr>       <int>    <int> <chr>  
#>  1 chr1    67092164 67134970 NM_001276~ 0     -        67093579 67127240 0      
#>  2 chr1    67092164 67134970 NM_001276~ 0     -        67093004 67127240 0      
#>  3 chr1    67092164 67134970 NR_075077~ 0     -        67134970 67134970 0      
#>  4 chr1    67092175 67109072 XM_011541~ 0     -        67093004 67103382 0      
#>  5 chr1    67092175 67131183 XM_011541~ 0     -        67093004 67127240 0      
#>  6 chr1    67092175 67131227 XM_017001~ 0     -        67093004 67127240 0      
#>  7 chr1    67092175 67134962 XM_011541~ 0     -        67093004 67127240 0      
#>  8 chr1    67092175 67141646 XM_011541~ 0     -        67093004 67127240 0      
#>  9 chr1    67093484 67131227 XM_017001~ 0     -        67093569 67127240 0      
#> 10 chr1    67093484 67131227 XM_011541~ 0     -        67093579 67127240 0      
#> # ... with 91 more rows, and 3 more variables: blockCount <int>,
#> #   blockSizes <chr>, blockStarts <chr>
```

Import a GTF file.

``` r
importgtf(system.file("extdata", "gencode.v38.annotation.sample.gtf.gz", package = "importbio"))
#> # A tibble: 94 x 24
#>    seqname source feature    start   end score strand frame gene_id   gene_type
#>    <fct>   <chr>  <chr>      <int> <int> <chr> <chr>  <chr> <list>    <list>   
#>  1 chr1    HAVANA gene       11869 14409 .     +      .     <chr [1]> <chr [1]>
#>  2 chr1    HAVANA transcript 11869 14409 .     +      .     <chr [1]> <chr [1]>
#>  3 chr1    HAVANA exon       11869 12227 .     +      .     <chr [1]> <chr [1]>
#>  4 chr1    HAVANA exon       12613 12721 .     +      .     <chr [1]> <chr [1]>
#>  5 chr1    HAVANA exon       13221 14409 .     +      .     <chr [1]> <chr [1]>
#>  6 chr1    HAVANA transcript 12010 13670 .     +      .     <chr [1]> <chr [1]>
#>  7 chr1    HAVANA exon       12010 12057 .     +      .     <chr [1]> <chr [1]>
#>  8 chr1    HAVANA exon       12179 12227 .     +      .     <chr [1]> <chr [1]>
#>  9 chr1    HAVANA exon       12613 12697 .     +      .     <chr [1]> <chr [1]>
#> 10 chr1    HAVANA exon       12975 13052 .     +      .     <chr [1]> <chr [1]>
#> # ... with 84 more rows, and 14 more variables: gene_name <list>, level <list>,
#> #   hgnc_id <list>, havana_gene <list>, transcript_id <list>,
#> #   transcript_type <list>, transcript_name <list>,
#> #   transcript_support_level <list>, tag <list>, havana_transcript <list>,
#> #   exon_number <list>, exon_id <list>, ont <list>, protein_id <list>
```

Import a GFF3 file.

``` r
importgff(system.file("extdata", "gencode.v38.annotation.sample.gff3.gz", package = "importbio"))
#> # A tibble: 92 x 26
#>    seqname source feature start   end score strand frame ID    gene_id gene_type
#>    <fct>   <chr>  <chr>   <int> <int> <chr> <chr>  <chr> <lis> <list>  <list>   
#>  1 chr1    HAVANA gene    11869 14409 .     +      .     <chr~ <chr [~ <chr [1]>
#>  2 chr1    HAVANA transc~ 11869 14409 .     +      .     <chr~ <chr [~ <chr [1]>
#>  3 chr1    HAVANA exon    11869 12227 .     +      .     <chr~ <chr [~ <chr [1]>
#>  4 chr1    HAVANA exon    12613 12721 .     +      .     <chr~ <chr [~ <chr [1]>
#>  5 chr1    HAVANA exon    13221 14409 .     +      .     <chr~ <chr [~ <chr [1]>
#>  6 chr1    HAVANA transc~ 12010 13670 .     +      .     <chr~ <chr [~ <chr [1]>
#>  7 chr1    HAVANA exon    12010 12057 .     +      .     <chr~ <chr [~ <chr [1]>
#>  8 chr1    HAVANA exon    12179 12227 .     +      .     <chr~ <chr [~ <chr [1]>
#>  9 chr1    HAVANA exon    12613 12697 .     +      .     <chr~ <chr [~ <chr [1]>
#> 10 chr1    HAVANA exon    12975 13052 .     +      .     <chr~ <chr [~ <chr [1]>
#> # ... with 82 more rows, and 15 more variables: gene_name <list>, level <list>,
#> #   hgnc_id <list>, havana_gene <list>, Parent <list>, transcript_id <list>,
#> #   transcript_type <list>, transcript_name <list>,
#> #   transcript_support_level <list>, tag <list>, havana_transcript <list>,
#> #   exon_number <list>, exon_id <list>, ont <list>, protein_id <list>
```

## Contact

Email me at davetang dot org (no spaces).
