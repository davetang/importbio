
<!-- README.md is generated from README.Rmd. Please edit that file -->

# importbio

<!-- badges: start -->
<!-- badges: end -->

A package for importing common bioinformatic file formats into R as
[tibbles](https://r4ds.had.co.nz/tibbles.html).

## Setup

You can install and update importbio using the `remotes` package. Use
the `install_github()` function to install the package.

``` r
install.packages("remotes")
remotes::install_github('davetang/importbio')
```

Use the `update_packages()` function to update the package. You can
check the version using the `packageVersion()` base function.

``` r
remotes::update_packages("importbio")
packageVersion("importbio")
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
#> # ℹ 91 more rows
```

Import a BED file.

``` r
importbed(system.file("extdata", "refseq.bed.gz", package = "importbio"))
#> # A tibble: 101 × 12
#>    chrom chromStart chromEnd name       score strand thickStart thickEnd itemRgb
#>    <fct>      <int>    <int> <chr>      <chr> <chr>       <int>    <int> <chr>  
#>  1 chr1    67092164 67134970 NM_001276… 0     -        67093579 67127240 0      
#>  2 chr1    67092164 67134970 NM_001276… 0     -        67093004 67127240 0      
#>  3 chr1    67092164 67134970 NR_075077… 0     -        67134970 67134970 0      
#>  4 chr1    67092175 67109072 XM_011541… 0     -        67093004 67103382 0      
#>  5 chr1    67092175 67131183 XM_011541… 0     -        67093004 67127240 0      
#>  6 chr1    67092175 67131227 XM_017001… 0     -        67093004 67127240 0      
#>  7 chr1    67092175 67134962 XM_011541… 0     -        67093004 67127240 0      
#>  8 chr1    67092175 67141646 XM_011541… 0     -        67093004 67127240 0      
#>  9 chr1    67093484 67131227 XM_017001… 0     -        67093569 67127240 0      
#> 10 chr1    67093484 67131227 XM_011541… 0     -        67093579 67127240 0      
#> # ℹ 91 more rows
#> # ℹ 3 more variables: blockCount <int>, blockSizes <chr>, blockStarts <chr>
```

Import a GTF file.

``` r
importgtf(system.file("extdata", "gencode.v38.annotation.sample.gtf.gz", package = "importbio"))
#> # A tibble: 94 × 24
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
#> # ℹ 84 more rows
#> # ℹ 14 more variables: gene_name <list>, level <list>, hgnc_id <list>,
#> #   havana_gene <list>, transcript_id <list>, transcript_type <list>,
#> #   transcript_name <list>, transcript_support_level <list>, tag <list>,
#> #   havana_transcript <list>, exon_number <list>, exon_id <list>, ont <list>,
#> #   protein_id <list>
```

Import a GTF file but keeping only the gene features.

``` r
importgtf(system.file("extdata", "gencode.v38.annotation.sample.gtf.gz", package = "importbio"), keep_feature = "gene")
#> # A tibble: 11 × 15
#>    seqname source  feature start    end score strand frame gene_id   gene_type
#>    <fct>   <chr>   <chr>   <int>  <int> <chr> <chr>  <chr> <list>    <list>   
#>  1 chr1    HAVANA  gene    11869  14409 .     +      .     <chr [1]> <chr [1]>
#>  2 chr1    HAVANA  gene    14404  29570 .     -      .     <chr [1]> <chr [1]>
#>  3 chr1    ENSEMBL gene    17369  17436 .     -      .     <chr [1]> <chr [1]>
#>  4 chr1    HAVANA  gene    29554  31109 .     +      .     <chr [1]> <chr [1]>
#>  5 chr1    ENSEMBL gene    30366  30503 .     +      .     <chr [1]> <chr [1]>
#>  6 chr1    HAVANA  gene    34554  36081 .     -      .     <chr [1]> <chr [1]>
#>  7 chr1    HAVANA  gene    52473  53312 .     +      .     <chr [1]> <chr [1]>
#>  8 chr1    HAVANA  gene    57598  64116 .     +      .     <chr [1]> <chr [1]>
#>  9 chr1    HAVANA  gene    65419  71585 .     +      .     <chr [1]> <chr [1]>
#> 10 chr1    HAVANA  gene    89295 133723 .     -      .     <chr [1]> <chr [1]>
#> 11 chr1    HAVANA  gene    89551  91105 .     -      .     <chr [1]> <chr [1]>
#> # ℹ 5 more variables: gene_name <list>, level <list>, hgnc_id <list>,
#> #   havana_gene <list>, tag <list>
```

Import a GFF3 file.

``` r
importgff(system.file("extdata", "gencode.v38.annotation.sample.gff3.gz", package = "importbio"))
#> # A tibble: 92 × 26
#>    seqname source feature start   end score strand frame ID    gene_id gene_type
#>    <fct>   <chr>  <chr>   <int> <int> <chr> <chr>  <chr> <lis> <list>  <list>   
#>  1 chr1    HAVANA gene    11869 14409 .     +      .     <chr> <chr>   <chr [1]>
#>  2 chr1    HAVANA transc… 11869 14409 .     +      .     <chr> <chr>   <chr [1]>
#>  3 chr1    HAVANA exon    11869 12227 .     +      .     <chr> <chr>   <chr [1]>
#>  4 chr1    HAVANA exon    12613 12721 .     +      .     <chr> <chr>   <chr [1]>
#>  5 chr1    HAVANA exon    13221 14409 .     +      .     <chr> <chr>   <chr [1]>
#>  6 chr1    HAVANA transc… 12010 13670 .     +      .     <chr> <chr>   <chr [1]>
#>  7 chr1    HAVANA exon    12010 12057 .     +      .     <chr> <chr>   <chr [1]>
#>  8 chr1    HAVANA exon    12179 12227 .     +      .     <chr> <chr>   <chr [1]>
#>  9 chr1    HAVANA exon    12613 12697 .     +      .     <chr> <chr>   <chr [1]>
#> 10 chr1    HAVANA exon    12975 13052 .     +      .     <chr> <chr>   <chr [1]>
#> # ℹ 82 more rows
#> # ℹ 15 more variables: gene_name <list>, level <list>, hgnc_id <list>,
#> #   havana_gene <list>, Parent <list>, transcript_id <list>,
#> #   transcript_type <list>, transcript_name <list>,
#> #   transcript_support_level <list>, tag <list>, havana_transcript <list>,
#> #   exon_number <list>, exon_id <list>, ont <list>, protein_id <list>
```

Import BLAST output.

``` r
importblast(system.file("extdata", "blastout.tsv.gz", package = "importbio"))
#> # A tibble: 36 × 12
#>    query      subject perc_id aln_len mismatches gap_opens q_start q_end s_start
#>    <chr>      <chr>     <dbl>   <int>      <int>     <int>   <int> <int>   <int>
#>  1 ASSFLKSFY… ENSP00…    88.9       9          1         0       1     9     710
#>  2 ASSFLKSFY… ENSP00…    88.9       9          1         0       1     9     710
#>  3 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#>  4 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#>  5 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#>  6 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#>  7 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#>  8 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#>  9 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#> 10 ASSFLKSFY… ENSP00…   100         7          0         0       1     7      58
#> # ℹ 26 more rows
#> # ℹ 3 more variables: s_end <int>, evalue <dbl>, bit_score <dbl>
```

Import NetMHCIIpan output.

``` r
importnetmhciipan(system.file("extdata", "netmhciipan.out.gz", package = "importbio"))
#> # A tibble: 86 × 11
#>      pos mhc       peptide     offset core  core_rel id    score_el perc_rank_el
#>    <int> <chr>     <chr>        <int> <chr>    <dbl> <chr>    <dbl>        <dbl>
#>  1     1 DRB1_0101 MAEMKTDAAT…      3 MKTD…    0.98  P9WN…  0.0980          9.99
#>  2     2 DRB1_0101 AEMKTDAATL…      2 MKTD…    0.867 P9WN…  0.0417         16.0 
#>  3     3 DRB1_0101 EMKTDAATLA…      4 DAAT…    0.613 P9WN…  0.0129         28.5 
#>  4     4 DRB1_0101 MKTDAATLAQ…      3 DAAT…    0.813 P9WN…  0.00916        33.4 
#>  5     5 DRB1_0101 KTDAATLAQE…      2 DAAT…    0.627 P9WN…  0.00435        45.8 
#>  6     6 DRB1_0101 TDAATLAQEA…      5 LAQE…    0.64  P9WN…  0.00784        35.7 
#>  7     7 DRB1_0101 DAATLAQEAG…      4 LAQE…    0.773 P9WN…  0.0117         29.8 
#>  8     8 DRB1_0101 AATLAQEAGN…      3 LAQE…    0.907 P9WN…  0.0161         25.6 
#>  9     9 DRB1_0101 ATLAQEAGNF…      2 LAQE…    0.753 P9WN…  0.00528        42.3 
#> 10    10 DRB1_0101 TLAQEAGNFE…      3 QEAG…    0.48  P9WN…  0.00186        63.6 
#> # ℹ 76 more rows
#> # ℹ 2 more variables: exp_bind <dbl>, bind_level <chr>
```

Import `mhcflurry-predict` output.

``` r
importmhcflurry(system.file("extdata", "mhcflurry.pred.csv.gz", package = "importbio"))
#> # A tibble: 92 × 8
#>    id    allele     peptide   mhcflurry_affinity mhcflurry_affinity_percentile
#>    <chr> <chr>      <chr>                  <dbl>                         <dbl>
#>  1 0     HLA-A02:01 MAEMKTDAA             19262.                         11.1 
#>  2 1     HLA-A02:01 AEMKTDAAT             23317.                         16.5 
#>  3 2     HLA-A02:01 EMKTDAATL             11060.                          5.90
#>  4 3     HLA-A02:01 MKTDAATLA             24356.                         18.5 
#>  5 4     HLA-A02:01 KTDAATLAQ             21710.                         13.9 
#>  6 5     HLA-A02:01 TDAATLAQE             24373.                         18.5 
#>  7 6     HLA-A02:01 DAATLAQEA             17752.                          9.89
#>  8 7     HLA-A02:01 AATLAQEAG             26679.                         25.4 
#>  9 8     HLA-A02:01 ATLAQEAGN             27336.                         27.6 
#> 10 9     HLA-A02:01 TLAQEAGNF             11715.                          6.24
#> # ℹ 82 more rows
#> # ℹ 3 more variables: mhcflurry_processing_score <dbl>,
#> #   mhcflurry_presentation_score <dbl>, mhcflurry_presentation_percentile <dbl>
```

Import bam-readcount output.

``` r
importbamreadcount(system.file("extdata", "hg38.bwa.bamreadcount.tsv.gz", package = "importbio"))
#> # A tibble: 2,733 × 11
#>    chr       pos ref   depth base_equal base_a   base_c   base_g   base_t  
#>    <chr>   <int> <chr> <int> <list>     <list>   <list>   <list>   <list>  
#>  1 chr11 5224908 C         9 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  2 chr11 5224909 A         9 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  3 chr11 5224910 G        10 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  4 chr11 5224911 A        10 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  5 chr11 5224912 T        10 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  6 chr11 5224913 T        10 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  7 chr11 5224914 C        10 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  8 chr11 5224915 C        10 <tibble>   <tibble> <tibble> <tibble> <tibble>
#>  9 chr11 5224916 G        10 <tibble>   <tibble> <tibble> <tibble> <tibble>
#> 10 chr11 5224917 G        11 <tibble>   <tibble> <tibble> <tibble> <tibble>
#> # ℹ 2,723 more rows
#> # ℹ 2 more variables: base_n <list>, base_indel <list>
```

## Session info

    #> R version 4.3.3 (2024-02-29)
    #> Platform: x86_64-pc-linux-gnu (64-bit)
    #> Running under: Ubuntu 22.04.4 LTS
    #> 
    #> Matrix products: default
    #> BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
    #> LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.20.so;  LAPACK version 3.10.0
    #> 
    #> locale:
    #>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    #>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
    #>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
    #>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
    #>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    #> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    #> 
    #> time zone: Etc/UTC
    #> tzcode source: system (glibc)
    #> 
    #> attached base packages:
    #> [1] stats     graphics  grDevices utils     datasets  methods   base     
    #> 
    #> other attached packages:
    #> [1] importbio_0.0.6
    #> 
    #> loaded via a namespace (and not attached):
    #>  [1] crayon_1.5.2      vctrs_0.6.5       cli_3.6.2         knitr_1.45       
    #>  [5] rlang_1.1.3       xfun_0.42         purrr_1.0.2       generics_0.1.3   
    #>  [9] bit_4.0.5         glue_1.7.0        htmltools_0.5.7   hms_1.1.3        
    #> [13] fansi_1.0.6       rmarkdown_2.26    evaluate_0.23     tibble_3.2.1     
    #> [17] tzdb_0.4.0        fastmap_1.1.1     yaml_2.3.8        lifecycle_1.0.4  
    #> [21] compiler_4.3.3    dplyr_1.1.4       pkgconfig_2.0.3   tidyr_1.3.1      
    #> [25] rstudioapi_0.15.0 digest_0.6.35     R6_2.5.1          readr_2.1.5      
    #> [29] tidyselect_1.2.1  utf8_1.2.4        parallel_4.3.3    vroom_1.6.5      
    #> [33] pillar_1.9.0      magrittr_2.0.3    withr_3.0.0       bit64_4.0.5      
    #> [37] tools_4.3.3

## Contact

Email me at davetang dot org (no spaces).
