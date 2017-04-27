echo The GSE_TASK_ID is $SGE_TASK_ID
outputDir=~/project-bern/$(date +%Y_%m_%d)
mkdir -p $outputDir
export OUTPUT_DIR=$outputDir

$ANITA_UTIL_INSTALL_DIR/bin/Acclaim/drivers/filterDecimatedAcclaim
