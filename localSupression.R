


library(readxl) #allows us to read the excel file
library(here) #simplifies the use of relative paths
library(sdcMicro) #privacy package being used for the anonymization
library(writexl) #allows to write into an excel file


# loading the data
data <- read_excel(here('data', 'anonymized_data.xlsx'))

# removing the name column as this as it consists of only Null values
data <- data[,! names(data) %in% 'name']

# altering the invalid vote result to an NA
data[,'party'][data[,'party'] == 'Invalid vote'] <- NA

# selecting the quasi-identifier variables based on extra info available to attackers 
selectedKeyVars = c('sex', 'citizenship', 'marital_status', 'age_range', 'evote')

# selecting the sensitive variable
selectedSensitiveVar = c('party')

#creating the sdcMicro object for easier manipulation with the package
sdcInitial <- createSdcObj(dat         = data,
                           keyVars     = selectedKeyVars,
                           sensibleVar = selectedSensitiveVar)

# Getting the initial report
sdcInitial

# initializing the l-diversity measure for the data
sdcInitial <- ldiversity(obj = sdcInitial)

# getting a report of the l-diversity
sdcInitial@risk$ldiversity
sdcInitial@risk$ldiversity[,'party_Distinct_Ldiversity']

# trying out local Suppression, setting k-anonymity to 3
sdc1 <- localSuppression(sdcInitial, k = 3)
sdc1
sdc1 <- ldiversity(obj = sdc1, ldiv_index = c('party'))
sdc1@risk$ldiversity 
sdc1@risk$ldiversity[,'party_Distinct_Ldiversity']

# trying out local Suppression, setting k-anonymity to 5
sdc2 <- localSuppression(sdcInitial, k = 5)
sdc2
sdc2 <- ldiversity(obj = sdc2, ldiv_index = c('party'))
sdc2@risk$ldiversity 
sdc2@risk$ldiversity[,'party_Distinct_Ldiversity']

#The results from these l-diversity analysis seem like garbage to me, I'm probably doing something wrong
# But i don't know what, so I'll export the data, and analyse it in python

#converting the data back to data frames so it can be exported
data1 <- extractManipData(sdc1)
data1
data2 <- extractManipData(sdc2)
data2

#exporting the data
write_xlsx(data1, here('data', 'localSuppr1.xlsx'))
write_xlsx(data2, here('data', 'localSuppr2.xlsx'))

