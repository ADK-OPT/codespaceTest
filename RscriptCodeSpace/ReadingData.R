library(tidyverse)
library(readxl)
library(dplyr)

ProjectA <- read_excel(path = "Hours_Predict_R.xlsx",
                       sheet = "Project A",
                       range = "B2:G100",
                       col_names = TRUE)

ProjectB <- read_excel(path = "Hours_Predict_R.xlsx",
                       sheet = "Project B",
                       range = "B2:G100",
                       col_names = TRUE)

## Try it yourslef
# Assuming that Project C follow patterns as ProjectA and ProjectB
# complete the read_excel function Below

ProjectC <- read_excel()


summary(ProjectA)
summary(ProjectB)
summary(ProjectC)