### Exploratory Data Analysis Demo ###

### STEP 1 ----- 
# install the SmartEDA package
install.packages("SmartEDA")

# now, load the packages
library(SmartEDA)
library(readr) # contains read.csv function

### STEP 2 -----
# import a publicly-availible heart-failure dataset 
urlfile <-"https://raw.githubusercontent.com/sauravmishra1710/Heart-Failure-Condition-And-Survival-Analysis/master/Data/heart_failure_clinical_records_dataset.csv"
r <-read.csv(urlfile)
# the dataset, named "r" will now appear in your environment
# add some extra details to make the dataset easier to analyze and present (optional)

  # 2.1. change factor levels (Changes 0 and 1 to No and Yes)
r$anaemia <- factor(r$anaemia, levels = c(0, 1), labels = c("No", "Yes"))
r$diabetes <- factor(r$diabetes, levels = c(0, 1), labels = c("No", "Yes"))
r$high_blood_pressure <- factor(r$high_blood_pressure, levels = c(0, 1), labels = c("No", "Yes"))
r$smoking <- factor(r$smoking, levels = c(0, 1), labels = c("Non-smoker", "Smoker"))
r$sex <- factor(r$sex, levels = c(0, 1), labels = c("Woman", "Man"))
  # survival can be a category or a boolean variable, categorical is better in this case
  # r$DEATH_EVENT <- as.logical(as.numeric(r$DEATH_EVENT) - 1)
r$DEATH_EVENT <- factor(r$DEATH_EVENT, levels = c(0, 1), labels = c("Survived", "Died"))

  # 2.2. re-name variables so they are easier to understand in the report
names(r) <- c(
  age = "Patient Age",
  anaemia = "Anemia Status",
  creatinine_phosphokinase = "Creatine Phosphokinase",
  diabetes = "Diabetes Status",
  ejection_fraction = "Ejection Fraction (%)",
  high_blood_pressure = "Hypertension Status",
  platelets = "Platelet Count",
  serum_creatinine = "Serum Creatinine",
  serum_sodium = "Serum Sodium", 
  sex = "Patient Sex", 
  smoking = "Smoking Status", 
  time = "Follow-Up Time (Days)",
  DEATH_EVENT = "Survival Status"
)

# Optional, if issues occur convert the factor variables to character variables as a last step
# r[] <- lapply(r, function(x) if(is.factor(x)) as.character(x) else x)

### STEP 3 -----
# Analyze the data

# 3.1. Explore an entire dataset as is
ExpReport(r, op_file = "EDA Report.html")

# 3.2. Stratify a dataset by a target variable (the variable of interest !)
ExpReport(r, Target = "Survival Status", op_file = "EDA Report.html", Rc = "Survived")
