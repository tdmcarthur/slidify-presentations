# The MIT License (MIT)
# 
# Copyright (c) 2016 Travis McArthur
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of 
# this software and associated documentation files (the "Software"), to deal in 
# the Software without restriction, including without limitation the rights to 
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
# of the Software, and to permit persons to whom the Software is furnished to do 
# so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# PRELIMINARIES: To run a single line in RStudio, put cursor on that line and press 
# Command + Enter (Mac) or Ctrl + Enter (Windows/Linux). To run multiple lines, 
# highlight the lines and press Command + Enter (Mac) or Ctrl + Enter (Windows/Linux).
# If you get lost, Command + Option + B (Mac) or Ctrl + Alt + B (Windows/Linux) 
# will get you back on track since it runs code from start of the file to the current line.

# If at any time you are running this code and see a bunch of 
# stacked plusses when you repeatedly press "return" like this:

# > ( 
# + 
# + 
# + 
# + 
# + 
# + 

# it means that R is waiting for you to close a parenthesis or 
# quotation. Just press "Esc" and re-enter your command.


# CONCEPTUAL FRAMEWORK OF R

# There are two types of things in R:
# 1. Objects
# 2. Functions

# Functions are used to operate on objects, usually to create a new object
# or transform the original object.

# Let's make a matrix to demonstrate how to use a function.
# The function c() is a basic function that groups together numbers 
# or character strings. 

# The "<-" sign ("less than" sign, minus sign) will assign our group
# of numbers to an object name. An object name is used to 
# succinctly refer to data. We'll call this "mat.input.v"


mat.input.v <- c(9, 56, 72, 4, 862, 263, 93, 49, 152)

c(9, 56, 72, 4, 862, 263, 93, 49, 152)

mat.input.v

# The matrix() function is used to form a matrix. Let's look at its help file.

?matrix


sample.data.mat <- matrix(data=mat.input.v, nrow=3)

# In RStudio, press tab after matrix(  to get arguments

sample.data.mat

# Let's change the default argument for "byrow"

sample.data.mat <- matrix(data=mat.input.v, nrow=3, byrow=TRUE)

sample.data.mat

# You can set arguments by name (what we just did) or by 
# the order in which they appear

matrix(mat.input.v, 3, 3, TRUE)

# The most common way to alter an object is to just overwrite it

sample.data.mat <- t(sample.data.mat)


# TYPES OF OBJECTS
# There are four basic types of objects in R.
# You have already seen two of them: a vector and a matrix.
# Let's explore the vector in more detail.

# Much of the terminology is R is based on linear algebra concepts.
# So an ordered set of numbers or character strings is called a vector.
# It's better to think of vector as an ordered set rather than a
# matrix with one column or one row since vectors in R have only one dimension.
# There are many ways to create a vector or extract a vector from 
# another object. We used the c() function to create mat.input.v

mat.input.v

# We can use the ":" operator to create a vector of all the integers
# that exist between two integers, inclusive.

one.hundred.v <- 1:100

one.hundred.v

# Let's look at a way to extract a vector from a dataset. 
# The read.csv() function is going to be your primary way to get
# a dataset into your R workspace

net.worth.df <- read.csv("http://www.opensecrets.org/db2dl/?q=PFDsWorth&cycle=2008&output=CSV", stringsAsFactors=FALSE)
# We have just created a "data frame" containing data on the net worth of
# Congresspeople, Supreme Court Justices, and certain executive branch officials

?read.csv

# You do not want to deal with "factors" until you get good at R, so we will not
# convert character strings to factors.
# (R uses factors to deal with categorical data, but in most circumstances 
# character data can behave like categorical data.)

# What did we just load? There are two main ways to examine what we have.

View(net.worth.df)

str(net.worth.df)

# What if we want to just extract one column and make it into a vector?
# There are two ways to do this. One way is:

congress.ppl.names.v <- net.worth.df$Name

# str() is indispensible when working your way through a data project.
# It can be used on any type of object, including a vector

str(congress.ppl.names.v)

# Another way to extract the column is:

