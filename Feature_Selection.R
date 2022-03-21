
SerieA_Milan <- read.csv('/Users/lorenzoleoni/Desktop/Materiale Personale/Database/SerieA_Milan.csv', 
                         header = TRUE, sep = ",", dec = ".")

Milan <- SerieA_Milan[SerieA_Milan$Team == 'Milan',] # Milan matches

Opponent <- SerieA_Milan[SerieA_Milan$Team != 'Milan',] # Opponent matches

# Analysis

# Plot correlation
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  if(typeof(x|y)=="character") r <- biserial.cor(x, y)
  r <- cor(x, y, method = 'spearman')
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * abs(r))
}

# Plot histogram
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
}

# Feature Selection

names(df)[1] <- 'npxG_Expected'

Milan <- Milan[,-c(1:24,163)]

Opponent <- Opponent[,-c(1:24,163)]
# drop useless columns

i = 1

k = 2

df = as.data.frame(Milan[,'npxG_Expected'])

names(df)[1] <- 'npxG_Expected'

for (i in 1:141){
  
  if (abs(cor(df[,1],Milan[,i],method = 'spearman')) > 0.3){
    
    df <- cbind(df,Milan[,i])
    
    names(df)[k] <- names(Milan)[i]
    
    k = k + 1
    
  } # feature selection on AC Milan stats
  
  if (abs(cor(df[,1],Opponent[,i],method = 'spearman')) > 0.3){
    
    df <- cbind(df,Opponent[,i])
    
    names(df)[k] <- paste('Opponent',names(Opponent)[i])
    
    k = k + 1
    
  } # feature selection on opponent stats
  
}

df <- df[,c(1,11,15,19,27,35,36,40,52)] # selected only general variables

pairs(df,upper.panel=panel.cor,diag.panel=panel.hist) # plots
