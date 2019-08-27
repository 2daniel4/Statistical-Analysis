#!/usr/bin/env Rscript  


#install.packages("readxl")
#install.packages("lsr")
#install.packages("PairedData")
#install.packages("ggplot2")
#install.packages("lme4")
#install.packages("nlme")
#install.packages("Hmisc")
#install.packages("ggpubr")
#install.packages("ggpmisc")

library("ggpmisc")
library("Hmisc")
library("ggpubr")
library("nlme")
library("lme4")
library("readxl")
library("lsr")
library("PairedData")
library("ggplot2")

getwd()
#set working directory
setwd("")

#read in xlsx files
diffusion_data = read_excel("AES_diffusion_stats.xlsx", sheet = "results")
#create data frame with diffusion data
diffusion_data = data.frame(diffusion_data)

#create data frame with just data interested in looking at
diffusion_data=data.frame(diffusion_data$FA_full_cov,diffusion_data$age,diffusion_data$Conditions)

#rename columns of data frame
names(diffusion_data)[names(diffusion_data) == "diffusion_data.FA_full_cov"] <- "FA_full_cov"
names(diffusion_data)[names(diffusion_data) == "diffusion_data.age"] <- "age"
names(diffusion_data)[names(diffusion_data) == "diffusion_data.Conditions"] <- "Conditions"

#test for normalcy
shapiro.test(diffusion_data$FA_full_cov)
shapiro.test(diffusion_data$age)

#calculate corelation statistics like p-value and rho
res = cor.test(diffusion_data$FA_full_cov,diffusion_data$age, method = "spearman")
res
res$p.value
res$estimate

#plot FA by age varying the color and shape of the points by the condition
b = ggplot(diffusion_data, aes(age,FA_full_cov, shape=Conditions, color = Conditions)) +
  geom_point()+
  scale_color_manual(values = c("black", "grey39"))+
  geom_smooth(aes(linetype = Conditions, fill=Conditions), method = "lm", formula = y~x, color ="black") +
  scale_fill_manual(values = c("black", "grey39")) +
  scale_shape_manual(values = c(16,1)) +
  ggtitle("Hippocampal FA with Respect to Age") + xlab("Age (years)") + ylab("FA") +  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 30),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 15),
    axis.title.y = element_text(size = 20),
    axis.title.x = element_text(size = 20),
    legend.text = element_text(size=15),
    legend.text.align = 0,
    legend.position = "top"
  )
  
#add the p-value and rho and modify background
b + annotate("text", x = 68.2, y = .24, label = "r = -0.44, p<.001", size = 6) +
  theme(
  panel.border = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.background = element_blank(),
  axis.line = element_line(colour = "black")
)     
