# Suggested solutions

# 1. With the dataset we have been working with, find country with 
# lowest fertility rate in 2003 and calculate its total CO2 
# emissions (CO2 per cap times population) for every year.


low.fert.country <- co2.df[co2.df$year==2003, ][which.min(co2.df$fertility[co2.df$year==2003]), "country"]
# We subset the dataframe twice

# Syntactically simpler, but uses more memory since it copies part of the dataset:
co2.2003.df <- co2.df[co2.df$year==2003, ]
low.fert.country <- co2.2003.df[which.min(co2.2003.df$fertility), "country"]

co2.df[co2.df$country==low.fert.country, "co2.emissions.per.cap"] * 
  co2.df[co2.df$country==low.fert.country, "population"]


# 2. Fit a panel data random effects model of the form:
# co2.emissions.per.cap ~ gdp + log(gdp) + military.exp

install.packages("plm")
library("plm")

test.plm <- plm(co2.emissions.per.cap ~ gdp + log(gdp) + military.exp.perc.gdp, data=co2.df, index=c("country", "year"), model="random")
      
summary(test.plm)

