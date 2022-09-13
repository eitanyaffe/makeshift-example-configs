###############################################################################################
# specify google account details (see more in cloud/gcp module)
###############################################################################################

# default dsub regions
GCP_REGION?=us-west1

# default bucket location
GCP_LOCATION?=us-west1

##########################################################################################
# specify basic parameters
##########################################################################################

# specify project name
PROJECT_NAME=sra-example-$(GCP_PROJECT_ID)

# specify unique input bucket
INPUT_BUCKET=gs://ms-$(PROJECT_NAME)-input

# specify unique work bucket
WORK_BUCKET=gs://ms-$(PROJECT_NAME)-work

##########################################################################################
##########################################################################################
# NO NEED TO EDIT FROM THIS POINT
##########################################################################################
##########################################################################################

##########################################################################################
# accession ids
##########################################################################################

# table with samples and their accessions
# fields: ASSEMBLY_ID, LIB_ID, ACCESSION
INPUT_SRA_TABLE=$(_cd)/libs_short.txt
#INPUT_SRA_TABLE=$(_cd)/libs_complete.txt

# accession table downloaded for project PRJEB20800 from the SRA run selector
# only paired runs were used

##########################################################################################
# register buckets
##########################################################################################

# input fastq files placed here
$(call _class_instance,gmount,IN,$(INPUT_BUCKET) standard INPUT_DIR)

# output files files placed here
$(call _class_instance,gmount,OUT,$(WORK_BUCKET) standard OUTPUT_DIR)

# pipeline code uploaded here
$(call _class_instance,gmount,B,$(BINARY_BUCKET) standard BIN_DIR)

# deconseq bucket (auxiliary bucket)
$(call _class_instance,gmount,DE,gs://yaffe-deconseq standard DECONSEQ_BASE_DIR)

##########################################################################################
# basic params
##########################################################################################

GCP_DSUB_ODIR_BUCKET=$(WORK_BUCKET)

GCP_DU_TOTAL_UNIT=MiB

##########################################################################################
# assembly params
##########################################################################################

# default is 1000
ASSEMBLY_MIN_LEN=200

LIB_ID?=ERAS10_Dag0
