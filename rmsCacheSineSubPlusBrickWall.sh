# For debugging...
echo The GSE_TASK_ID is $SGE_TASK_ID

# Move to output directory
cd /u/home/s/strutt/hoffman2Scripts

export UCORRELATOR_SPECAVG_DIR=~/ANITA/Repositories/UCorrelatorSpecAvgDir
export ANITA_RMS_DIR=~/ANITA/Repositories/anitaRMS
~/ANITA/Repositories/Install/bin/Acclaim/drivers/rmsCacheSineSubPlusBrickWall $SGE_TASK_ID

