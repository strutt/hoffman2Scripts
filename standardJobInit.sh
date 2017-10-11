echo "The SGE_TASK_ID is ${SGE_TASK_ID}"

# Create a directory for the output, export is an environment variable for ProgressBar
outputDir=~/nobackup-saltzber/$(date +%Y_%m_%d)
mkdir -p $outputDir
export OUTPUT_DIR=$outputDir

# Move to output directory
cd $outputDir
