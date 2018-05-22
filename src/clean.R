#Script that cleans data, removes specific features based on domain knowledge and 
#
#
#Alexander Kleefeldt - January 2018
#
suppressPackageStartupMessages(library(tidyverse))

data_fifa <- read_csv("../raw_data/fifa.csv")


#remove all goalkeepers 

data_fifa <- data_fifa %>% filter(prefers_gk == 'False')

#remove features based on domain knowledge
#final df should only include physical attributes and skills


drop_cols <- c(grep("prefers_", names(data_fifa), value=T),
            grep("gk_", names(data_fifa), value = T),
            'name', 'full_name','club', 'club_logo', 'birth_date', 'real_face', 'flag',
            'nationality', 'photo', 'eur_release_clause', 'eur_wage', 'special',
            'body_type', 'eur_value', 'international_reputation', 'gk', 'rs', 'rw', 'rf', 'ram',
            'rcm' , 'rm', 'rdm', 'rcb', 'rb', 'rwb', 'st', 'lw', 'cf', 'cam', 'cm', 'lm', 
            'cdm', 'cb', 'lb', 'lwb', 'ls', 'lf', 'lam', 'lcm', 'ldm', 'lcb',
            'rushes_out_of_goal_trait', 'puncher_trait', 'saves_with_feet_trait',
            'ID', 'club_logo', 'full_name', 'club', 'name', 'special')
    


data_fifa <- data_fifa %>% select(-one_of(drop_cols)) %>% 
  mutate(league = as.factor(league))


#only european top-leagues
#adding country columns
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("Spanish", league),"Spain"," "))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("English", league),"England",country))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("Italian", league),"Italy",country))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("German", league),"Germany", country))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("French", league),"France",country))


data_fifa <- data_fifa %>% filter(country %in% c("England", "France", "Germany","Italy", "Spain"))



data_fifa <- data_fifa %>% filter(league %in% c('Spanish Primera División',
                                                'French Ligue 1',
                                                'German Bundesliga',
                                                'English Premier League',
                                                'Italian Serie A'))


#replacing True/False variables with 1/0 
cols <- names(data_fifa[47:104])
data_fifa[,cols] <- lapply(data_fifa[,cols],as.logical)
data_fifa[cols] <- lapply(data_fifa[,cols], as.integer)


data_fifa <- data_fifa %>% 
  mutate(work_rate_att = as.integer(as.factor(work_rate_att)),
         work_rate_def = as.integer(as.factor(work_rate_def)),
         preferred_foot = as.integer(as.factor(preferred_foot)),
         league = as.factor(league))


write_csv(data_fifa,"../results/fifa_clean.csv")




# #to remember which factor level is which league 
# target_reminder <- as.data.frame(levels(as.factor(data_fifa$league)))
# 
# #adjusting factors to numerical representation
# target <- data_fifa %>% mutate(league = as.integer(as.factor(league))) %>% select(league)





