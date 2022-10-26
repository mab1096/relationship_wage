rm(list=ls())

#read in wage2.csv dataset

dat <- read.csv(file.choose(), header=FALSE)
summary(dat)

#Go to description file & see which variable is which
#ex. V5 = educ, V6 = experience, V1 = wage

#square brackets help choose certain parts of rows
#data[rows, columns]
#ex. [1:935]

wage <- dat[,1]
educ <- dat[,5]
exper <- dat[,6]

summary(wage)
summary(educ)
summary(exper)

#alt way of doing this (kinda longer way) ex. for wage

summary(dat[,1])

mean(wage)
mean(educ)
mean(exper)

#subsets of data based on marital status
#2 Groups: married = 1, non-married = 0
#9th column if the variable we need, it's = 1 if an individual is married (obv lol)
#code for just married below:

datmarried <- subset(dat, dat[,9]==1)

#analysis of data: 835 are married, only 100 aren't married

wagem <- datmarried[,1]
educm <- datmarried[,5]
experm <- datmarried[,6]

mean(wagem)
mean(educm)
mean(experm)


#subset of un-married individuals + the un-married versions of these variables
datun <- subset(dat, dat[,9]==0)

wageun <- datun[,1]
educun <- datun[,5]
experun <- datun[,6]

mean(wageun)
mean(educun)
mean(experun)

#data analysis: unmarried have less wage, more EDUC, Less Experience on Avg.


#Subset of individuals who are married (9 col) and live in an urban area (12 col), code below:
datmur <- subset(dat, dat[,9]==1&dat[,12]==1)

#analysis 594 married in urban area

summary(datmur)

wagemur <- datmur[,1]
educmur <- datmur[,5]
expermur <- datmur[,6]

mean(wagemur)
mean(educmur)
mean(expermur)

sd(wage)
sd(wagemur)
sd(wagem)
sd(wageun)



#subset of individuals that have above median years of education
#subset rule will come from the educ variable + also wage variable for those above median educ

datam <- subset(dat, dat[,5]>median(dat[,5]))
wageam <- datam[,1]

#subset of individuals below median years of educ + wage variable of those below or equal median educ

datbm <- subset(dat, dat[,5]<=median(dat[,5]))
wagebm <- datbm[,1]

summary(wageam)
summary(wagebm)
cor(wage, educ)
plot(educ, wage)
#data analysis: higher education influences correl for wage, same is shown in the summaries of wageam & bm


#subset of individuals who're married or live in an urban area
#Below is just to showcase the or function "|", code below:
datmorur <- subset(dat, dat[,9]==1|dat[,12]==1)
