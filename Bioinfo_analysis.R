library(tidyverse)
#library(ade4)
#library(adegenet)
#library(hierfstat)
#library(reshape2)
library(ggplot2)
library(BiocManager)
library(readr)
library(seqinr)
library(ape)

p <- read.csv("./metabarcode_metadata.csv")
p.df <- data.frame(p) ##<- This reads in our metadata as a dataframe 
p.dt <- data.frame(p)

ID_names <- c("WS023_S167", "WS026_S140", "WS027_S171", "WS028_S161", "WS029_S141", "WS031_S151", "WS032_S170", "WS034_S142", "WS035_S152", "WS036_S172")

taxonomy <- read_tsv("./taxonomy.tsv")

# Constructed from biom file
#OTU vs Sample_ID, need to change this.
Featuretable16S <- read.delim("./featuretable16S.tsv", sep = "\t")

p.dt$ExtractionID <- replace(p.df$ExtractionID, p.df$ExtractionID >= 1, ID_names) ## Updates sample_ID names to match QIIMEv2 metadata.



taxaRoot <- data.frame(
  taxon = taxonomy$Taxon,
  sample_present = c(0),
  subsite = c(0),
  row.names = c(Featuretable16S$ID)
)


#if(false){
for (j in 1:nrow(Featuretable16S)) {
  featureCount <- c()
  for (i in 2:ncol(Featuretable16S)) {
    if ((Featuretable16S[j,i]) && (Featuretable16S[j,1] == taxonomy$`Feature ID`[j])){ ##filters by abundance per sample
      #print(Featuretable16S[j,1]) ##pulls metadata name for taxonomic feature sorted
      #print(taxonomy$`Feature ID`[j])
      #print(taxonomy$Taxon[j])
      #print(colnames(Featuretable16S)[i]) ##pulls associated 'sampleID'
      if (Featuretable16S[j,i] > 0){
        featureCount <- c(featureCount, colnames(Featuretable16S[i]))
      }
    }
  }
  taxaRoot$sample_present[j] <- str_flatten(featureCount, collapse = ",")
} # <- NO TOUCH
#}
Featuretable16S <- data.frame( Featuretable16S, Taxon = c(taxonomy$Taxon))

BirdTrail.df <- data.frame(
  Featuretable16S$ID,
  Featuretable16S$WS028_S161,
  Featuretable16S$WS029_S141,
  Featuretable16S$WS031_S151,
  Featuretable16S$WS034_S142,
)

AndrewsMem.df <- data.frame(
  Featuretable16S$ID,
  Featuretable16S$WS023_S167,
  Featuretable16S$WS026_S140,
  Featuretable16S$WS027_S171,
  Featuretable16S$WS032_S170,
  Featuretable16S$WS035_S152,
  Featuretable16S$WS036_S172
  )


taxonomy.short <- aggregate(taxonomy, by = list(taxonomy$Taxon), "mean")
Featuretable16S.short <- aggregate(Featuretable16S[2:(ncol(Featuretable16S)-1)], by = list(Featuretable16S$Taxon), sum, drop=TRUE) #this looks so dumb lmao
Featuretable16S.long <- melt(Featuretable16S.short, id="Group.1", measure = c(colnames(Featuretable16S.short[2:ncol(Featuretable16S.short)])))

ggplot() +
  geom_tile(aes(x = Group.1 ,y = variable, fill = value), data = Featuretable16S.long)

  

