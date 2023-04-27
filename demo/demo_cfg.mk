##########################################################################################
# basic parameters
##########################################################################################

# project name
PROJECT_NAME=demo-$(GCP_PROJECT_ID)

# output bucket
GCP_DSUB_ODIR_BUCKET=gs://ms-$(PROJECT_NAME)-output

# this docker image is made public, can be replaced by any other GCR image
GCP_GCR_IMAGE_PATH=gcr.io/relman-yaffe/mdocker-metagenomics

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
