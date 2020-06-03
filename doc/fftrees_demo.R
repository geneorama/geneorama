
## Why not?
library(geneorama)

## Source page:
## https://github.com/ndphillips/FFTrees

## Install if missing
if(!"FFTrees" %in% row.names(installed.packages())){
	devtools::install_github("ndphillips/FFTrees")
}

## Load package
library("FFTrees")

## Define data
heart.train <- as.data.table(heart.train)
heart.test <- as.data.table(heart.test)
heartdisease <- as.data.table(heartdisease)

# Create an FFTrees object called `heart_FFT`
heart_FFT <- FFTrees(formula = diagnosis ~ .,                   # The variable we are predicting
                     data = heart.train,                        # Training data
                     data.test = heart.test,                    # Testing data
                     main = "ER Decisions",                     # Main label
                     decision.labels = c("Stable", "H Attack")) # Label for decisions

## View fitted model printed output
heart_FFT

## Fancy tree plot
plot(heart_FFT, data = "test")

heartdisease[ , .N, thal]
heartdisease[ , .N, cp]
heartdisease[ , .N, ca]


str(heart_FFT)
