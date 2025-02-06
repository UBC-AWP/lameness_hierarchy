library(EloRating)
library(RColorBrewer)
library(lubridate)
library(tidyr)
library(dplyr)
source("../../08-Lameness_rank_eloSteepness/code/eloSteepness_helpers.R")

# load in the data
expert_dir <- "../../05-Amazon_MTurk_expert_response_30cow_pairwise/results/all_experts/"
winner_loser <- read.csv(paste0(expert_dir, "winner_loser_merged_DW_NV_SB_KI.csv"), header = TRUE, sep = ",")
winner_loser_clean <- winner_loser[which(winner_loser$degree > 0),]

# set output directory
output_dir <- "../results/"

# load experts' eloSteepness results
expert_elo_dir <-"../../08-Lameness_rank_eloSteepness/results/"
expert_eloSteep <- read.csv(paste0(expert_elo_dir, "compare_summary.csv"), header = TRUE, sep = ",")
expert_eloSteep$X <- NULL
expert_eloSteep2 <- expert_eloSteep[, c("Cow", "NV_DW_SB_KI_experts_mean")]

# load GS
expert_gs_dir <- "../../03-30cow_GS_label_expert_response/results/"
gs_record <- read.csv(paste0(expert_gs_dir, "gs_response_combined_avg.csv"), header = TRUE, sep = ",")
gs_record2 <- gs_record[, c("Cow", "GS")]

#####################################################################
########################## Borda counting ###########################
#####################################################################

# create a unique cow df
unique_cow_list <- unique(c(winner_loser$winner, winner_loser$loser))
cow_df <- data.frame(Cow = unique_cow_list)

# Assuming your dataframe is named 'df'
borda_scores <- winner_loser_clean %>%
  count(winner, name = "borda_score") %>%  # Count occurrences in 'winner' column
  arrange(desc(borda_score))  # Sort by highest score
colnames(borda_scores)[which(colnames(borda_scores) == "winner")] <- "Cow"

borda_scores <- merge(borda_scores, cow_df, all = TRUE)
borda_scores <- borda_scores[order(-borda_scores$borda_score),]
master <- merge(borda_scores, expert_eloSteep2)
master <- merge(master, gs_record2)

output_file <- paste0(output_dir, "borda_results.csv")
write.csv(borda_scores, file = output_file, row.names = FALSE)

output_file <- paste0(output_dir, "borda_VS_eloSteep_VS_GS.csv")
write.csv(master, file = output_file, row.names = FALSE)
