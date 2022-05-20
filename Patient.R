# Importing libraries for Survival Analysis
library(survminer)
library(survival)

# Loading the Patient Dataset
Patient <- read.csv(file.choose())
View(Patient)

attach(Patient)
str(Patient)


# Define variables 
time <- Followup
event <- Eventtype  # Event type can take 2 values 0 or 1

# Descriptive statistics
summary(time)
table(time)
table(event)

# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time,event) ~ 1)
summary(kmsurvival)

plot(kmsurvival, xlab="Time", ylab="Survival Probability")
ggsurvplot(kmsurvival, data=Patient, risk.table = TRUE)


# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ PatientID)
summary(kmsurvival1)

plot(kmsurvival1, xlab="Follow UP", ylab="Survival Probability")
ggsurvplot(kmsurvival1, data=Patient, risk.table = TRUE)

