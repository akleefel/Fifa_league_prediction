#Script that loads fifa_clean.csv and creates some EDA plots
#
#
#Alexander Kleefeldt - January 2018
#
#
#

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
        axis.ticks.x=element_blank())+
  ylab("# Players")+
  ggtitle("Number of Players")
  


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

diver_df <- data_fifa %>% 
  group_by(league) %>% 
  summarise(divers = sum(diver_trait), total = n(), ratio = (divers/total)*100)


diver_plot <- ggplot(diver_df, aes(x= reorder(league, -ratio), y = ratio, fill = league))+
  geom_bar(stat = 'identity')+
  ggtitle("Share of Divers")+
  ylab('Share of Divers')+
  theme_bw()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

  
league_player_count

height_plot

passing_plot

diver_plot

ggsave("../results/Player_count.png", width = 7, height = 3, league_player_count)

ggsave("../results/height.png",width = 7, height = 3, height_plot)

ggsave("../results/passing.png",width = 7, height = 3, passing_plot)

ggsave("../results/diver.png",width = 7, height = 3, diver_plot)

