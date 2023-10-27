# intro -------------------------------------------------------------------
# This is a script to quickly calculate stats for the entire data and stats for
# each deck.


# load packages -----------------------------------------------------------
library(tidyverse)


# load data ---------------------------------------------------------------
snap_data <- read_csv("<ENTER_FILE_HERE>")

View(snap_data)
glimpse(snap_data)


# summary stats -----------------------------------------------------------
summ_stats <- snap_data %>% 
    summarize(total_games = n(), 
              cube_rate = sum(cubes_result) / n(), 
              total_cubes = sum(cubes_result), 
              win_percentage = (length(which(snap_data$match_result == 'Win')) / n()) * 100,
              wins = length(which(snap_data$match_result == 'Win')), 
              losses = length(which(snap_data$match_result == 'Loss' | snap_data$match_result == 'Retreat')),
              true_losses = length(which(snap_data$match_result == 'Loss')),
              retreats = length(which(snap_data$match_result == 'Retreat'))
              )
View(summ_stats)


# deck stats --------------------------------------------------------------
deck_stats <- snap_data %>% 
    group_by(deck) %>% 
    summarize(total_games = n(), 
              cube_rate = sum(cubes_result) / n(), 
              total_cubes = sum(cubes_result), 
              win_percentage = sum(match_result == 'Win') / n() * 100,
              wins = sum(match_result == 'Win'),
              losses = sum(match_result == 'Loss' | match_result == 'Retreat'),
              true_losses = sum(match_result == 'Loss'),
              retreats = sum(match_result == 'Retreat')
              )
View(deck_stats)
    
