library(worldfootballR)

delete.na <- function(DF, n=0) {
  DF[rowSums(is.na(DF)) <= n,]
} # function to delete NA

mapped_players <- read.csv("/Users/lorenzoleoni/Desktop/Player.txt",
                           sep = ",") 
      # import database with urls for each player

SerieA <- get_match_urls(country = "ITA", 
                         gender = "M", 
                         season_end_year = 2022, 
                         tier="1st")

SerieA <- SerieA[-c(181)] # drop Udinese vs Salernitana, match postponed

lineups <- get_match_lineups(match_url = SerieA)

ln <- lineups[,c('Matchday',
                 'Team',
                 'Player_Name',
                 'Starting',
                 'Min',
                 'PlayerURL')] # important features

names(ln)[names(ln) == 'PlayerURL'] <- 'UrlFBref'

SerieA <- merge(ln,
                mapped_players,
                by="UrlFBref")

Values <- get_player_market_values(country_name = "", 
                                                  start_year = 2021,
league_url = "https://www.transfermarkt.it/serie-a/startseite/wettbewerb/IT1")

names(Values)[names(Values) == 'player_url'] <- 'UrlTmarkt'

Values <- Values[,c('player_market_value_euro',
                                          'UrlTmarkt')]

SerieA <- merge(SerieA,
                Values,
                by="UrlTmarkt")

names(SerieA)[names(SerieA) == 'player_market_value_euro'] <- 'TMValue'

SerieA <- SerieA[,c('Matchday',
                    'Team',
                    'Player_Name',
                    'Starting',
                    'Min',
                    'TMValue')] # important features

SerieA <- delete.na(SerieA)
