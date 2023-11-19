
library(readxl) #allows us to read the excel file
library(here) #simplifies the use of relative paths
library(writexl) #allows to write into an excel file
library(lubridate) # simplifies the manipulation of dob into age
library(dplyr) # simplifies the grouping and joining operations

anonymizedData <- read.csv(here('data','anonymized_data.csv')) #reading the file

auxiliaryData <- read.csv(here('data', 'auxiliary_data.csv'), sep = ';') #reading the file
auxiliaryData <- auxiliaryData[c('name')] # dropping the superfluous columns

publicData <- read_excel(here('data', 'public_data.xlsx')) #reading the file
publicData1 <- subset(publicData, name %in% auxiliaryData$name) # dropping the superfluous rows

publicData1$citizenship <- NULL #this was dropped in the anonymised data_set hence it is no longer useful
publicData1$zip <- NULL # this was dropped in the anonymised data_set hence it is no longer useful
names(publicData1)[names(publicData1) == 'last_voted'] <- 'evote' #change the name column so it matches the other data set

publicData1[,'marital_status'][publicData1[,'marital_status'] == 'Never married'] <- 'Not married' #categorising the data
publicData1[,'marital_status'][publicData1[,'marital_status'] == 'Divorced'] <- 'Not married'
publicData1[,'marital_status'][publicData1[,'marital_status'] == 'Widowed'] <- 'Not married'
publicData1[,'marital_status'][publicData1[,'marital_status'] == 'Married/separated'] <- 'Married'

publicData1$age <- 2023 - year(publicData1$dob) # calculating age and categorising it
publicData1$dob <- NULL
publicData1[,'age_group'] <- NA
publicData1[,'age_group'][publicData1[,'age'] < 41] <- '18-40'
publicData1[,'age'][publicData1[,'age'] < 41] <- NA
publicData1[,'age_group'][publicData1[,'age'] < 71] <- '41-70'
publicData1[,'age_group'][publicData1[,'age'] > 70] <- '70+'
publicData1$age <- NULL 


anonymizedData$education <- NULL # dropping useless column for identification
groupedAnon <- anonymizedData %>% group_by(sex, evote, marital_status, age_group) %>% summarise(countIndividuals = n(), parties = n_distinct(party)) # grouping the data based on the quasi-identifiers


groupedAnonCompromised <- subset(groupedAnon, parties < 2) #getting the groups that had distinct quasi-identifiers and voted for only one party
anonCompromised <- inner_join(groupedAnonCompromised, anonymizedData, by = c('sex', 'evote', 'marital_status', 'age_group')) #joining with the anonymized data so the party is in the data-frame
anonCompromised <- anonCompromised %>% group_by(sex, evote, marital_status, age_group, party) %>% summarise(count = n()) # grouping again

anonCompromised <- inner_join(anonCompromised, publicData1, by = c('sex', 'evote', 'marital_status', 'age_group')) # joining with the public data so that the name matches
anonCompromised$count <- NULL #removing superfluous column
recordsCompromised <- anonCompromised[c('name', 'party')]

write_xlsx(anonCompromised, here('data', 'recordsCompromised.xlsx')) #saving the data
write.csv(recordsCompromised, here('data', 'recordsCompromised.csv'), row.names = FALSE)