congress.ppl.names.v <- net.worth.df[, "Name"]

# If we are unsure if two operations produce the exact same object,
# we can use identical()

identical(net.worth.df$Name, net.worth.df[, "Name"])

# What is up with these square brackets? Recall that R concepts are 
# usually based on linear algebra. This is subscript notation, and
# it is a key concept in R that you will use constantly. It is saying:
# object.name[select row(s), select column(s)]
# Rows are always before the comma and columns after.
# If the space before or after the comma is blank, R assumes that you
# want all the rows or all the columns.

# Unlike with the "$" operator, subscripts can be used to get more than 
# one column from a dataframe, although this makes a dataframe
# rather than just a vector

name.and.chamber.df <- net.worth.df[, c("Name", "chamber")]
	
str(name.and.chamber.df)

# You can select rows and columns by using numeric vectors or 
# logical vectors. Character vectors are mostly just for getting columns.

# Get first 5 rows
net.worth.df[1:5, c("Name", "AvgValue")]

# Exclude first 640 rows
net.worth.df[ -(1:640), c("Name", "AvgValue")]

# Only get those observations/records where the net worth is
# greater than 100,000,000
net.worth.df[net.worth.df$AvgValue > 100000000, c("Name", "AvgValue")]

net.worth.df[net.worth.df$AvgValue > 100000000, ]

# What is going on here? First a logical vector is produced and then 
# it is fed into the subscript 
net.worth.df$AvgValue > 100000000

net.worth.df[net.worth.df$chamber %in% c("E", "J"), ]
# Only get the people who are in the executive or judicial branches
# The %in% function asks: 
# "Which elements of net.worth.df$chamber are in the set c("E", "J")?"

# Not only will subscripting get you only the rows that you request,
# but if you use a numeric vector it will get you the rows in that order
net.worth.df[1:4, c("Name", "AvgValue")]
net.worth.df[4:1, c("Name", "AvgValue")]

net.worth.df[4:1, c("AvgValue", "Name")]

# This feature is used to sort datasets by columns, using order()
net.worth.df[order(net.worth.df$Name), c("Name", "AvgValue")]

# WARNING: sort() is not for sorting dataframes

# Until now, we have assigned stuff to new objects
# We can also assign stuff to parts of already-existing objects

net.worth.df$chamber[net.worth.df$chamber=="S"] <- "Senate"
net.worth.df$chamber[net.worth.df$chamber=="H"] <- "House"
# This says, "For all elements of the chamber column such that the value
# of chamber is 'S', replace those elements with 'Senate'"

# This is an equivalent operation:
net.worth.df[net.worth.df$chamber=="S", "chamber"] <- "Senate"
# Why? Be precise.


# We can name everything

greeks.v <- 1:5
greeks.v
names(greeks.v) <- c("alpha", "beta", "gamma", "delta", "epsilon")
greeks.v
greeks.v["gamma"]
# And then access the values by name
# Big change from MATLAB

colnames(sample.data.mat) <- c("id", "gdp", "pop")
rownames(sample.data.mat) <- c("a", "b", "c")

sample.data.mat
sample.data.mat["b", "pop"]



# Almost every object or result of a function can be used as an input
# for a function. The standard parethetical order of operations prevails,
# i.e. the innermost function is evaluated first.

nrow(net.worth.df)
nrow(net.worth.df)/100
round(nrow(net.worth.df)/100)
rep("test", times=round(nrow(net.worth.df)/100))
# Building up the operation one step at a time


tt <- nrow(net.worth.df)
mm <- tt/100
bb <- round(mm)
rep("test", times=bb)

# My personal style is more the first example - everything evaluated
# at once on one line, within reason.

# Let's stop for a sec to note some important details:
# 1. All object names and functions are case-sensitive
# sample.df does not equal Sample.df

one.hundred.v
One.Hundred.V
	
# 2. Allowable object and function names can include letters,
# numbers, periods, and underscores. No spaces are allowed in these names.

