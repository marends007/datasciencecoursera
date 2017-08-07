## How to ask an R question:
#1. What steps will reproduce the questions
#2. What is the expected outcome?
#3. What do you see instead?
#4. What do you expect to see?
#5. What version of the product?
#6. What operating system?

## When asking on Google: "[data type] R package"

#Reading Lines of a Text File
con <- url("https://www.mcc.gov/where-we-work/program/zambia-compact", "r")
x <- readLines(con)
head(x)

install.packages("devtools")
library(devtools)
find_rtools()

install.packages("KernSmooth")
library(KernSmooth)


## Week 3 - Types of Data Science Questions:

#Desrciptive:Goal is to descibe, not making decisions on it. 
  #Most commonly applied with census data - usually cannot be generalized w/o
  # more data analysis

#Exploratoty Data - look at discovering new connections and good for
  #finding new problems. Shouldn't be used for generalizing and predicting
  # correlation /= causation
  # Example: lesions of the brain lighting up in response to brain where
  # they didn't discover a new finding but a potential new connection

#Inferential Analysis - exrtact info to generalize to a larger 
  #population. Depends heavily on population
  #Example: Effect of air pollution control on life expectency 

#Prediction Analysis - use data on some object to collect info on the data
  # that is coming through the door. If X predicts Y, it does not mean
  # that X causes Y
  # Presidential Election predictions 

#Causal Analysis - what happens if you change the values of one variable,
  #how will that change the value of other variables. 
  #done usually through randomized studies and referred to as "on average"
  #gold standard for Data science 
  
#Mechanistic Analysis
  #Idea is to understand the exact changes in variables that lead to changes 
  # in other variables
  #Example: changing in cement type on 

# Steps to data analysis:

# 1. Start with stating a question
# 2. Determine the Experiment 

# Confounding: Measuring shoe size and literacy - must be careful about
# controlling for other variables. Must pay attention to other variables 
# that affect the Y variables 
## How do you fix this?
  # Fix it, stratify it or Randomize and blocking

# For Prediction, you need distribution that is more spread out
  # must pay attention to relative size of effect when looking at 
  # prediction vs. inference

