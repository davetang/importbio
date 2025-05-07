#' Import a GAF as a tibble
#'
#' `importgaf()` reads a version 2.2 GO Annotation File (GAF) file.
#'
#' Columns:
#'
#' * `DB`: Refers to the database from which the identifier in DB object ID (column 2) is drawn.
#' * `DB_Object_ID`: A unique identifier from the database in DB (column 1) for the item being annotated.
#' * `DB_Object_Symbol`: A (unique and valid) symbol to which DB object ID is matched.
#' * `Relation`: Describes how a gene product relates to the GO term with which it is associated.
#' * `GO_ID`: The GO identifier for the term attributed to the DB object ID.
#' * `DB_Reference`: One or more unique identifiers for a single source cited as an authority for the attribution of the GO ID to the DB Object ID.
#' * `Evidence_Code`: Evidence codes for GO annotations.
#' * `With_From`: This field is used to hold an additional identifier for annotations.
#' * `Aspect`: Refers to the namespace or ontology to which the GO ID (column 5) belongs.
#' * `DB_Object_Name`: Name of gene or gene product.
#' * `DB_Object_Synonym`: Gene symbol or other text.
#' * `DB_Object_Type`: A description of the type of gene product being annotated.
#' * `Taxon`: Taxonomic identifier(s).
#' * `Date`: Date on which the annotation was made; format is YYYYMMDD.
#' * `Assigned_By`: The database which made the annotation.
#' * `Annotation_Extension`: Contains cross references to other ontologies that can be used to qualify or enhance the annotation.
#' * `Gene_Product_Form_ID`: This field allows the annotation of specific variants of that gene or gene product.
#'
#' @param infile GAF file to import
#'
#' @return A tibble
#' @export
#' @import readr
#'
#' @examples
#' importgaf(system.file("extdata", "GCF_043380555.1-RS_2024_12_gene_ontology.gaf.gz", package = "importbio"))
importgaf <- function(infile){
  my_colnames <- c(
    "DB",
    "DB_Object_ID",
    "DB_Object_Symbol",
    "Relation",
    "GO_ID",
    "DB_Reference",
    "Evidence_Code",
    "With_From",
    "Aspect",
    "DB_Object_Name",
    "DB_Object_Synonym",
    "DB_Object_Type",
    "Taxon",
    "Date",
    "Assigned_By",
    "Annotation_Extension",
    "Gene_Product_Form_ID"
  )

  my_coltypes <- list(
    DB = "c",
    DB_Object_ID = "c",
    DB_Object_Symbol = "c",
    Relation = "c",
    GO_ID = "c",
    DB_Reference = "c",
    Evidence_Code = "c",
    With_From = "c",
    Aspect = "c",
    DB_Object_Name = "c",
    DB_Object_Synonym = "c",
    DB_Object_Type = "c",
    Taxon = "c",
    Date = "c",
    Assigned_By = "c",
    Annotation_Extension = "c",
    Gene_Product_Form_ID = "c"
  )

  read_tsv(
    file = infile,
    comment = "!",
    col_names = my_colnames,
    col_types = as.col_spec(unlist(my_coltypes))
  )
}
