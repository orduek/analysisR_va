library(mice)
library(missForest)
data <- iris
summary(iris)
iris.mis <- prodNA(iris, noNA = 0.1)

summary(iris.mis)
md.pattern(antiDP_dat)


# lets create a data frame just for PCL scores
# then we can merge it back to the original data frame
# 
justPCl <- select(antiDP_dat, PTSDIND, contains("PCL"))

md.pattern(justPCl)

library(VIM)

mice_plot <- aggr(justPCl, col=c('navyblue','yellow'),
                  numbers=TRUE, sortVars=TRUE,
                  labels=names(justPCl), cex.axis=.7,
                  gap=3, ylab=c("Missing data","Pattern"))

imputed_Data <- mice(justPCl, m=5, maxit = 50, method = 'pmm') #, seed = 500)

inde <- dplyr::sample_n(justPCl, 50)

pclNoNa <- filter(antiDP_dat, !is.na(BPCLTOT))
head(pclNoNa)


