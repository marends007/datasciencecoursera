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
