cp -R /data/home/hhy810/Phesant-PTSD/ptsd_phesant_transethnic-Sex-Specific_hits/PHESANT/*  /data/home/hhy810/Phesant-PTSD/ptsd_phewas_white_british_sex-specbidirection_UKBiobank

cp -R /data/WHRI-Panos-Scratch/UKBiobank_11193/* /data/home/hhy810/UKBIOBANKb

cp -R /data/WHRI-Panos-Scratch/UKBiobank_53723/* /data/home/hhy810/UKBIOBANKa

Hi Areti, thanks once again. I have been able to subset on HES and GP data.  one quick question: How do i go about the self reported. I have only worked with HES and GP data. 


qlogin -l h_vmem=30G,h_rt=24:00:00
module load R/4.0.2
R



############################################################################################################################################################
############################################################################################################################################################
############################################################################################################################################################
icd10_codes_HES <- read.table("/data/WHRI-Marouli/hhy810/Thyroid2/lnTT3_FT4/lnTT3_FT4_GP/hes_for_phewas_6.2021.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)
names(icd10_codes_HES)
HES_PTSD<-subset(icd10_codes_HES, code == "F43.1")
head(HES_PTSD)

icd10_codes_GP <- read.table("/data/WHRI-Marouli/hhy810/Thyroid2/lnTT3_FT4/lnTT3_FT4_GP/gp_for_phewas_6.2021.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)
names(icd10_codes_GP)
GP_PTSD<-subset(icd10_codes_GP, code == "F43.1")

head(HES_PTSD)
dim(HES_PTSD)
head(GP_PTSD)
dim(GP_PTSD)
GP_HES<-rbind(HES_PTSD, GP_PTSD)

dim(GP_HES)



setwd("/data/WHRI-Panos-Scratch/UKBiobank_53723/Basket2004832")
library(data.table)
library(tibble)
dat1 <- fread("ukb39726.csv", select = c("eid", "20002-0.1","20002-0.2",	"20002-0.3",	"20002-0.4",	"20002-0.5",	"20002-0.6",	"20002-0.7",	"20002-0.8",	"20002-0.9",	"20002-0.10",	"20002-0.11",	"20002-0.12",	"20002-0.13",	"20002-0.14",	"20002-0.15",	"20002-0.16",	"20002-0.17",	"20002-0.18",	"20002-0.19",	"20002-0.20",	"20002-0.21",	"20002-0.22",	"20002-0.23",	"20002-0.24",	"20002-0.25",	"20002-0.26",	"20002-0.27",	"20002-0.28",	"20002-0.29",	"20002-0.30",	"20002-0.31",	"20002-0.32",	"20002-0.33",	"20002-1.0",	"20002-1.1",	"20002-1.2",	"20002-1.3",	"20002-1.4",	"20002-1.5",	"20002-1.6",	"20002-1.7",	"20002-1.8",	"20002-1.9",	"20002-1.10",	"20002-1.11",	"20002-1.12",	"20002-1.13",	"20002-1.14",	"20002-1.15",	"20002-1.16",	"20002-1.17",	"20002-1.18",	"20002-1.19",	"20002-1.20",	"20002-1.21",	"20002-1.22",	"20002-1.23",	"20002-1.24",	"20002-1.25",	"20002-1.26",	"20002-1.27",	"20002-1.28",	"20002-1.29",	"20002-1.30",	"20002-1.31",	"20002-1.32",	"20002-1.33",	"20002-2.0",	"20002-2.1",	"20002-2.2",	"20002-2.3",	"20002-2.4",	"20002-2.5",	"20002-2.6",	"20002-2.7",	"20002-2.8",	"20002-2.9",	"20002-2.10",	"20002-2.11",	"20002-2.12",	"20002-2.13",	"20002-2.14",	"20002-2.15",	"20002-2.16",	"20002-2.17",	"20002-2.18",	"20002-2.19",	"20002-2.20",	"20002-2.21",	"20002-2.22",	"20002-2.23",	"20002-2.24",	"20002-2.25",	"20002-2.26",	"20002-2.27",	"20002-2.28",	"20002-2.29",	"20002-2.30",	"20002-2.31",	"20002-2.32",	"20002-2.33",	"20002-3.0",	"20002-3.1",	"20002-3.2",	"20002-3.3",	"20002-3.4",	"20002-3.5",	"20002-3.6",	"20002-3.7",	"20002-3.8",	"20002-3.9",	"20002-3.10",	"20002-3.11",	"20002-3.12",	"20002-3.13",	"20002-3.14",	"20002-3.15",	"20002-3.16",	"20002-3.17",	"20002-3.18",	"20002-3.19",	"20002-3.20",	"20002-3.21",	"20002-3.22",	"20002-3.23",	"20002-3.24",	"20002-3.25",	"20002-3.26",	"20002-3.27",	"20002-3.28",	"20002-3.29",	"20002-3.30",	"20002-3.31",	"20002-3.32",	"20002-3.33"))
dim(dat1)
df.dat1<-as.data.frame(dat1)
df.dat1a <- tibble::rownames_to_column(df.dat1, "VALUE")

dat2 <- fread("ukb39726.csv", select = c("20002-0.1",	"20002-0.2",	"20002-0.3",	"20002-0.4",	"20002-0.5",	"20002-0.6",	"20002-0.7",	"20002-0.8",	"20002-0.9",	"20002-0.10",	"20002-0.11",	"20002-0.12",	"20002-0.13",	"20002-0.14",	"20002-0.15",	"20002-0.16",	"20002-0.17",	"20002-0.18",	"20002-0.19",	"20002-0.20",	"20002-0.21",	"20002-0.22",	"20002-0.23",	"20002-0.24",	"20002-0.25",	"20002-0.26",	"20002-0.27",	"20002-0.28",	"20002-0.29",	"20002-0.30",	"20002-0.31",	"20002-0.32",	"20002-0.33",	"20002-1.0",	"20002-1.1",	"20002-1.2",	"20002-1.3",	"20002-1.4",	"20002-1.5",	"20002-1.6",	"20002-1.7",	"20002-1.8",	"20002-1.9",	"20002-1.10",	"20002-1.11",	"20002-1.12",	"20002-1.13",	"20002-1.14",	"20002-1.15",	"20002-1.16",	"20002-1.17",	"20002-1.18",	"20002-1.19",	"20002-1.20",	"20002-1.21",	"20002-1.22",	"20002-1.23",	"20002-1.24",	"20002-1.25",	"20002-1.26",	"20002-1.27",	"20002-1.28",	"20002-1.29",	"20002-1.30",	"20002-1.31",	"20002-1.32",	"20002-1.33",	"20002-2.0",	"20002-2.1",	"20002-2.2",	"20002-2.3",	"20002-2.4",	"20002-2.5",	"20002-2.6",	"20002-2.7",	"20002-2.8",	"20002-2.9",	"20002-2.10",	"20002-2.11",	"20002-2.12",	"20002-2.13",	"20002-2.14",	"20002-2.15",	"20002-2.16",	"20002-2.17",	"20002-2.18",	"20002-2.19",	"20002-2.20",	"20002-2.21",	"20002-2.22",	"20002-2.23",	"20002-2.24",	"20002-2.25",	"20002-2.26",	"20002-2.27",	"20002-2.28",	"20002-2.29",	"20002-2.30",	"20002-2.31",	"20002-2.32",	"20002-2.33",	"20002-3.0",	"20002-3.1",	"20002-3.2",	"20002-3.3",	"20002-3.4",	"20002-3.5",	"20002-3.6",	"20002-3.7",	"20002-3.8",	"20002-3.9",	"20002-3.10",	"20002-3.11",	"20002-3.12",	"20002-3.13",	"20002-3.14",	"20002-3.15",	"20002-3.16",	"20002-3.17",	"20002-3.18",	"20002-3.19",	"20002-3.20",	"20002-3.21",	"20002-3.22",	"20002-3.23",	"20002-3.24",	"20002-3.25",	"20002-3.26",	"20002-3.27",	"20002-3.28",	"20002-3.29",	"20002-3.30",	"20002-3.31",	"20002-3.32",	"20002-3.33"))
df.dat2<-as.data.frame(dat2)
df.dat2a <- tibble::rownames_to_column(df.dat2, "VALUE")

# write.csv(df.dat2a, "/data/home/hhy810/df.dat2a.csv")
library(dplyr)
dat3<-df.dat2a %>% filter_all(any_vars(. %in% c(1469)))
df.dat3a<-as.data.frame(dat3)
# write.csv(df.dat3a, "/data/home/hhy810/df.dat3a.csv")
library(tibble)
df.dat4a <- tibble::rownames_to_column(df.dat3a, "VALUEnew")
#df.dat5a <- tibble::rownames_to_column(df.dat1a, "VALUE")

df.dat6 <- merge(df.dat4a, df.dat1a, by.x="VALUE", by.y= "VALUE",all.x=FALSE,all.y=FALSE)
names(df.dat6)

write.csv(df.dat6, "/data/home/hhy810/df.dat6.csv")

Sec <- fread("/data/home/hhy810/df.dat7.csv", select = c("eid"))

Sec <- fread("/data/home/hhy810/df.dat7.csv")

head(Sec)

head(GP_HES)
#https://phewascatalog.org/phecodes_icd10cm

#Sec <- fread("/data/home/hhy810/df.dat6_test.csv")

Sec$count <- rowSums(is.na(Sec))
write.csv(Sec, "/data/home/hhy810/Sec.csv")
Sec2<-Sec[, c("eid", "count")]

ICD10CM <- 'ICD10CM'
vocabulary_id<-ICD10CM
Sec2$vocabulary_id<-vocabulary_id
F43.1 <- 'F43.1'
code<-F43.1
Sec2$code<-code

Sec3 <- Sec2[, c(1, 3, 4, 2)]
colnames(Sec3)[1] <- "id"

Sec4<- rbind(Sec3,GP_HES)
head(Sec4)
ICDcodes<-Sec4
genotypes<-Sec4[,c("id")]
score<-1
SCORES<-score
ICDcodes$SCORES<-SCORES
head(ICDcodes)
write.csv(ICDcodes, "/data/home/hhy810/ICDCodes.csv")

ICDcodes<-read.csv("ICDCodes.csv")
head(ICDcodes)

#########################################################################################################################################
#########################################################################################################################################
#########################################################################################################################################
#########################################################################################################################################
HES_PTSDt<-subset(icd10_codes_HES, code != "F43.1")
head(HES_PTSDt)
GP_PTSDt<-subset(icd10_codes_GP, code != "F43.1")
head(GP_PTSDt)
head(HES_PTSDt)
dim(HES_PTSDt)
head(GP_PTSDt)
dim(GP_PTSDt)
GP_HESt<-rbind(HES_PTSDt, GP_PTSDt)
score<-0
SCORES<-score
GP_HESt$SCORES<-SCORES
head(GP_HESt)
GP_HESt<-rbind(GP_HESt, ICDcodes)
head(GP_HESt)

GP_HEStScore<-GP_HESt[,c(1,5)]
write.csv(GP_HEStScore,"GP_HEStScore.csv",sep="\t",row.names=FALSE)
q<-read.csv("GP_HEStScore.csv")
head(q)

Thyroid_grs_stand <- read.table("combined_score.txt", header=TRUE, sep="\t", comment.char="", stringsAsFactors=FALSE, na=TRUE)
head(Thyroid_grs_stand)






# write.table(GP_HEStScore,"GP_HEStScore.txt",sep="\t",row.names=FALSE)
# Thyroid_grs_stand <- read.table("GP_HEStScore.txt", header=TRUE, sep="\t", comment.char="",quote="",  stringsAsFactors=FALSE, na=TRUE)
# head(Thyroid_grs_stand)
# Thyroid_grs_stand
# Thyroid_grs_stand2<-data.frame(Thyroid_grs_stand)
# colnames(Thyroid_grs_stand2)<-gsub("X.","",colnames(Thyroid_grs_stand2))




#write.csv(GP_HESt, "combined_score.csv", row.names=FALSE)

mkdir ptsd_experiment_SCORE_1_0

cp -r /data/home/hhy810/Phewas-PTSD/ptsd_phewas_transethnic-Sex-Specific_hits/* /data/home/hhy810/Phewas-PTSD/ptsd_experiment_SCORE_1_0

cp 


































write.csv(GP_HESt, "/data/home/hhy810/GP_HESt.csv")



# dim(GP_HESt)

# library(tibble)
# dat1 <- fread("ukb39726.csv", select = c("eid", "20002-0.1","20002-0.2",	"20002-0.3",	"20002-0.4",	"20002-0.5",	"20002-0.6",	"20002-0.7",	"20002-0.8",	"20002-0.9",	"20002-0.10",	"20002-0.11",	"20002-0.12",	"20002-0.13",	"20002-0.14",	"20002-0.15",	"20002-0.16",	"20002-0.17",	"20002-0.18",	"20002-0.19",	"20002-0.20",	"20002-0.21",	"20002-0.22",	"20002-0.23",	"20002-0.24",	"20002-0.25",	"20002-0.26",	"20002-0.27",	"20002-0.28",	"20002-0.29",	"20002-0.30",	"20002-0.31",	"20002-0.32",	"20002-0.33",	"20002-1.0",	"20002-1.1",	"20002-1.2",	"20002-1.3",	"20002-1.4",	"20002-1.5",	"20002-1.6",	"20002-1.7",	"20002-1.8",	"20002-1.9",	"20002-1.10",	"20002-1.11",	"20002-1.12",	"20002-1.13",	"20002-1.14",	"20002-1.15",	"20002-1.16",	"20002-1.17",	"20002-1.18",	"20002-1.19",	"20002-1.20",	"20002-1.21",	"20002-1.22",	"20002-1.23",	"20002-1.24",	"20002-1.25",	"20002-1.26",	"20002-1.27",	"20002-1.28",	"20002-1.29",	"20002-1.30",	"20002-1.31",	"20002-1.32",	"20002-1.33",	"20002-2.0",	"20002-2.1",	"20002-2.2",	"20002-2.3",	"20002-2.4",	"20002-2.5",	"20002-2.6",	"20002-2.7",	"20002-2.8",	"20002-2.9",	"20002-2.10",	"20002-2.11",	"20002-2.12",	"20002-2.13",	"20002-2.14",	"20002-2.15",	"20002-2.16",	"20002-2.17",	"20002-2.18",	"20002-2.19",	"20002-2.20",	"20002-2.21",	"20002-2.22",	"20002-2.23",	"20002-2.24",	"20002-2.25",	"20002-2.26",	"20002-2.27",	"20002-2.28",	"20002-2.29",	"20002-2.30",	"20002-2.31",	"20002-2.32",	"20002-2.33",	"20002-3.0",	"20002-3.1",	"20002-3.2",	"20002-3.3",	"20002-3.4",	"20002-3.5",	"20002-3.6",	"20002-3.7",	"20002-3.8",	"20002-3.9",	"20002-3.10",	"20002-3.11",	"20002-3.12",	"20002-3.13",	"20002-3.14",	"20002-3.15",	"20002-3.16",	"20002-3.17",	"20002-3.18",	"20002-3.19",	"20002-3.20",	"20002-3.21",	"20002-3.22",	"20002-3.23",	"20002-3.24",	"20002-3.25",	"20002-3.26",	"20002-3.27",	"20002-3.28",	"20002-3.29",	"20002-3.30",	"20002-3.31",	"20002-3.32",	"20002-3.33"))
# dim(dat1)
# df.dat1<-as.data.frame(dat1)
# df.dat1a <- tibble::rownames_to_column(df.dat1, "VALUE")

# df.dat1aQ<-df.dat1a[!(df.dat1a$VALUE=="100297"|
# df.dat1a$VALUE=="10088"|
# df.dat1a$VALUE=="101113"|
# df.dat1a$VALUE=="101128"|
# df.dat1a$VALUE=="10264"|
# df.dat1a$VALUE=="104875"|
# df.dat1a$VALUE=="109072"|
# df.dat1a$VALUE=="109343"|
# df.dat1a$VALUE=="111398"|
# df.dat1a$VALUE=="112203"|
# df.dat1a$VALUE=="113794"|
# df.dat1a$VALUE=="114415"|
# df.dat1a$VALUE=="114632"|
# df.dat1a$VALUE=="114983"|
# df.dat1a$VALUE=="116347"|
# df.dat1a$VALUE=="119480"|
# df.dat1a$VALUE=="119548"|
# df.dat1a$VALUE=="124526"|
# df.dat1a$VALUE=="125433"|
# df.dat1a$VALUE=="126759"|
# df.dat1a$VALUE=="126857"|
# df.dat1a$VALUE=="129437"|
# df.dat1a$VALUE=="132678"|
# df.dat1a$VALUE=="138255"|
# df.dat1a$VALUE=="138833"|
# df.dat1a$VALUE=="138876"|
# df.dat1a$VALUE=="140774"|
# df.dat1a$VALUE=="144450"|
# df.dat1a$VALUE=="144984"|
# df.dat1a$VALUE=="1469"|
# df.dat1a$VALUE=="147079"|
# df.dat1a$VALUE=="147354"|
# df.dat1a$VALUE=="148532"|
# df.dat1a$VALUE=="149898"|
# df.dat1a$VALUE=="150195"|
# df.dat1a$VALUE=="151246"|
# df.dat1a$VALUE=="151982"|
# df.dat1a$VALUE=="154845"|
# df.dat1a$VALUE=="157067"|
# df.dat1a$VALUE=="161380"|
# df.dat1a$VALUE=="162188"|
# df.dat1a$VALUE=="164317"|
# df.dat1a$VALUE=="165190"|
# df.dat1a$VALUE=="165448"|
# df.dat1a$VALUE=="166239"|
# df.dat1a$VALUE=="166951"|
# df.dat1a$VALUE=="167694"|
# df.dat1a$VALUE=="168370"|
# df.dat1a$VALUE=="169059"|
# df.dat1a$VALUE=="169763"|
# df.dat1a$VALUE=="171095"|
# df.dat1a$VALUE=="17232"|
# df.dat1a$VALUE=="172363"|
# df.dat1a$VALUE=="172725"|
# df.dat1a$VALUE=="173896"|
# df.dat1a$VALUE=="17593"|
# df.dat1a$VALUE=="17640"|
# df.dat1a$VALUE=="176527"|
# df.dat1a$VALUE=="17704"|
# df.dat1a$VALUE=="177840"|
# df.dat1a$VALUE=="177969"|
# df.dat1a$VALUE=="178850"|
# df.dat1a$VALUE=="180343"|
# df.dat1a$VALUE=="181018"|
# df.dat1a$VALUE=="182548"|
# df.dat1a$VALUE=="187283"|
# df.dat1a$VALUE=="188967"|
# df.dat1a$VALUE=="189866"|
# df.dat1a$VALUE=="192020"|
# df.dat1a$VALUE=="192145"|
# df.dat1a$VALUE=="194994"|
# df.dat1a$VALUE=="195906"|
# df.dat1a$VALUE=="196077"|
# df.dat1a$VALUE=="196549"|
# df.dat1a$VALUE=="197609"|
# df.dat1a$VALUE=="197834"|
# df.dat1a$VALUE=="19849"|
# df.dat1a$VALUE=="198628"|
# df.dat1a$VALUE=="203000"|
# df.dat1a$VALUE=="205000"|
# df.dat1a$VALUE=="205407"|
# df.dat1a$VALUE=="205906"|
# df.dat1a$VALUE=="206631"|
# df.dat1a$VALUE=="208103"|
# df.dat1a$VALUE=="211658"|
# df.dat1a$VALUE=="213027"|
# df.dat1a$VALUE=="213888"|
# df.dat1a$VALUE=="215271"|
# df.dat1a$VALUE=="219578"|
# df.dat1a$VALUE=="21990"|
# df.dat1a$VALUE=="222254"|
# df.dat1a$VALUE=="22240"|
# df.dat1a$VALUE=="22406"|
# df.dat1a$VALUE=="224349"|
# df.dat1a$VALUE=="224615"|
# df.dat1a$VALUE=="225124"|
# df.dat1a$VALUE=="230112"|
# df.dat1a$VALUE=="23053"|
# df.dat1a$VALUE=="230663"|
# df.dat1a$VALUE=="232671"|
# df.dat1a$VALUE=="236201"|
# df.dat1a$VALUE=="238425"|
# df.dat1a$VALUE=="238668"|
# df.dat1a$VALUE=="243703"|
# df.dat1a$VALUE=="245885"|
# df.dat1a$VALUE=="247571"|
# df.dat1a$VALUE=="249208"|
# df.dat1a$VALUE=="249493"|
# df.dat1a$VALUE=="251425"|
# df.dat1a$VALUE=="251431"|
# df.dat1a$VALUE=="253571"|
# df.dat1a$VALUE=="254659"|
# df.dat1a$VALUE=="257090"|
# df.dat1a$VALUE=="25841"|
# df.dat1a$VALUE=="258718"|
# df.dat1a$VALUE=="259521"|
# df.dat1a$VALUE=="264307"|
# df.dat1a$VALUE=="265039"|
# df.dat1a$VALUE=="26522"|
# df.dat1a$VALUE=="265831"|
# df.dat1a$VALUE=="265876"|
# df.dat1a$VALUE=="265944"|
# df.dat1a$VALUE=="266017"|
# df.dat1a$VALUE=="266169"|
# df.dat1a$VALUE=="266217"|
# df.dat1a$VALUE=="266302"|
# df.dat1a$VALUE=="268027"|
# df.dat1a$VALUE=="271051"|
# df.dat1a$VALUE=="272508"|
# df.dat1a$VALUE=="275427"|
# df.dat1a$VALUE=="275562"|
# df.dat1a$VALUE=="275998"|
# df.dat1a$VALUE=="276669"|
# df.dat1a$VALUE=="276989"|
# df.dat1a$VALUE=="278044"|
# df.dat1a$VALUE=="278547"|
# df.dat1a$VALUE=="280628"|
# df.dat1a$VALUE=="28245"|
# df.dat1a$VALUE=="282989"|
# df.dat1a$VALUE=="283164"|
# df.dat1a$VALUE=="283727"|
# df.dat1a$VALUE=="28409"|
# df.dat1a$VALUE=="285085"|
# df.dat1a$VALUE=="28531"|
# df.dat1a$VALUE=="285702"|
# df.dat1a$VALUE=="28619"|
# df.dat1a$VALUE=="291392"|
# df.dat1a$VALUE=="293795"|
# df.dat1a$VALUE=="29411"|
# df.dat1a$VALUE=="294443"|
# df.dat1a$VALUE=="295157"|
# df.dat1a$VALUE=="29608"|
# df.dat1a$VALUE=="296337"|
# df.dat1a$VALUE=="297338"|
# df.dat1a$VALUE=="300319"|
# df.dat1a$VALUE=="300795"|
# df.dat1a$VALUE=="302383"|
# df.dat1a$VALUE=="302569"|
# df.dat1a$VALUE=="310687"|
# df.dat1a$VALUE=="310983"|
# df.dat1a$VALUE=="311058"|
# df.dat1a$VALUE=="313219"|
# df.dat1a$VALUE=="314228"|
# df.dat1a$VALUE=="314390"|
# df.dat1a$VALUE=="316391"|
# df.dat1a$VALUE=="316714"|
# df.dat1a$VALUE=="317058"|
# df.dat1a$VALUE=="317246"|
# df.dat1a$VALUE=="318602"|
# df.dat1a$VALUE=="318683"|
# df.dat1a$VALUE=="31922"|
# df.dat1a$VALUE=="319950"|
# df.dat1a$VALUE=="320215"|
# df.dat1a$VALUE=="320660"|
# df.dat1a$VALUE=="323033"|
# df.dat1a$VALUE=="323405"|
# df.dat1a$VALUE=="323656"|
# df.dat1a$VALUE=="323771"|
# df.dat1a$VALUE=="324148"|
# df.dat1a$VALUE=="326125"|
# df.dat1a$VALUE=="328198"|
# df.dat1a$VALUE=="328760"|
# df.dat1a$VALUE=="329725"|
# df.dat1a$VALUE=="330906"|
# df.dat1a$VALUE=="333425"|
# df.dat1a$VALUE=="334548"|
# df.dat1a$VALUE=="33507"|
# df.dat1a$VALUE=="338550"|
# df.dat1a$VALUE=="340967"|
# df.dat1a$VALUE=="341401"|
# df.dat1a$VALUE=="341638"|
# df.dat1a$VALUE=="341867"|
# df.dat1a$VALUE=="34319"|
# df.dat1a$VALUE=="344179"|
# df.dat1a$VALUE=="349141"|
# df.dat1a$VALUE=="350865"|
# df.dat1a$VALUE=="355190"|
# df.dat1a$VALUE=="358353"|
# df.dat1a$VALUE=="360952"|
# df.dat1a$VALUE=="363090"|
# df.dat1a$VALUE=="364522"|
# df.dat1a$VALUE=="364919"|
# df.dat1a$VALUE=="365345"|
# df.dat1a$VALUE=="365797"|
# df.dat1a$VALUE=="366889"|
# df.dat1a$VALUE=="368769"|
# df.dat1a$VALUE=="372810"|
# df.dat1a$VALUE=="372978"|
# df.dat1a$VALUE=="374220"|
# df.dat1a$VALUE=="374232"|
# df.dat1a$VALUE=="375590"|
# df.dat1a$VALUE=="376094"|
# df.dat1a$VALUE=="37631"|
# df.dat1a$VALUE=="381303"|
# df.dat1a$VALUE=="381745"|
# df.dat1a$VALUE=="381826"|
# df.dat1a$VALUE=="384957"|
# df.dat1a$VALUE=="386908"|
# df.dat1a$VALUE=="387151"|
# df.dat1a$VALUE=="387382"|
# df.dat1a$VALUE=="388129"|
# df.dat1a$VALUE=="391766"|
# df.dat1a$VALUE=="392218"|
# df.dat1a$VALUE=="396429"|
# df.dat1a$VALUE=="397241"|
# df.dat1a$VALUE=="400722"|
# df.dat1a$VALUE=="401325"|
# df.dat1a$VALUE=="401752"|
# df.dat1a$VALUE=="403498"|
# df.dat1a$VALUE=="405140"|
# df.dat1a$VALUE=="409004"|
# df.dat1a$VALUE=="409590"|
# df.dat1a$VALUE=="413476"|
# df.dat1a$VALUE=="41454"|
# df.dat1a$VALUE=="417807"|
# df.dat1a$VALUE=="419244"|
# df.dat1a$VALUE=="419718"|
# df.dat1a$VALUE=="419966"|
# df.dat1a$VALUE=="421860"|
# df.dat1a$VALUE=="422287"|
# df.dat1a$VALUE=="422363"|
# df.dat1a$VALUE=="422947"|
# df.dat1a$VALUE=="423436"|
# df.dat1a$VALUE=="423641"|
# df.dat1a$VALUE=="425598"|
# df.dat1a$VALUE=="426081"|
# df.dat1a$VALUE=="426469"|
# df.dat1a$VALUE=="430973"|
# df.dat1a$VALUE=="432493"|
# df.dat1a$VALUE=="43351"|
# df.dat1a$VALUE=="433810"|
# df.dat1a$VALUE=="43437"|
# df.dat1a$VALUE=="435434"|
# df.dat1a$VALUE=="435930"|
# df.dat1a$VALUE=="437325"|
# df.dat1a$VALUE=="437440"|
# df.dat1a$VALUE=="440285"|
# df.dat1a$VALUE=="441508"|
# df.dat1a$VALUE=="441930"|
# df.dat1a$VALUE=="442346"|
# df.dat1a$VALUE=="442403"|
# df.dat1a$VALUE=="443406"|
# df.dat1a$VALUE=="450749"|
# df.dat1a$VALUE=="451484"|
# df.dat1a$VALUE=="451551"|
# df.dat1a$VALUE=="451827"|
# df.dat1a$VALUE=="451955"|
# df.dat1a$VALUE=="452911"|
# df.dat1a$VALUE=="453439"|
# df.dat1a$VALUE=="454603"|
# df.dat1a$VALUE=="456745"|
# df.dat1a$VALUE=="461139"|
# df.dat1a$VALUE=="462366"|
# df.dat1a$VALUE=="463792"|
# df.dat1a$VALUE=="465655"|
# df.dat1a$VALUE=="466855"|
# df.dat1a$VALUE=="466867"|
# df.dat1a$VALUE=="4672"|
# df.dat1a$VALUE=="467492"|
# df.dat1a$VALUE=="46779"|
# df.dat1a$VALUE=="468456"|
# df.dat1a$VALUE=="468518"|
# df.dat1a$VALUE=="468843"|
# df.dat1a$VALUE=="470284"|
# df.dat1a$VALUE=="471767"|
# df.dat1a$VALUE=="472425"|
# df.dat1a$VALUE=="472745"|
# df.dat1a$VALUE=="473281"|
# df.dat1a$VALUE=="474306"|
# df.dat1a$VALUE=="476844"|
# df.dat1a$VALUE=="477811"|
# df.dat1a$VALUE=="481140"|
# df.dat1a$VALUE=="481830"|
# df.dat1a$VALUE=="487754"|
# df.dat1a$VALUE=="488519"|
# df.dat1a$VALUE=="490433"|
# df.dat1a$VALUE=="491024"|
# df.dat1a$VALUE=="491240"|
# df.dat1a$VALUE=="491313"|
# df.dat1a$VALUE=="493565"|
# df.dat1a$VALUE=="493616"|
# df.dat1a$VALUE=="496414"|
# df.dat1a$VALUE=="497652"|
# df.dat1a$VALUE=="499716"|
# df.dat1a$VALUE=="50044"|
# df.dat1a$VALUE=="501486"|
# df.dat1a$VALUE=="51962"|
# df.dat1a$VALUE=="54531"|
# df.dat1a$VALUE=="55751"|
# df.dat1a$VALUE=="57385"|
# df.dat1a$VALUE=="5867"|
# df.dat1a$VALUE=="59068"|
# df.dat1a$VALUE=="59491"|
# df.dat1a$VALUE=="60929"|
# df.dat1a$VALUE=="61077"|
# df.dat1a$VALUE=="61884"|
# df.dat1a$VALUE=="62025"|
# df.dat1a$VALUE=="62720"|
# df.dat1a$VALUE=="64511"|
# df.dat1a$VALUE=="66056"|
# df.dat1a$VALUE=="66768"|
# df.dat1a$VALUE=="68558"|
# df.dat1a$VALUE=="69006"|
# df.dat1a$VALUE=="7033"|
# df.dat1a$VALUE=="71009"|
# df.dat1a$VALUE=="71864"|
# df.dat1a$VALUE=="75073"|
# df.dat1a$VALUE=="79257"|
# df.dat1a$VALUE=="8092"|
# df.dat1a$VALUE=="82159"|
# df.dat1a$VALUE=="84028"|
# df.dat1a$VALUE=="84834"|
# df.dat1a$VALUE=="86270"|
# df.dat1a$VALUE=="88883"|
# df.dat1a$VALUE=="89662"|
# df.dat1a$VALUE=="91386"|
# df.dat1a$VALUE=="91427"|
# df.dat1a$VALUE=="92429"|
# df.dat1a$VALUE=="92743"|
# df.dat1a$VALUE=="94567"|
# df.dat1a$VALUE=="95157"|
# df.dat1a$VALUE=="96727"|
# df.dat1a$VALUE=="99767"),]

# #####################checking if PTSD IS PRESENT###############
# library(dplyr)
# df.dat1aQt<- df.dat1aQ[,-c(1,2)]
# df.dat1aQta<-df.dat1aQt %>% filter_all(any_vars(. %in% c(1469)))
# head(df.dat1aQta)
# ###############################################################
# df.dat1aQ
# names(df.dat1aQ)
# head(df.dat1aQ)
# library(dplyr)
# df.dat1aQtgt<- as.data.frame(df.dat1aQ[,c(2)])

# library(dplyr)

# df.dat1aQtgt<-df.dat1aQ %>%
#   select(eid)

# df.dat1aQtgt$count<-0







# ICD10CM <- 'ICD10CM'
# vocabulary_id<-ICD10CM
# df.dat1aQtgt$vocabulary_id<-vocabulary_id
# F43.1 <- 'F43.1'
# code<-F43.1
# df.dat1aQtgt$code<-code

# Sec3 <- Sec2[, c(1, 3, 4, 2)]
# colnames(Sec3)[1] <- "id"

# Sec4<- rbind(Sec3,GP_HES)
# head(Sec4)
# ICDcodes<-Sec4
# genotypes<-Sec4[,c("id")]
# score<-1
# SCORES<-score
# ICDcodes$SCORES<-SCORES
# head(ICDcodes)
# write.csv(ICDcodes, "/data/home/hhy810/ICDCodes.csv")

