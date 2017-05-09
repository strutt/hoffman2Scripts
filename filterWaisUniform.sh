
# For debugging...
cat /proc/cpuinfo
uname -a
echo The GSE_TASK_ID is $SGE_TASK_ID

# Create a directory for the output, export is an environment variable for ProgressBar
outputDir=~/project-bern/$(date +%Y_%m_%d)
mkdir -p $outputDir
export OUTPUT_DIR=$outputDir

# Move to output directory
cd $outputDir

# Execute the script (relevent environmental variables are extracted from $GSE_TASK_ID
$ANITA_UTIL_INSTALL_DIR/bin/Acclaim/drivers/filterWaisUniformMag
