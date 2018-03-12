#Author: Spandana Achanta
#UTD ID: 2021376132
#Assignment 1
#Date: 09/10/2017
rm(list=ls(all=TRUE))
library(data.table)
context1 <- fread('Wage1.csv')
summary(context1)
lwage <- log(context1$wage)
model1 <- lm(wage~educ, data=context1)
summary(model1)
##Summary Model1
#
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -0.93389    0.68769  -1.358    0.175    
# educ         0.54470    0.05346  10.189   <2e-16 ***
  ---
model2 <- lm(wage~educ+exper+tenure, data = context1)
summary(model2)
##Summary Model2
#
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -2.91354    0.73172  -3.982 7.81e-05 ***
#   educ       0.60268    0.05148  11.708  < 2e-16 ***
#   exper      0.02252    0.01210   1.861   0.0633 .  
# tenure       0.17002    0.02173   7.825 2.83e-14 ***
model3 <- lm(lwage~educ+exper+tenure, data=context1)
summary(model3)
##Summary Model3
#
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   0.282635   0.104331   2.709  0.00697 ** 
#   educ        0.092256   0.007340  12.569  < 2e-16 ***
#   exper       0.004137   0.001726   2.397  0.01687 *  
#   tenure      0.022112   0.003098   7.138 3.19e-12 ***
coef(model3)*100
# (Intercept)        educ       exper      tenure 
# 28.2634948   9.2256203   0.4136804   2.2111673 
#
#
#
####Interpretations
#1a  For every 1 additional year in education, there is $0.5447 increase
#    in the average hourly earnings
#
#1b  For every 1 additional year in education, there is $0.602 increase
#    in the average hourly earnings controlling for years of potential 
#    experience and years with current employer
#
#1c  For every 1 additional year of potential experience, there is $0.022 
#    increase in the average hourly earnings controlling for years of 
#    education and years with current employer
#
#1d  For every 1 additional year with current employer, there is $0.170 
#    increase in the average hourly earnings controlling for years of 
#    education and years of potential experience
#
#1e  For a worker with no education, zero years of potential experience 
#    and just started working with the current employer the model2 predicts
#    -$2.913 in the average hourly earnings.Such an person would choose not
#    work at all
#
#1f  For every 1 additional year in education, there is 9.225% increase
#    in the average hourly earnings controlling for years of potential 
#    experience and years with current employer
#
#1g  For every 1 additional year of potential experience, there is 0.413% 
#    increase in the average hourly earnings controlling for years of 
#    education and years with current employer
#
#1h  For every 1 additional year with current employer, there is 2.211% 
#    increase in the average hourly earnings controlling for years of 
#    education and years of potential experience
