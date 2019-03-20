#install.packages("readxl")
#load readxl
library("readxl")
getwd()
#set working directory
setwd('/Volumes/DANIEL')

#read in xlsx files
diffusion_data = read_excel("diffusion_stats.xlsx", sheet = "FA_raw")
#create data frame with diffusion data
diffusion_data = data.frame(diffusion_data)
#create column (turn condition into a factorial) and create summary for columns
condition=diffusion_data[,1]
condition=factor(condition)
left_hipp=diffusion_data[,2]
left_amygdala=diffusion_data[,3]
right_hipp=diffusion_data[,4]
right_amygdala=diffusion_data[,5]
CC_Anterior=diffusion_data[,6]


summary(left_hipp)
summary(left_amygdala)
summary(right_hipp)
summary(right_amygdala)
summary(CC_Anterior)
#summary(CC)
#summary(DG)
#plot columns
hist(left_hipp, main='Left_hipp_FA_by_condition')
hist(left_amygdala, main='Left_amygdala_FA_by_condition')
hist(right_hipp, main="right_hipp_FA_by_condition")
hist(right_amygdala, main='right_amygdala_FA_by_condition')
hist(CC_Anterior, main='CC_Anterior_FA_by_condition')
plot(condition,left_hipp, main='Left_hipp_FA_by_condition')
plot(condition, left_amygdala, main='Left_amygdala_FA_by_condition')
plot(condition,right_hipp, main="right_hipp_FA_by_condition")
plot(condition, right_amygdala, main='right_amygdala_FA_by_condition')
plot(condition, CC_Anterior, main='CC_Anterior_FA_by_condition')

#run paired ttest on columns
t.test(left_hipp~condition, mu=0, paired=T, data = diffusion_data)
t.test(left_amygdala~condition, mu=0, paired=T, data = diffusion_data)
t.test(right_hipp~condition, mu=0, paired=T, data = diffusion_data)
t.test(right_amygdala~condition, mu=0, paired=T, data = diffusion_data)
t.test(CC_Anterior~condition, mu=0, paired=T, data = diffusion_data)



