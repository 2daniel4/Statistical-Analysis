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

p = ggplot(diffusion_data, aes(x=Condition, y=MD_full_anat))+ geom_boxplot(color="black") +geom_jitter(position = position_jitter(0.2)) + scale_color_manual(breaks =c("Ex","Rest"), values= c("red","black"))+
expand_limits(y=c(.9,1.2)) + ylab("FA") + theme_bw() +
theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + ggtitle("Hippocampal RD by condition") +
theme(plot.title = element_text(hjust = 0.5, size = 30)) +
theme(axis.text.x = element_text(size = 20)) + 
theme(axis.text.y = element_text(size = 15)) +
theme(axis.title.y = element_text(size = 20)) + 
theme(axis.title.x = element_text(size = 20))

#run paired ttest on columns
t.test(diffusion_data$HP_anterior_R~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(diffusion_data$HP_anterior_R~condition, mu=0, paired=T, data = diffusion_data)
cohensD(HP_anterior_R~condition, method="paired", data = diffusion_data)
