# Importing Required Packages
import pandas as pd
from lifelines import KaplanMeierFitter # to fit the survival analysis


# Loading the the Patients data
Patient = pd.read_csv("C:/Users/SHAJIUDDIN MOHAMMED/Desktop/Module-Survival Analysis/Patient.csv")
Patient.head()
Patient.describe()

Patient["Followup"].describe()

# Followuo is referring to time 
F = Patient.Followup

# Initiating the KaplanMeierFitter model
kmf = KaplanMeierFitter()

# Fitting KaplanMeierFitter model on Time and Events for life
kmf.fit(F, event_observed=Patient.Eventtype)

# Time-line estimations plot 
kmf.plot()
