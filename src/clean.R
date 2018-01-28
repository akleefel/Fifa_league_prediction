#Script that cleans data, removes specific features based on domain knowledge and 
#changes "character" features into numerical representations 
#
#Alexander Kleefeldt - January 2018
#
suppressPackageStartupMessages(library(tidyverse))

data_fifa <- read_csv("../raw_data/fifa.csv")


#remove features based on domain knowledge
#features excluded: are implicitly too related with target (wage,...), are duplicates
#or variables needed by the game developers (club_logo ...)

data_fifa <- data_fifa %>% 
  select(-ID, -name, -full_name, -club, -club_logo, -birth_date, -real_face, -flag,
         -nationality, -photo, -eur_release_clause, -eur_wage, -photo, -special, 
         -body_type)

#replacing True/False variables with 1/0 

data_fifa <- data_fifa %>% 
  mutate(`1_on_1_rush_trait` = as.factor(ifelse(`1_on_1_rush_trait`=="True", 1,0)),
         acrobatic_clearance_trait= as.factor(ifelse(acrobatic_clearance_trait=="True", 1,0)),
         argues_with_officials_trait= as.factor(ifelse(argues_with_officials_trait=="True", 1,0)),
         avoids_using_weaker_foot_trait = as.factor(ifelse(avoids_using_weaker_foot_trait=="True", 1,0)),
         backs_into_player_trait = as.factor(ifelse(backs_into_player_trait=="True", 1,0)),
         bicycle_kicks_trait = as.factor(ifelse(bicycle_kicks_trait=="True", 1,0)),
         cautious_with_crosses_trait = as.factor(ifelse(cautious_with_crosses_trait=="True", 1,0)),
         chip_shot_trait = as.factor(ifelse(chip_shot_trait=="True", 1,0)),
         chipped_penalty_trait = as.factor(ifelse(chipped_penalty_trait=="True", 1,0)),
         comes_for_crosses_trait = as.factor(ifelse(comes_for_crosses_trait=="True", 1,0)),
         corner_specialist_trait = as.factor(ifelse(corner_specialist_trait=="True", 1,0)),
         diver_trait = as.factor(ifelse(diver_trait=="True", 1,0)),
         dives_into_tackles_trait = as.factor(ifelse(dives_into_tackles_trait=="True", 1,0)),
         diving_header_trait = as.factor(ifelse(diving_header_trait=="True", 1,0)),
         driven_pass_trait = as.factor(ifelse(driven_pass_trait=="True", 1,0)),
         early_crosser_trait = as.factor(ifelse(early_crosser_trait=="True", 1,0)),
         `fan's_favourite_trait`= as.factor(ifelse(`fan's_favourite_trait`=="True", 1,0)),
         finesse_shot_trait = as.factor(ifelse(finesse_shot_trait=="True", 1,0)),
         flair_trait = as.factor(ifelse(flair_trait=="True", 1,0)),
         flair_passes_trait = as.factor(ifelse(flair_passes_trait=="True", 1,0)),
         gk_flat_kick_trait = as.factor(ifelse(gk_flat_kick_trait=="True", 1,0)),
         gk_long_throw_trait = as.factor(ifelse(gk_long_throw_trait =="True", 1,0)),
         gk_up_for_corners_trait = as.factor(ifelse(gk_up_for_corners_trait =="True", 1,0)),
         giant_throw_in_trait =as.factor(ifelse(giant_throw_in_trait =="True", 1,0)),
         inflexible_trait = as.factor(ifelse(inflexible_trait =="True", 1,0)),
         injury_free_trait = as.factor(ifelse(injury_free_trait =="True", 1,0)),
         injury_prone_trait = as.factor(ifelse(injury_prone_trait =="True", 1,0)),
         leadership_trait = as.factor(ifelse(leadership_trait =="True", 1,0)),
         long_passer_trait = as.factor(ifelse(long_passer_trait =="True", 1,0)),
         long_shot_taker_trait = as.factor(ifelse(long_shot_taker_trait =="True", 1,0)),
         long_throw_in_trait = as.factor(ifelse(long_throw_in_trait =="True", 1,0)),
         one_club_player_trait = as.factor(ifelse(one_club_player_trait =="True", 1,0)),
         outside_foot_shot_trait = as.factor(ifelse(outside_foot_shot_trait =="True", 1,0)),
         playmaker_trait = as.factor(ifelse(playmaker_trait =="True", 1,0)),
         power_free_kick_trait = as.factor(ifelse(power_free_kick_trait =="True", 1,0)),
         power_header_trait =  as.factor(ifelse(power_header_trait =="True", 1,0)),
         puncher_trait = as.factor(ifelse(puncher_trait =="True", 1,0)),
         rushes_out_of_goal_trait = as.factor(ifelse(rushes_out_of_goal_trait=="True", 1,0)),
         second_wind_trait = as.factor(ifelse(second_wind_trait=="True", 1,0)),
         selfish_trait = as.factor(ifelse(selfish_trait=="True", 1,0)),
         skilled_dribbling_trait= as.factor(ifelse(skilled_dribbling_trait=="True", 1,0)),
         stutter_penalty_trait = as.factor(ifelse(stutter_penalty_trait =="True", 1,0)),
         swerve_pass_trait = as.factor(ifelse(swerve_pass_trait =="True", 1,0)),
         takes_finesse_free_kicks_trait = as.factor(ifelse(takes_finesse_free_kicks_trait =="True", 1,0)),
         target_forward_trait = as.factor(ifelse(target_forward_trait  =="True", 1,0)),
         team_player_trait = as.factor(ifelse(team_player_trait  =="True", 1,0)),
         technical_dribbler_trait = as.factor(ifelse(technical_dribbler_trait  =="True", 1,0)),
         tries_to_beat_defensive_line_trait = as.factor(ifelse(tries_to_beat_defensive_line_trait =="True", 1,0)),
         poacher_speciality = as.factor(ifelse(poacher_speciality =="True", 1,0)),
         speedster_speciality = as.factor(ifelse(speedster_speciality=="True", 1,0)),
         aerial_threat_speciality = as.factor(ifelse(aerial_threat_speciality=="True", 1,0)),
         dribbler_speciality = as.factor(ifelse(dribbler_speciality =="True", 1,0)),
         playmaker_speciality = as.factor(ifelse(playmaker_speciality =="True", 1,0)),
         engine_speciality = as.factor(ifelse(engine_speciality =="True", 1,0)),
         distance_shooter_speciality = as.factor(ifelse(distance_shooter_speciality =="True", 1,0)),
         crosser_speciality = as.factor(ifelse(crosser_speciality =="True", 1,0)),
         free_kick_specialist_speciality = as.factor(ifelse(free_kick_specialist_speciality =="True", 1,0)),
         tackling_speciality = as.factor(ifelse(tackling_speciality =="True", 1,0)),
         tactician_speciality = as.factor(ifelse(tactician_speciality =="True", 1,0)),
         acrobat_speciality = as.factor(ifelse(acrobat_speciality =="True", 1,0)),
         strength_speciality = as.factor(ifelse(strength_speciality =="True", 1,0)),
         clinical_finisher_speciality = as.factor(ifelse(strength_speciality =="True", 1,0)),
         prefers_rs = as.factor(ifelse(prefers_rs =="True", 1,0)),
         prefers_rw = as.factor(ifelse(prefers_rw =="True", 1,0)),
         prefers_rf = as.factor(ifelse(prefers_rf=="True", 1,0)),
         prefers_ram = as.factor(ifelse(prefers_ram=="True", 1,0)),
         prefers_rcm = as.factor(ifelse(prefers_rcm=="True", 1,0)),
         prefers_rm = as.factor(ifelse(prefers_rm=="True", 1,0)),
         prefers_rdm = as.factor(ifelse(prefers_rdm=="True", 1,0)),
         prefers_rcb = as.factor(ifelse(prefers_rcb=="True", 1,0)),
         prefers_rb = as.factor(ifelse(prefers_rb=="True", 1,0)),
         prefers_rwb = as.factor(ifelse(prefers_rwb=="True", 1,0)),
         prefers_st = as.factor(ifelse(prefers_st=="True", 1,0)),
         prefers_lw =  as.factor(ifelse(prefers_lw=="True", 1,0)),
         prefers_cf = as.factor(ifelse(prefers_cf=="True", 1,0)),
         prefers_cam = as.factor(ifelse(prefers_cam=="True", 1,0)),
         prefers_cm = as.factor(ifelse(prefers_cm=="True", 1,0)),
         prefers_lm = as.factor(ifelse(prefers_lm=="True", 1,0)),
         prefers_cdm = as.factor(ifelse(prefers_cdm=="True", 1,0)),
         prefers_cb = as.factor(ifelse(prefers_cb=="True", 1,0)),
         prefers_lb = as.factor(ifelse(prefers_lb=="True", 1,0)),
         prefers_lwb = as.factor(ifelse(prefers_lwb=="True", 1,0)),
         prefers_ls = as.factor(ifelse(prefers_ls=="True", 1,0)),
         prefers_lf = as.factor(ifelse(prefers_lf=="True", 1,0)),
         prefers_lam = as.factor(ifelse(prefers_lam=="True", 1,0)),
         prefers_lcm = as.factor(ifelse(prefers_lcm=="True", 1,0)),
         prefers_ldm = as.factor(ifelse(prefers_ldm=="True", 1,0)),
         prefers_lcb = as.factor(ifelse(prefers_lcb=="True", 1,0)),
         prefers_gk = as.factor(ifelse(prefers_gk=="True", 1,0)),
         fancy_flicks_trait = as.factor(ifelse(fancy_flicks_trait=="True", 1,0)),
         work_rate_att = as.factor(work_rate_att),
         work_rate_def = as.factor(work_rate_def),
         preferred_foot = as.factor(preferred_foot),
         league = as.factor(league))