# 3. Adding ".df", ".mat", or ".v" is unnecessary. This is my personal
# style. I find it useful since you often have the same data in different
#	forms and keeping track of what all your objects are can be hard without
# these identifiers.

# 4. Spaces between object names and operators are ignored. Spaces
# are useful for making your code clear and readable to others and yourself.

matrix(data=mat.input.v, nrow=3)
# is the same as
matrix(  data=mat.input.v  , nrow =  3)

# You can even do this
chambers.mat <- matrix  (net.worth.df$   chamber)
# But don't do that since it makes the code confusing to the reader


# 5. If R thinks that a statement continues on the next line,
# it will interpret it the same as one statement on one line
matrix(data=mat.input.v, 
  nrow=3)

TRUE & TRUE & FALSE & 
	FALSE

# You must give it a reason to think the operation continues, though
3 + log(10)
* 35

# 6. Conversion between object types and data formats is 
# straighforward, but be careful.

as.data.frame(sample.data.mat)

as.logical(c(1, 0, 0, 1, 0))

as.numeric(c("2", "4", "90", "junk", "24"))

# 7. The main difference between matrices and data frames is that
# all data within a matrix must be of a single type (numeric,
# character, logical), while each column of a data frame can
# be a different data type

# 8. If you're using RStudio, the upper right panel lists the 
# objects you've created in your workspace, along with a 
# summary of their contents. To easily view the names of
# your workspace objects in your console, type:
ls()
# It works whether you are using RStudio or not.



# Control flow features

if (nrow(net.worth.df) > 400) {
  cat("yup")
}
# The cat() function just prints character strings to the console 

if (nrow(net.worth.df) < 400) {
	cat("yup")
} else {
  cat("nope")
}


for ( i in 1:nrow(net.worth.df)) {
  cat("Print this", i, "\n")
}

# R has a full suite of control flow features like while, 
# break, next, switch, etc.


# Constructing functions

# Basic structure of a function:

# function name <- function( argument names ) {
#   do stuff
#   last line is the output
# } 

VV.line.fn <- function(rho, sigma, n, alpha) {
  A <- ifelse(n <= 1, alpha, 1-alpha)
  A/(rho*sigma*n)
}

# This function is basically just an arithmetic operation, but
# keep in mind that you can get much more creative with writing functions

n.sequence <- seq(0, 6, length.out=6*30)

VV.line <- VV.line.fn(rho=.95, sigma=3.2, n=n.sequence,  alpha=.14)

plot(n.sequence, VV.line, type="l", col="red", ylim=c(0,.4))
  


# We have covered matrices, dataframes, and vectors.
# There is a fourth basic data type: Lists

# Lists are the most foreign idea for Stata and MATLAB users.

# A list is a structured, possibly hierarchical, collection of objects.
# Don't think of list as in shopping list.

kitchen.sink.ls <- list(sample.data.mat, one.hundred.v, net.worth.df[1:5, ])

kitchen.ls <- list(c("stove", "fridge", "toaster"), kitchen.sink.ls)

str(kitchen.ls)

kitchen.sink.ls[[2]]
# Gets the 2nd element of the list
kitchen.sink.ls[1:2]
# Makes a list containing the 1st and 2nd element of this list


# Unlike in MATLAB, functions always return a single object in R

# In MATLAB:
# function[average, st_dev] =  summary_stats(x)
#   average = mean(x);   
#   st_dev = sd(x);   
# end

# In R, we would pack our results into a list

summary_stats <- function(x) {
  ret <- list()
  # Initiate a list object (create an empty list)
  ret$average <- mean(x)
  ret$st_dev <- sd(x)
  ret
}

summary_stats(rnorm(500))

# Unlike in MATLAB, you do not need to put your functions into a separate file.
# R stores the function as it reads your script file.
# If you choose to, you can put functions in a separate file from your analysis file,
# but you must ask R to read the functions with source() before running your analysis.


# <INTERLUDE: GO TO SLIDES>


# EXAMPLE ANALYSIS

co2.df <- read.csv("http://tdmcarthur.github.io/slidify-presentations/r-intro/worldbank.csv", stringsAsFactors=FALSE)

