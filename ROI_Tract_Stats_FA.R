#install.packages("readxl")
#load readxl
library("readxl")
getwd()
#set working directory
setwd('/Volumes/DANIEL')

#read in xlsx files
diffusion_data = read_excel("diffusion_stats.xlsx", sheet = "ROI_FA")
#create data frame with diffusion data
diffusion_data = data.frame(diffusion_data)
#create column (turn condition into a factorial) and create summary for columns
condition=diffusion_data[,2]
condition=as.factor(condition)
SpleniumCC=as.numeric(diffusion_data[,3])
BodyCC=as.numeric(diffusion_data[,4])
GenuCC=as.numeric(diffusion_data[,5])
Fornix_Body=as.numeric(diffusion_data[,6])
R_Cing_Hipp=as.numeric(diffusion_data[,7])
L_Cing_Hipp=as.numeric(diffusion_data[,8])
R_Uncinate_Fasc=as.numeric(diffusion_data[,9])
L_Uncinate_Fasc=as.numeric(diffusion_data[,10])


summary(SpleniumCC)
summary(BodyCC)
summary(GenuCC)
summary(Fornix_Body)
summary(R_Cing_Hipp)
summary(L_Cing_Hipp)
summary(R_Uncinate_Fasc)
summary(L_Uncinate_Fasc)

#plot columns
hist(SpleniumCC, main='SpleniumCC')
hist(BodyCC, main='BodyCC')
hist(GenuCC, main='GenuCC')
hist(Fornix_Body, main='Fornix_Body')
hist(R_Cing_Hipp, main="R_Cing_Hipp")
hist(L_Cing_Hipp, main='L_Cing_Hipp')
hist(R_Uncinate_Fasc, main='R_Uncin')
hist(L_Uncinate_Fasc, main='L_Uncin')

plot(condition, SpleniumCC, main='SpleniumCC')
plot(condition, BodyCC, main='BodyCC')
plot(condition, GenuCC, main='GenuCC')
plot(condition, Fornix_Body, main='Fornix_Body')
plot(condition, R_Cing_Hipp, main="R_Cing_Hipp")
plot(condition, L_Cing_Hipp, main='L_Cing_Hipp')
plot(condition, R_Uncinate_Fasc, main='R_Uncin')
plot(condition, L_Uncinate_Fasc,left_hipp, main='L_Uncin')

#run paired ttest on columns
t.test(SpleniumCC~condition, mu=0, paired=T, data = diffusion_data)
t.test(BodyCC~condition, mu=0, paired=T, data = diffusion_data)
t.test(GenuCC~condition, mu=0, paired=T, data = diffusion_data)
t.test(Fornix_Body~condition, mu=0, paired=T, data = diffusion_data)
t.test(R_Cing_Hipp~condition, mu=0, paired=T, data = diffusion_data)
t.test(L_Cing_Hipp~condition, mu=0, paired=T, data = diffusion_data)
t.test(R_Uncinate_Fasc~condition, mu=0, paired=T, data = diffusion_data)
t.test(L_Uncinate_Fasc~condition, mu=0, paired=T, data = diffusion_data)

#run paired non-parametric ttest on columns (Wilcoxon Signed Rank Test)
wilcox.test(SpleniumCC~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(BodyCC~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(GenuCC~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(Fornix_Body~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(R_Cing_Hipp~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(L_Cing_Hipp~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(R_Uncinate_Fasc~condition, mu=0, paired=T, data = diffusion_data)
wilcox.test(L_Uncinate_Fasc~condition, mu=0, paired=T, data = diffusion_data)
