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
