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