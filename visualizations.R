# intro -------------------------------------------------------------------
# This is a script to quickly visualize total cubes over games played.


# load packages -----------------------------------------------------------
library(tidyverse)
library(ggdark)


# load data ---------------------------------------------------------------
snap_data <- read_csv("<ENTER_FILE_HERE>")

View(snap_data)
glimpse(snap_data)


# total cubes over games played -------------------------------------------
ggplot(snap_data, aes(x = index, y = cubes_total)) +
    geom_line() +
    geom_point(
        aes(color = deck), 
        size = 1.25
    ) +
    labs(
        title = "<ENTER_TITLE_HERE>",
        subtitle = "<ENTER_SUBTITLE_HERE>",
        x = "Games Played",
        y = "Total Cubes",
        color = "Deck"
    ) +
    dark_theme_gray() +
    theme(
        plot.title = element_text(size = 20, face = "bold"),
        plot.subtitle = element_text(size = 15, face = "bold"), 
        axis.title = element_text(size = 13), 
        legend.title = element_text(size = 15), 
        legend.position = "right"
    )


# save --------------------------------------------------------------------
ggsave(filename = "<ENTER_FILE_HERE>")

