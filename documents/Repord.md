# Fifa League Prediction



## Background

It is widely accepted that football (soccer) is the most popular sport worldwide.
There are many countries around the world in which football is an essential part of
national culture. Generally, issues surrounding the sport are heavily debated. In recent years, there have been many discussions on the different styles of football played in
the different European top-leagues and the ideal physical attributes and skills for the
various positions in each league. To shed some light on this topic, I used the Fifa '18  Dataset from Kaggle and tested a few machine learning algorithms with the goal of predicting the league affiliation of a player based on their physical attributes and their individual skills. Here, the goal was not to define which league is outlined by which specific set of skills and physical attributes but rather to see *if* there are underlying features that allow a classification of playeres.


## Description of Data and Data Exploration

As mentioned earlier, I worked with a dataset extracted from the FIFA '18 computer game containing information on 17,994 football players across 42 leagues. There is a total
of 185 variables to describe each player that can be roughly grouped into three
categories:

1. General information (name, club, age, league)
2. Physical attributes (height_cm, weight_kg, body_type)
3. Skill evaluation (overall, passing, shooting, pace, phisical, ... )

The following table displays a selection of the variables included in the data set.


![eda_table](../results/eda_table.png)


Note that variables like `age`, and `weight` are numerical, while variables like `diver_trait` (summarized in 'count_diver') are binary variables. The dataset consists of ~80 numerical and ~80 binary variables.

The following image shows the differences in the `heigh` across the different leagues. We hope that these differences across all variables are enough to allow classification.

![](../results/height.png)


## Approach


To get meaningful results and to facilitate the task of classification, I limited the number of leagues to the first 2 tears of the five largest European football nations (Enland, France, Spain, Italy, and Germany). This **reduced the number of players included in the analysis to 5314**. Further, to get


## Results


## Reflection
