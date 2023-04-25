library(tidyverse)
library(readxl)
library(dplyr)

### For this Section run all lines of code, read instructions starting at line 47

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



ProjectA <- ProjectA %>% 
  mutate(ProjectA = "ProjectA")
ProjectB <- ProjectB %>% 
  mutate(ProjectA = "ProjectB")
ProjectC <- ProjectC %>% 
  mutate(ProjectA = "ProjectC")

Project_data <- bind_rows(ProjectA,ProjectB,ProjectC)

Project_data <- Project_data %>%   ##Deletes rows with NA
  drop_na()

Project_data <- Project_data %>% 
  mutate(percent_of_budget = Actuals/Budget*100)

Project_data <- Project_data %>% 
  rename(Project = ProjectA)

## Below we will be working on plotting our data
# ggplot() first needs the data indicated to be plotted.
# next ggplot takes on another function aes()
# aes() we indicate what we want on x and y axis

# We want to plot how many hours are being spent on each task

# our X axis we want data from the Task column
# our Y axis we want Actuals Plotted

# when completeing, do not put " " around the column Name


ggplot(Project_data, aes(x = , y = ))+
  geom_col()+
  theme_bw()


# The plot above shows how much actual time spent for all projects,
# lets assume we wanted a plot for each project
# we will need aditional function facet_wrap()


ggplot(Project_data, aes(x = , y = ))+
  geom_col()+
  facet_wrap(vars(), scales = "free", ncol = 3)+ #inside of vars() we want to put Project column to get a plot each project
  theme_bw()
