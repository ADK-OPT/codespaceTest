library(tidyverse)
library(readxl)
library(dplyr)

ProjectA <- read_excel("Hours_Predict_R.xlsx",
                       sheet = "Project A",
                       range = "B2:G100",
                       col_names = TRUE)

ProjectB <- read_excel("Hours_Predict_R.xlsx",
                       sheet = "Project B",
                       range = "B2:G100",
                       col_names = TRUE)

ProjectC <- read_excel("Hours_Predict_R.xlsx",
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

ggplot(Project_data, aes(x = Task, y = Actuals))+
  geom_col()+
  theme_bw()

ggplot(Project_data, aes(x = Task, y = Actuals))+
  geom_col()+
  facet_wrap(vars(Project), scales = "free", ncol = 3)+
  theme_bw()