colnames(co2.df) <- c("country", "year", "co2.emissions.per.cap", "electric.consumption", "total.energy.use", "fertility", "gdp.per.cap", "internet.users", "life.exp", "military.exp.perc.gdp", "population", "hiv.rate")
# Rename column names to make them shorter

lm(co2.emissions.per.cap ~ gdp.per.cap + log(gdp.per.cap) + military.exp.perc.gdp + internet.users,  data=co2.df)

# Is that all R knows about this model?

summary( lm(co2.emissions.per.cap ~ gdp.per.cap + log(gdp.per.cap) + military.exp.perc.gdp + internet.users,  data=co2.df))

co2.lm <- lm(co2.emissions.per.cap ~ gdp.per.cap + log(gdp.per.cap) + military.exp.perc.gdp + internet.users,  data=co2.df)

# The co2.lm object is a list

str(co2.lm)

co2.lm$coefficients
# Access the coefficient values with the list syntax
coef(co2.lm)
# Or through the coef() function for convenience
resid(co2.lm)

if ( !require("lmtest") ) { install.packages("lmtest") }
if ( !require("sandwich") ) { install.packages("sandwich") }
library("lmtest")
library("sandwich")

coeftest(co2.lm, vcov=vcovHC(co2.lm))
# Heteroskedasticity correction


# Let's tabulate things
table(co2.df$year)

# Since our data is continuous, it's hard to have sensible cross tabulations.
# Let's just tabulate the number of countries with GDP per capita > 3000 by year
table(co2.df$year, co2.df$gdp.per.cap > 3000)

aggregate(co2.emissions.per.cap ~ year, data=co2.df, FUN=sum, na.rm=TRUE)

# Why do we write na.rm=TRUE when aggregate() has no such argument named na.rm?

aggregate( cbind(co2.emissions.per.cap, gdp.per.cap) ~ year + round(fertility) , data=co2.df, FUN=sum, na.rm=TRUE)

# aggregate() is actually quite general, and any function, not just sum(), can be applied to a group of observations

plot(log(co2.df[co2.df$year==2000, "gdp.per.cap"]), 
  log(co2.df[co2.df$year==2000, "co2.emissions.per.cap"]), 
  col="transparent")
# No points are actually plotted here, since color is set to "transparent".
# This just sets up the plot area.

text(log(co2.df[co2.df$year==2000, "gdp.per.cap"]), 
  log(co2.df[co2.df$year==2000, "co2.emissions.per.cap"]), 
  labels=substr(co2.df[co2.df$year==2000, "country"], 1, 2), 
  cex=.7)

# Let's show off some of the power of R's syntax.

# We are missing a lot of life expectancy data

summary(co2.df)

# Interpolating missing data for life expectancy by country:
imputed.co2.ls <- by(co2.df,  INDICES=co2.df$country, FUN=function(x) {
  if (sum(is.na(x$life.exp))==6) {return(x)}
  # If all life expectancy data is missing, we cannot interpolate, so
  # we return the original data frame
  
  x.lm <- lm( log(life.exp) ~ year, data=x)
  # Fit a regression, with the logarithm of life expectancy predicted by year
  
  missing.years.df <- data.frame( year = x$year[is.na(x$life.exp)] )
  # Create a new data frame with the year variable being the missing years
  # of the original data frame.
  
  x.pred <- predict(x.lm, newdata=missing.years.df) 
  # Predict the missing values based on the regression model
  
  x$life.exp[is.na(x$life.exp)] <- exp(x.pred)
  # Turn the predicted life expectancy, which is in logarithm, back to actual years
  # (yes, we probably run into Jensen's inequality here, but let's ignore that for now)
  
  x
  # Return the modified data frame
  }
)

# by() returns a list

str(imputed.co2.ls)

imputed.co2.ls[["Belarus"]]

imputed.co2.df <- do.call(rbind, imputed.co2.ls)
# NOTE: rbindlist() from the data.table package is much faster if you have lots of data


# Last things:

??"standard deviation"

getwd()

setwd()

