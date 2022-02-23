##########################################################################################
# specify basic parameters
##########################################################################################

# project name
PROJECT_NAME=demo-$(GCP_PROJECT_ID)

# output bucket
OUTPUT_BUCKET=gs://ms-$(PROJECT_NAME)-output

# docker image
GCP_IMAGE_NAME=mdocker-base

##########################################################################################
# register buckets
##########################################################################################

# input fastq files placed here
# $(call _class_instance,gmount,IN,$(INPUT_BUCKET) standard INPUT_DIR)

# output files files placed here
$(call _class_instance,gmount,OUT,$(OUTPUT_BUCKET) standard OUTPUT_DIR)

##########################################################################################
# basic params
##########################################################################################

PAR_MS_PROJECT_NAME=$(PROJECT_NAME)

GCP_DSUB_ODIR_BUCKET=$(OUTPUT_BUCKET)

# over parameter table
DEMO_SUBJECT_PARAM_TABLE=$(_cd)/params.txt
