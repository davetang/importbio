
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
#> # A tibble: 101 × 10
#>    vid              chrom    pos id         ref   alt   qual  filter info  type 
#>    <chr>            <fct>  <int> <chr>      <chr> <chr> <chr> <chr>  <chr> <chr>
#>  1 1_866511_C_CCCCT 1     866511 rs60722469 C     CCCCT 258.… PASS   AC=2… ins  
#>  2 1_879317_C_T     1     879317 rs7523549  C     T     150.… PASS   AC=1… snv  
#>  3 1_879482_G_C     1     879482 .          G     C     484.… PASS   AC=1… snv  
#>  4 1_880390_C_A     1     880390 rs3748593  C     A     288.… PASS   AC=1… snv  
#>  5 1_881627_G_A     1     881627 rs2272757  G     A     486.… PASS   AC=1… snv  
#>  6 1_884091_C_G     1     884091 rs7522415  C     G     65.46 PASS   AC=1… snv  
#>  7 1_884101_A_C     1     884101 rs4970455  A     C     85.81 PASS   AC=1… snv  
#>  8 1_892460_G_C     1     892460 rs41285802 G     C     1736… PASS   AC=1… snv  
#>  9 1_897730_C_T     1     897730 rs7549631  C     T     225.… PASS   AC=1… snv  
#> 10 1_909238_G_C     1     909238 rs3829740  G     C     247.… PASS   AC=1… snv  
#> # … with 91 more rows
```

Import a BED file.

``` r
importbed(system.file("extdata", "refseq.bed.gz", package = "importbio"))
#> # A tibble: 101 × 12
#>    chrom chromStart chromEnd name   score strand thick…¹ thick…² itemRgb block…³
#>    <fct>      <int>    <int> <chr>  <chr> <chr>    <int>   <int> <chr>     <int>
#>  1 chr1    67092164 67134970 NM_00… 0     -       6.71e7  6.71e7 0             9
#>  2 chr1    67092164 67134970 NM_00… 0     -       6.71e7  6.71e7 0             8
#>  3 chr1    67092164 67134970 NR_07… 0     -       6.71e7  6.71e7 0            10
#>  4 chr1    67092175 67109072 XM_01… 0     -       6.71e7  6.71e7 0             5
#>  5 chr1    67092175 67131183 XM_01… 0     -       6.71e7  6.71e7 0             9
#>  6 chr1    67092175 67131227 XM_01… 0     -       6.71e7  6.71e7 0             9
#>  7 chr1    67092175 67134962 XM_01… 0     -       6.71e7  6.71e7 0             9
#>  8 chr1    67092175 67141646 XM_01… 0     -       6.71e7  6.71e7 0             9
#>  9 chr1    67093484 67131227 XM_01… 0     -       6.71e7  6.71e7 0             9
#> 10 chr1    67093484 67131227 XM_01… 0     -       6.71e7  6.71e7 0             6
#> # … with 91 more rows, 2 more variables: blockSizes <chr>, blockStarts <chr>,
#> #   and abbreviated variable names ¹​thickStart, ²​thickEnd, ³​blockCount
```

Import a GTF file.

``` r
importgtf(system.file("extdata", "gencode.v38.annotation.sample.gtf.gz", package = "importbio"))
#> # A tibble: 94 × 24
#>    seqname source feature start   end score strand frame gene_id gene_…¹ gene_…²
#>    <fct>   <chr>  <chr>   <int> <int> <chr> <chr>  <chr> <list>  <list>  <list> 
#>  1 chr1    HAVANA gene    11869 14409 .     +      .     <chr>   <chr>   <chr>  
#>  2 chr1    HAVANA transc… 11869 14409 .     +      .     <chr>   <chr>   <chr>  
#>  3 chr1    HAVANA exon    11869 12227 .     +      .     <chr>   <chr>   <chr>  
#>  4 chr1    HAVANA exon    12613 12721 .     +      .     <chr>   <chr>   <chr>  
#>  5 chr1    HAVANA exon    13221 14409 .     +      .     <chr>   <chr>   <chr>  
#>  6 chr1    HAVANA transc… 12010 13670 .     +      .     <chr>   <chr>   <chr>  
#>  7 chr1    HAVANA exon    12010 12057 .     +      .     <chr>   <chr>   <chr>  
#>  8 chr1    HAVANA exon    12179 12227 .     +      .     <chr>   <chr>   <chr>  
#>  9 chr1    HAVANA exon    12613 12697 .     +      .     <chr>   <chr>   <chr>  
#> 10 chr1    HAVANA exon    12975 13052 .     +      .     <chr>   <chr>   <chr>  
#> # … with 84 more rows, 13 more variables: level <list>, hgnc_id <list>,
#> #   havana_gene <list>, transcript_id <list>, transcript_type <list>,
#> #   transcript_name <list>, transcript_support_level <list>, tag <list>,
#> #   havana_transcript <list>, exon_number <list>, exon_id <list>, ont <list>,
#> #   protein_id <list>, and abbreviated variable names ¹​gene_type, ²​gene_name
```

Import a GFF3 file.

``` r
importgff(system.file("extdata", "gencode.v38.annotation.sample.gff3.gz", package = "importbio"))
#> # A tibble: 92 × 26
#>    seqname source feature   start   end score strand frame ID    gene_id gene_…¹
#>    <fct>   <chr>  <chr>     <int> <int> <chr> <chr>  <chr> <lis> <list>  <list> 
#>  1 chr1    HAVANA gene      11869 14409 .     +      .     <chr> <chr>   <chr>  
#>  2 chr1    HAVANA transcri… 11869 14409 .     +      .     <chr> <chr>   <chr>  
#>  3 chr1    HAVANA exon      11869 12227 .     +      .     <chr> <chr>   <chr>  
#>  4 chr1    HAVANA exon      12613 12721 .     +      .     <chr> <chr>   <chr>  
#>  5 chr1    HAVANA exon      13221 14409 .     +      .     <chr> <chr>   <chr>  
#>  6 chr1    HAVANA transcri… 12010 13670 .     +      .     <chr> <chr>   <chr>  
#>  7 chr1    HAVANA exon      12010 12057 .     +      .     <chr> <chr>   <chr>  
#>  8 chr1    HAVANA exon      12179 12227 .     +      .     <chr> <chr>   <chr>  
#>  9 chr1    HAVANA exon      12613 12697 .     +      .     <chr> <chr>   <chr>  
#> 10 chr1    HAVANA exon      12975 13052 .     +      .     <chr> <chr>   <chr>  
#> # … with 82 more rows, 15 more variables: gene_name <list>, level <list>,
#> #   hgnc_id <list>, havana_gene <list>, Parent <list>, transcript_id <list>,
#> #   transcript_type <list>, transcript_name <list>,
#> #   transcript_support_level <list>, tag <list>, havana_transcript <list>,
#> #   exon_number <list>, exon_id <list>, ont <list>, protein_id <list>, and
#> #   abbreviated variable name ¹​gene_type
```

Import BLAST output.

``` r
importblast(system.file("extdata", "blastout.tsv.gz", package = "importbio"))
#> # A tibble: 36 × 12
#>    query     subject perc_id aln_len misma…¹ gap_o…² q_start q_end s_start s_end
#>    <chr>     <chr>     <dbl>   <int>   <int>   <int>   <int> <int>   <int> <int>
#>  1 ASSFLKSF… ENSP00…    88.9       9       1       0       1     9     710   718
#>  2 ASSFLKSF… ENSP00…    88.9       9       1       0       1     9     710   718
#>  3 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#>  4 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#>  5 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#>  6 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#>  7 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#>  8 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#>  9 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#> 10 ASSFLKSF… ENSP00…   100         7       0       0       1     7      58    64
#> # … with 26 more rows, 2 more variables: evalue <dbl>, bit_score <dbl>, and
#> #   abbreviated variable names ¹​mismatches, ²​gap_opens
```

## Contact

Email me at davetang dot org (no spaces).
