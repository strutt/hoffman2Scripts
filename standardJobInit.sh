echo The GSE_TASK_ID is $SGE_TASK_ID

# Create a directory for the output, export is an environment variable for ProgressBar
outputDir=~/nobackup-saltzber/$(date +%Y_%m_%d)
mkdir -p $outputDir
export OUTPUT_DIR=$outputDir

# Move to output directory
cd $outputDir

if [[ $GSE_TASK_ID -gt 256 ]] && [[ $GSE_TASK_ID -lt 264 ]]; then
    echo "Not doing task ID "$GSE_TASK_ID 
    exit 1;
else
    exit 0;
fi
