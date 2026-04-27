library(tidyverse)
library(readr)

# -----------------------------
# 1. Load files
# -----------------------------
taxonomy <- read_tsv("C:/Users/srvan/Desktop/PhD Prep/2025-2026_PhD/Environmental Genomics/Project_Data/taxonomy.tsv")

feature_table <- read_tsv("C:/Users/srvan/Desktop/PhD Prep/2025-2026_PhD/Environmental Genomics/Project_Data/featuretable16S.tsv")

metadata <- read_csv("C:/Users/srvan/Desktop/PhD Prep/2025-2026_PhD/Environmental Genomics/Project_Data/metabarcode_metadata.csv")

# -----------------------------
# 2. Split taxonomy into columns
# -----------------------------
taxonomy_clean <- taxonomy %>%
  separate(
    Taxon,
    into = c("Kingdom","Phylum","Class","Order","Family","Genus","Species"),
    sep = ";\\s*",
    fill = "right",
    remove = FALSE
  ) %>%
  mutate(across(Kingdom:Species, ~str_remove(.x, "^[a-z]__")))

# -----------------------------
# 3. Join taxonomy to feature table
# -----------------------------
feature_with_taxa <- feature_table %>%
  left_join(taxonomy_clean, by = c("ID" = "Feature ID"))

# -----------------------------
# 4. Optional: make long format (better for plotting/analysis)
# -----------------------------
feature_long <- feature_with_taxa %>%
  pivot_longer(
    cols = starts_with("WS"),
    names_to = "SampleID",
    values_to = "Abundance"
  )

# -----------------------------
# 5. Save outputs
# -----------------------------
write_csv(feature_with_taxa,
          "C:/Users/srvan/Desktop/PhD Prep/2025-2026_PhD/Environmental Genomics/Project_Data/feature_with_taxonomy_wide.csv")

write_csv(feature_long,
          "C:/Users/srvan/Desktop/PhD Prep/2025-2026_PhD/Environmental Genomics/Project_Data/feature_with_taxonomy_long.csv")