#remove all goalkeepers and goalkeeper attributes 

data_fifa <- data_fifa %>%
  filter(prefers_gk == 0) %>%
  select(-rushes_out_of_goal_trait, -puncher_trait, -saves_with_feet_trait, -gk) %>% 
  mutate(league = as.factor(league))

#data_fifa <- data.frame(data_fifa)

#for simplicity include only european top-leagues
#adding country columns
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("Spanish", league),"Spain"," "))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("English", league),"England",country))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("Italian", league),"Italy",country))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("German", league),"Germany", country))
data_fifa <- data_fifa %>% mutate(country = ifelse(grepl("French", league),"France",country))


#remove countries that are not mentioned above 
data_fifa <- data_fifa %>% filter(country %in% c("England", "France", "Germany","Italy", "Spain"))


#only two leagues per country
data_fifa <- data_fifa %>% filter(!league %in% c("English League One","English League Two","German 3. Liga"))


write_csv(data_fifa,"../results/fifa_clean.csv")




#separate `league` fromd data frame as target variable 




#to remember which factor level is which league 
target_reminder <- as.data.frame(levels(as.factor(data_fifa$league)))

#adjusting factors to numerical representation
target <- data_fifa %>% mutate(league = as.numeric(as.factor(league))) %>% select(league)
print(target)




features <- data_fifa %>%
  mutate(work_rate_att = as.numeric(work_rate_att),
         work_rate_def = as.numeric(work_rate_def),
         preferred_foot = as.numeric(preferred_foot)) %>% 
  select(-league, -country, -eur_value)

write_csv(target, "../results/fifa_target.csv")

write_csv(features, "../results/fifa_features.csv")

write_csv(target_reminder, "../results/target_reminder.csv")



