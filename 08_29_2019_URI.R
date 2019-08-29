# Intro to R

# How to find help?

?head() # How does the head function work?

# Download raw data

download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "portal_data_joined.csv")

# Read in data
surveys <- read.csv("portal_data_joined.csv")

# Inspect data
head(surveys)
View(surveys)

# Get data summary
summary(surveys)

# Load tidyverse library
install.packages("tidyverse")
library(tidyverse)

# Read in (Tidyverse)
surveys <- read_csv("portal_data_joined.csv")

head(surveys)
tail(surveys)

# Get unique plot types from surveys
unique(surveys$plot_type)

# Get number of columns and rows
nrow(surveys)
ncol(surveys)

# How to get data from 1995?
data_1995 <- filter(surveys,year == 1995)

# How do we get data from before 2001?
filter(surveys,year<2001)
filter(surveys,year <= 2001)

# ==
# >
# <
# >=
# <=
# !=
not_1995 <-  filter(surveys,year!=1995)

#CHALLENGE
# Filter the surveys dataset to all results from 2001.
data_2001 <- filter(surveys,year==2001)

# Filter the surveys dataset to only January records.
data_january <- filter(surveys,month==1)

# Removing missing data via filter
no_missing_weights <- filter(surveys,!(is.na(weight)))

# January observations from the year 1995
# & is 'and'
# | is 'or'
filter(surveys,year==1995 & month==1)
filter(surveys,year==1995 | year==1996)

# select() allows you to choose columns of interest

hibernation_data <- select(surveys,month,day,year,genus,species,taxa)
hibernation_data <- select(hibernation_data,year,month,day,genus,species,taxa)

no_label <- select(surveys,-species_id)

# CHALLENGE
# (1) Write a line of code to remove  the taxa column from surveys
no_label <- select(surveys,-taxa)
# (2) Make a new dataframe containing the plot_id,and species_id
plot_species <- select(surveys,plot_id,species_id)

# Get the weights of male animals in 1995
# STEP 1
male_data_1995 <- filter(surveys,year==1995 & sex=="M")
weight_male_1995 <- select(male_data_1995,weight)

filter(surveys,year==1995,sex=="M")

select(filter(surveys,year==1995,sex=="M"),weight)

male_1995_weight <- surveys %>% #Take surveys...
  filter(year==1995,sex=="M") %>% # Filter 1995 Males
  select(weight) # Get weight column

# Using pipes,make  a new DF containing data from the year 2000, 
# and with the columns genus, sex, weights