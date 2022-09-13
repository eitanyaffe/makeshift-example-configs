##########################################################################################
# specify basic parameters
##########################################################################################

# project name
PROJECT_NAME=demo-$(GCP_PROJECT_ID)

# output bucket
OUTPUT_BUCKET=gs://ms-$(PROJECT_NAME)-output

# docker image can be from any docker repository
GCP_GCR_IMAGE_PATH=eitanyaffe/mdocker-base:v1.00

##########################################################################################
# register buckets
##########################################################################################

# output files files placed here
$(call _class_instance,gmount,OUT,$(OUTPUT_BUCKET) standard OUTPUT_DIR)

##########################################################################################
# basic params
##########################################################################################

GCP_DSUB_ODIR_BUCKET=$(OUTPUT_BUCKET)

# over parameter table
DEMO_SUBJECT_PARAM_TABLE=$(_cd)/params.txt
