library(tidyverse)
library(ggplot2)
library(cowplot)

data_fifa <- read_csv("../results/fifa_clean.csv")

dim(data_fifa)
glimpse(data_fifa)


league_player_count <- ggplot(data_fifa, aes(league, fill = league))+
  geom_bar(identity = count)+
  scale_color_brewer(palette = "Pastel1")+
  theme_bw()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
  


height_plot <- ggplot(data_fifa, aes(league, height_cm, fill = league))+
  geom_boxplot(varwidth = TRUE)+
  ggtitle("Height")+
  theme_bw()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())


passing_plot <- ggplot(data_fifa, aes(league, pas, fill = league))+
  geom_boxplot(varwidth = TRUE)+
  ggtitle("Passing")+
  theme_bw()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

league_player_count

height_plot

passing_plot




