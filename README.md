# Statistical Analysis on Classification and Forecasting Models in Football
Statistical analysis of ordered logit models on the classification of the results of Serie A 2021/2022 matches and prediction of the no penalty expected goal of AC Milan using generalized linear models.

- In data there are all the csv files necessary for R and Python codes:

  - Elo.csv, all teams elo updated in different dates
  - ln_TM.csv, all the players who took to the field for each team and for each match with their respective minutes of play
  - SerieA_21_22.csv, all statistics of all teams in all 27 matches considered
  - SerieA_Odds.csv, all the odds of all the games played up to the 27th matchweek
  - TM_Value_SerieA21_22.csv, Transfermarkt values for each team on 1st March
  - OLM.csv, dataset created after the first OLM with Transfermarkt values of each team constant for statistical analysis in R
  - OLM_ln.csv, dataset created after the second OLM with Transfermarkt values of each lineup for statistical analysis in R
  - OLM_Elo.csv, dataset created after the third OLM with Elo values of each team for statistical analysis in R
  - SerieA_Milan.csv, all statistics in each match played by AC Milan
  - Player.txt, values of over 70000 players around the world with their FBref and Transfermarkt links


- In R there are the following codes:

  - FBref_TM.R, where all the statistics are extrapolated
  - Statistical_Test.R, where all the OLMs created in Python were tested
  - Feature_Selection.R, where all the statistics in AC Milan match are filtered

- OLMs and GLMs.ipynb, it is the main code

- Statistical_Analysis_on_Classification_and_Forecasting_Models_in_Football.pdf, it is the report of the study
