
# For the first time you need to run the rows 2 and 3 to install the library
#install.packages("devtools")
#It may be necessary to install required as not all package dependencies are installed by devtools:
#install.packages(c("dplyr","tidyr","ggplot2","MASS","meta","ggrepel","DT"))
#devtools::install_github("PheWAS/PheWAS")


library(PheWAS)
library("readr")



# /data/WHRI-Panos-Scratch/hhy600/HES_GP_files/2021/my_changes/gp_for_phewas_6.2021.txt
#icd10_codes <- read.table("/data/WHRI-Marouli/DATA/UKB/53723/PheWAS/hes_for_phewas_6.2021.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE )
#write.csv(icd10_codes, "icd10_codes2.csv")

icd10_codes <- read.table("/data/home/hhy810/ptsd_phewas_transethnic-Sex-Specific/increasedPTSD_GP/PTSDgp.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE )
icd10_codes<- icd10_codes[, c(1,2,3,4)]

phenotypes <- createPhenotypes(icd10_codes, min.code.count=1)
dim(phenotypes)
names(phenotypes)


# /data/WHRI-Panos-Scratch/hhy600/HES_GP_files/covariates/covariates_ukb_phR.tab
# and are included the following
# age (21022), sex (31), assessment centre (54) ,batch (22000) , 40 PCs (22009_0_1 - 22009_0_40)
# we usually use age, sex, batch, first 15 PCs

#covar <- read.table("/data/home/hhy810/covariates_ukb_phR.tab", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)

covar <- read.table("/data/home/hhy810/ptsd_phewas_transethnic-Sex-Specific/increasedPTSD_GP/PTSDGP_cov_gp.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)


covar$Batch_cat <- covar$genotype_chip
covar$Batch_cat[covar$Batch_cat < 0 ] <- 0
covar$Batch_cat[covar$Batch_cat > 0 ] <- 1
covar$sex <- factor(covar$sex)
covar$Batch_cat <- factor(covar$Batch_cat)
names(covar)[names(covar) == "userId"] <- "id"

#/data/WHRI-Marouli/DATA/temp
# your score needs to be standardized
genotypes <- read.table("/data/home/hhy810/ptsd_phewas_transethnic-Sex-Specific/increasedPTSD_GP/ptsd_grs_stand.txt",header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)
names(genotypes)[names(genotypes) == "IID"] <- "id"

#TSH_CAD <- merge(covar, genotypes, by.x="id", by.y= "id",all.x=FALSE,all.y=FALSE)

#View(TSH_CAD)
#testing<-


#results <- phewas(phenotypes, genotypes, significance.threshold=c("bonferroni"), covariates=covar,min.records = 20) 
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


