# For the first time you need to run the rows 2 and 3 to install the library
#install.packages("devtools")
#It may be necessary to install required as not all package dependencies are installed by devtools:
#install.packages(c("dplyr","tidyr","ggplot2","MASS","meta","ggrepel","DT"))
#devtools::install_github("PheWAS/PheWAS")

library(PheWAS)
library("readr")


icd10_codes <- read.table("phewptsdgp.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE )
gcd10_codes<- icd10_codes[, c(1,2,3,4)]
# your score needs to be standardized
genotypes <- read.table("covid_grs_stand.txt",header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)
names(genotypes)[names(genotypes) == "IID"] <- "id"
sex <- rep("M", times=dim(genotypes)[1])  
id.sex <- as.data.frame(cbind(genotypes$id, sex))
names(id.sex) <- c("id", "sex")


phenotypes <- createPhenotypes(gcd10_codes, min.code.count=1,id.sex=id.sex)
dim(phenotypes)
names(phenotypes)


# /data/WHRI-Panos-Scratch/hhy600/HES_GP_files/covariates/covariates_ukb_phR.tab
# and are included the following
# age (21022), sex (31), assessment centre (54) ,batch (22000) , 40 PCs (22009_0_1 - 22009_0_40)
# we usually use age, sex, batch, first 15 PCs

covar <- read.table("phewptsd_covgp.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)

covar$Batch_cat <- covar$genotype_chip
covar$Batch_cat[covar$Batch_cat < 0 ] <- 0
covar$Batch_cat[covar$Batch_cat > 0 ] <- 1
covar$sex <- factor(covar$sex)
covar$Batch_cat <- factor(covar$Batch_cat)
names(covar)[names(covar) == "userId"] <- "id"

set.seed(123)
results <- phewas(phenotypes, genotypes, significance.threshold=c("bonferroni"), covariates=covar, min.records = 20) 
#results=phewas(phenotypes,genotypes,cores=1,significance.threshold=c("bonferroni"))

results_d <- addPhecodeInfo(results)
nonas <- results_d[!is.na(results_d$beta),]
results_no_na <- subset(nonas, select=-c(note))



write.table(results_d, "GP_full.txt", sep="\t", quote=TRUE, row.names=FALSE)
write.table(results_no_na, "GP_nona.txt", sep="\t", quote=TRUE, row.names=FALSE)

jpeg("GP_icd10.jpg" , width=2000, height=1500)
phewasManhattan(results, OR.direction = T, title="GP data", annotate.size=7 , size.x.labels=20)
dev.off()

#########################################################################################################



