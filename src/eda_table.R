#Script that loads fifa_clean.csv and creates and EDA Table 
#
#
#Alexander Kleefeldt - January 2018
#

library(tidyverse)
library(gridExtra)


data_fifa <- read_csv("../results/fifa_clean.csv")


eda_table2 <- data_fifa %>% group_by(league) %>% 
  summarise(player_count = n(),
            avg_passing = mean(pas),
            avg_pace = mean(pac), 
            count_diver = sum(diver_trait))

            

eda_table2 <- as.data.frame(eda_table2)

png("../results/eda_table.png", height = 50*nrow(eda_table2), width = 150*ncol(eda_table2))
grid.table(eda_table2,rows = NULL)
dev.off()
















