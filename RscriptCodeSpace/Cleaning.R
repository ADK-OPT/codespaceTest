library(tidyverse)
library(readxl)
library(dplyr)


ProjectA <- read_excel("RscriptCodeSpace/Hours_Predict_R.xlsx",
                       sheet = "Project A",
                       range = "B2:G100",
                       col_names = TRUE)

ProjectB <- read_excel("RscriptCodeSpace/Hours_Predict_R.xlsx",
                       sheet = "Project B",
                       range = "B2:G100",
                       col_names = TRUE)

ProjectC <- read_excel("RscriptCodeSpace/Hours_Predict_R.xlsx",
                       sheet = "Project C",
                       range = "B2:G100",
                       col_names = TRUE)


summary(ProjectA)
summary(ProjectB)
summary(ProjectC)

## This section we will be cleaning the data.

#Lines 35-40 we will be using the Mutate() function
#Mutate() allows us to add a column into the dataframe
#Our goal is to merge the three project file into one dataframe
#We want to create an ID column, for this we are going to name that Column "ProjectA"

#following ProjectA and ProjectB, try ProjectC yourself

ProjectA <- ProjectA %>% 
  mutate(ProjectA = "ProjectA")
ProjectB <- ProjectB %>% 
  mutate(ProjectA = "ProjectB")
ProjectC <- ProjectC %>% 
  mutate()

Project_data <- bind_rows(ProjectA,ProjectB,ProjectC)

Project_data <- Project_data %>%   ##Deletes rows with NA
  drop_na()

Project_data <- Project_data %>% 
  mutate(percent_of_budget = Actuals/Budget*100)

Project_data <- Project_data %>% 
  rename(Project = ProjectA)

Project_data <- bind_rows(ProjectA,ProjectB,ProjectC)

Project_data <- Project_data %>%   ##Deletes rows with NA
  drop_na()

#Mutate can create columns using formulas.
#We want a column that calculates the percent of budget
# + adds values from columns
# - subtracts values from columns
# * multiplies values of columns
# / divides values from columns
#In mutate we want to divide the Actuals column divided by Budget and multiply by 100

Project_data <- Project_data %>% 
  mutate(percent_of_budget = )

Project_data <- Project_data %>% 
  rename(Project = ProjectA)