# At the console, press the up arrow to get commands previously entered.

# Unlike in Matlab, * is element-by-element multiplication, corresponding to .* in Matlab.
# In R, %*% is standard matrix multiplication.

with(co2.df, fertility + life.exp * internet.users / log(gdp.per.cap))
# Easier-to-read syntax if you have lots of operations with a single data frame

write.csv(co2.df, "CO2 imputed.csv")

save(co2.df, file="CO2 imputed.RData")

# Use the "foreign" package to read data from Stata, MATLAB, and SPSS formats

# To get data from an xls, just save it as a csv in Excel

# If you use Windows, you must double the back slashes when writing a filepath.
# Example: "Desktop\\Data project\\My data.csv"

# Do not use attach(), even though many intro manuals ask you to use it

# We have not covered "methods", "classes", and "attributes", but these
# concepts are pretty intuitive


# WHERE TO GO FROM HERE:

# Some commonly-used packages:

# reshape2
# stringr
# plyr
# dplyr
# ggplot2
# RColorBrewer
# stargazer

# Further resources:

# "R" is hard to Google. This is the solution:
# http://rseek.org/

# Good for "How do I do X?" basics:
# http://www.statmethods.net/

# Professional, modular R tutorials:
# https://www.datacamp.com/

# Interactive R tutorial:
# http://swirlstats.com/

# To ask a question about R:
# http://stackoverflow.com/questions/tagged/r

# Frequently used functions on a few reference cards:
# http://cran.r-project.org/doc/contrib/Baggott-refcard-v2.pdf

# Google's video R intros (not much that we didn't cover today, but may be a good review from a different perspective): 
# http://www.youtube.com/watch?v=iffR3fWv4xw&list=PLOU2XLYxmsIK9qQfztXeybpHvru-TrqAP

# Data Manipulation with R
# http://www.springer.com/statistics/computational+statistics/book/978-0-387-74730-9

# See what others are using R for:
# http://www.r-bloggers.com/

# 4-page R FAQ:
# http://www.econ.uiuc.edu/~roger/courses/LSE/outline/yaRfaq.pdf

# Short quiz that tests your knowledge of R programming:
# http://shiny.rstudio.com/tutorial/quiz/

# UCLA has good mini-tutorials:
# http://www.ats.ucla.edu/stat/r/

# List of books:
# http://stackoverflow.com/questions/420296/what-are-some-good-books-web-resources-and-projects-for-learning-r

# Book (hardcopy and free electronic version) on econometrics with R:
# http://www.urfie.net/

# Intro to Programming Econometrics with R:
# http://www.brodrigues.co/2015/05/03/update-introduction-r-programming/

# Stata-to-R help
# http://dss.princeton.edu/training/RStata.pdf

# Electronic access to R for Stata Users: 
# https://search.library.wisc.edu/catalog/991022085798802122

# MATLAB-to-R help 
# http://www.math.umaine.edu/~hiebeler/comp/matlabR.pdf

# Huge list of R resources:  
# http://www.computerworld.com/article/2497464/business-intelligence/business-intelligence-60-r-resources-to-improve-your-data-skills.html

# A formal intro to R manual:
# http://cran.r-project.org/doc/manuals/R-intro.pdf

# Google's R code style guide:
# http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

# Code running slow? Take a look at:
# http://www.burns-stat.com/pages/Tutor/R_inferno.pdf

# Debugging tools in RStudio:
# https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-RStudio



# YOUR HOMEWORK:

# 1. With the dataset we have been working with, find country with 
# lowest fertility rate in 2003 and calculate its total CO2 
# emissions (CO2 per cap times population) for every year.
  
# 2. Fit a panel data random effects model of the form:
# co2.emissions.per.cap ~ gdp.per.cap + log(gdp.per.cap) + military.exp.perc.gdp

# Suggested solutions at: 
# https://raw.githubusercontent.com/tdmcarthur/slidify-presentations/gh-pages/r-intro/r-intro-hw-solutions.r
  

# Slides available at http://tdmcarthur.github.io/slidify-presentations/r-intro/index.html



