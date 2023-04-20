##########################################################################################
##########################################################################################
# CONFIGURE BASIC GOOGLE ACCOUNT DETAILS BELOW
##########################################################################################
##########################################################################################

# default dsub regions
GCP_REGION?=us-west1

# default bucket location
GCP_LOCATION?=us-west1

##########################################################################################
##########################################################################################
# CUSTOMIZE STORAGE PARAMETERS
##########################################################################################
##########################################################################################

##########################################################################################
# user buckets
##########################################################################################

# research project identifier, used for monitering work and expenses in GCP
PROJECT_NAME=pp-test

# bucket with input data
INPUT_BUCKET=gs://poly-panner-example

# table defining libraries and assemblies
LIBS_INPUT_TABLE=$(INPUT_DIR)/pp_unit_small/lib_table

# increment the output version to switch to a new output bucket
OBUCKET_VERSION=1

# by default, the output bucket name combines the research project name and the GCP project
GCP_DSUB_ODIR_BUCKET=gs://$(PROJECT_NAME)-$(GCP_PROJECT_ID)-work-$(OBUCKET_VERSION)

# by defualt use existing image on GCR (can also use images on dockerhub)
GCP_GCR_IMAGE_PATH=gcr.io/relman-yaffe/mdocker-metagenomics
#GCP_GCR_IMAGE_PATH=eitanyaffe/mdocker-metagenomics:v1.00

##########################################################################################
# shared buckets
##########################################################################################

# deconseq data
DECONSEQ_BUCKET=gs://yaffe-deconseq

# uniref100 data
UNIREF_BUCKET=gs://yaffe-uniref

##########################################################################################
# register buckets
##########################################################################################

# input files placed here
$(call _class_instance,gmount,IN,$(INPUT_BUCKET) standard INPUT_DIR)

# output files placed here
$(call _class_instance,gmount,OUT,$(GCP_DSUB_ODIR_BUCKET) standard OUTPUT_DIR)

# pipeline code uploaded here
$(call _class_instance,gmount,B,$(BINARY_BUCKET) standard BIN_DIR)

# deconseq bucket
$(call _class_instance,gmount,DE,$(DECONSEQ_BUCKET) standard DECONSEQ_BASE_DIR)

# uniref100 bucket
$(call _class_instance,gmount,UR,$(UNIREF_BUCKET) standard UNIREF_DB_ROOT_DIR)

##########################################################################################
##########################################################################################
# CUSTOMIZE RUNTIME PARAMETERS
##########################################################################################
##########################################################################################

# default assembly id, used when no is is supplied
ASSEMBLY_ID?=c1_1

##########################################################################################
# gcp module
##########################################################################################

# disk usage units
GCP_DU_TOTAL_UNIT=MiB

##########################################################################################
# libs module
##########################################################################################

# use up to this number of reads from each library (in millions)
LIBS_MAX_MREADS?=25

##########################################################################################
# cav module
##########################################################################################

# supply canonic sample labels, as appear in the libs table (canon column)
CAV_CANON_VALS=S1 S2 S3 S4 S5 S6 S7 S8 S9 S10

# discard samples below this number of reads
CAV_COLLECT_MIN_COVERAGE=50000

##########################################################################################
# dyn module
##########################################################################################

# accept all bins
DYN_TYPE=all

# baseline ids
DYN_BASE_IDS=S1 S2 S3 S4 S5

# samples used for clustering of genomes and variants
DYN_CLUSTER_IDS=S1 S2 S3 S4 S5 S6 S7 S8 S9 S10

# disturbed samples
DYN_DISTURB_IDS=S6 S7 S8 S9

# post-disturbance samples
DYN_POST_IDS=S10

# optional late samples, long after disturbance ends
DYN_LATE_IDS=

DYN_CLUSTER_BINS_K_MAX=2
DYN_CLUSTER_STRAINS_K_MAX=2
DYN_CLUSTER_VAR_K_MAX=2

##########################################################################################
# genomes module
##########################################################################################

# disable module since GTDB-tk fails on short bins
GENOMES_SKIP=T

##########################################################################################
# converge module
##########################################################################################

# minimal supporting weight
CNV_FEATURE_MIN_WEIGHT=0

# minimal fold enrichment e/o
CNV_FEATURE_MIN_ENRICHMENT=1

# minimal supporting number of vclusters
CNV_FEATURE_MIN_VARIANT_COUNT=1

# minimal number of assemblies
CNV_FEATURE_MIN_ASSEMBLY_COUNT=1

# locate specific features, regardless of variants
CNV_HIGHLIGHT_FEATURES=
