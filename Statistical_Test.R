library(MASS) # polr
library(generalhoslem) # lipsitz, logitgof
library(texreg) # knitreg (AIC,BIC)
library(lmtest) # P-Value

############################### COSTANT #######################################

###############################################################################
############################ DATA PREPARATION #################################
###############################################################################

pd <- read.csv("/Users/lorenzoleoni/Desktop/Materiale Personale/Database/OLM.csv")

pd$Winvalue <- as.factor(pd$Winvalue)

###############################################################################
########################## ORDERED LOGIT MODELS ###############################
###############################################################################

mod <- polr(Winvalue ~ log_ratio_Value + Home_Performance + Away_Performance,
            data = pd,
            method = c("logistic"))

###############################################################################

mod_intG <- polr(Winvalue ~ log_ratio_Value + Home_Performance + Away_Performance
             + Home_Diff_Goals + Away_Diff_Goals,
             data = pd,
             method = c("logistic"))

###############################################################################

mod_intC <- polr(Winvalue ~ log_ratio_Value + Home_Performance + Away_Performance
             + Cup_Home + Cup_Away,
             data = pd,
             method = c("logistic"))

###############################################################################
############################ STATISTICAL TESTS ################################
###############################################################################

lipsitz.test(mod,g=10) 
# Lipsitz Test, LR statistic = 18.385, df = 9, p-value = 0.03096

logitgof(pd$Winvalue, fitted(mod), g = 10, ord = TRUE) 
# Hosmer-Lemeshow Test, X-squared = 36.859, df = 17, p-value = 0.003516

knitreg(mod) # AIC 515.28, BIC 533.17

###############################################################################

lipsitz.test(mod_intG,g=10) # Lipsitz Test, p-value = 0.1515

logitgof(pd$Winvalue, fitted(mod_intG), g = 10, ord = TRUE) 
                                  # Hosmer-Lemeshow Test, p-value = 0.01542

knitreg(mod_intG) # AIC 517.32, BIC 542.38

###############################################################################

lipsitz.test(mod_intC,g=10) # Lipsitz Test, p-value = 0.3728

logitgof(pd$Winvalue, fitted(mod_intC), g = 10, ord = TRUE) 
                                  # Hosmer-Lemeshow Test, p-value = 0.1678

knitreg(mod_intC) # AIC 518.92, BIC 543.98

###############################################################################

############################### LINEUPS #######################################

###############################################################################
############################ DATA PREPARATION #################################
###############################################################################

pd <- read.csv("/Users/lorenzoleoni/Desktop/Materiale Personale/Database/OLM_ln.csv")

pd$Winvalue <- as.factor(pd$Winvalue)

###############################################################################
########################## ORDERED LOGIT MODELS ###############################
###############################################################################

mod <- polr(Winvalue ~ log_ratio_ln_TM + Home_Performance + Away_Performance,
            data = pd,
            method = c("logistic"))

###############################################################################

mod_intG <- polr(Winvalue ~ log_ratio_ln_TM + Home_Performance + Away_Performance
                 + Home_Diff_Goals + Away_Diff_Goals,
                 data = pd,
                 method = c("logistic"))

###############################################################################

mod_intC <- polr(Winvalue ~ log_ratio_ln_TM + Home_Performance + Away_Performance
                 + Cup_Home + Cup_Away,
                 data = pd,
                 method = c("logistic"))

###############################################################################
############################ STATISTICAL TESTS ################################
###############################################################################

lipsitz.test(mod,g=10) 
# Lipsitz Test, LR statistic = 2.3961, df = 9, p-value = 0.9835

logitgof(pd$Winvalue, fitted(mod), g = 10, ord = TRUE) 
# Hosmer-Lemeshow Test, X-squared = 11.811, df = 17, p-value = 0.8114

knitreg(mod) # AIC 502.88, BIC 520.78

###############################################################################

lipsitz.test(mod_intG,g=10) 
# Lipsitz Test, LR statistic = 7.9988, df = 9, p-value = 0.5343

logitgof(pd$Winvalue, fitted(mod_intG), g = 10, ord = TRUE) 
# Hosmer-Lemeshow Test, X-squared = 17.631, df = 17, p-value = 0.4125

knitreg(mod_intG) # AIC 502.52, BIC 527.57

###############################################################################

lipsitz.test(mod_intC,g=10) 
# Lipsitz Test, LR statistic = 1.8485, df = 9, p-value = 0.9936

logitgof(pd$Winvalue, fitted(mod_intC), g = 10, ord = TRUE) 
# Hosmer-Lemeshow Test, X-squared = 12.081, df = 17, p-value = 0.7952

knitreg(mod_intC) # AIC 506.65, BIC 531.71

###############################################################################

################################## ELO ########################################

###############################################################################
############################ DATA PREPARATION #################################
###############################################################################

pd <- read.csv("/Users/lorenzoleoni/Desktop/Materiale Personale/Database/OLM_elo.csv")

pd$Winvalue <- as.factor(pd$Winvalue)

###############################################################################
########################## ORDERED LOGIT MODELS ###############################
###############################################################################

mod <- polr(Winvalue ~ log_ratio_ln_TM + Home_Performance + Away_Performance
            + ratio_Elo,
            data = pd,
            method = c("logistic"))

###############################################################################

mod_intG <- polr(Winvalue ~ log_ratio_ln_TM + Home_Performance + Away_Performance
                 + ratio_Elo + Home_Diff_Goals + Away_Diff_Goals,
                 data = pd,
                 method = c("logistic"))

###############################################################################

mod_intC <- polr(Winvalue ~ log_ratio_ln_TM + Home_Performance + Away_Performance
                 + ratio_Elo + Cup_Home + Cup_Away,
                 data = pd,
                 method = c("logistic"))

###############################################################################
############################ STATISTICAL TESTS ################################
###############################################################################

lipsitz.test(mod,g=10) 
# Lipsitz Test, LR statistic = 4.2436, df = 9, p-value = 0.8947

logitgof(pd$Winvalue, fitted(mod), g = 10, ord = TRUE) 
# Hosmer-Lemeshow Test, X-squared = 14.066, df = 17, p-value = 0.6625

knitreg(mod) # AIC 504.87, BIC 526.35

###############################################################################

lipsitz.test(mod_intG,g=10) 
# Lipsitz Test, LR statistic = 14.772, df = 9, p-value = 0.09739

logitgof(pd$Winvalue, fitted(mod_intG), g = 10, ord = TRUE) 
# Hosmer-Lemeshow Test, X-squared = 25.323, df = 17, p-value = 0.08772

knitreg(mod_intG) # AIC 503.82, BIC 532.46

###############################################################################

lipsitz.test(mod_intC,g=10) 
# Lipsitz Test, LR statistic = 2.2443, df = 9, p-value = 0.987

logitgof(pd$Winvalue, fitted(mod_intC), g = 10, ord = TRUE) 
# Hosmer-Lemeshow Test, X-squared = 11.546, df = 17, p-value = 0.8268

knitreg(mod_intC) # AIC 508.64, BIC 537.28

###############################################################################
