#!/usr/bin/env Rscript  

#install.packages("readxl")
#install.packages("lsr")
#install.packages("PairedData")
#install.packages("ggplot2")
#load readxl
library("readxl")
library("lsr")
library("PairedData")
library("ggplot2")
getwd()
#set working directory
setwd('/Volumes/DANIEL')

#read in xlsx files
diffusion_data = read_excel("AES_diffusion_stats.xlsx", sheet = "ADC_hipp")

#create data frame with diffusion data
diffusion_data = data.frame(diffusion_data)

#create column (turn condition into a factorial) and create summary for columns
condition=as.factor(diffusion_data[,2])
exercise_anterior=subset(diffusion_data, condition=="Ex",HP_anterior_R)
rest_anterior=subset(diffusion_data, condition=="Ex",HP_anterior_R)

summary(diffusion_data$HP_anterior_R)
histogram(diffusion_data$HP_anterior_R)
shapiro.test(diffusion_data$HP_anterior_R)


#plot columns

plot(condition, diffusion_data$HP_anterior_R, main="HP_anterior_by_condition", ylab=("FA"))
#Plot Paired
#pd_anterior=paired(exercise_anterior, rest_anterior)
#plot(pd_anterior,type="profile")+theme_bw()

#run paired ttest on columns
t.test(diffusion_data$HP_anterior_R~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(diffusion_data$HP_anterior_R~condition, mu=0, paired=T, data = diffusion_data)
cohensD(HP_anterior_R~condition, method="paired", data = diffusion_data)
