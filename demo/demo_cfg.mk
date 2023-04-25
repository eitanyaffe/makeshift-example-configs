##########################################################################################
# basic parameters
##########################################################################################

# project name
PROJECT_NAME=demo-$(GCP_PROJECT_ID)

# output bucket
GCP_DSUB_ODIR_BUCKET=gs://ms-$(PROJECT_NAME)-output

# docker image can be from any docker repository
# GCP_GCR_IMAGE_PATH=eitanyaffe/mdocker-base:v1.00

##########################################################################################
# register buckets
##########################################################################################

# output files files placed here
$(call _class_instance,gmount,OUT,$(GCP_DSUB_ODIR_BUCKET) standard OUTPUT_DIR)

##########################################################################################
# project parameters
##########################################################################################

# parameter table
DEMO_SUBJECT_PARAM_TABLE=$(_cd)/params.txt
