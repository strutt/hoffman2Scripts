
# For debugging...
cat /proc/cpuinfo
uname -a
echo The GSE_TASK_ID is $SGE_TASK_ID

# Move to output directory
cd /u/home/s/strutt/hoffman2Scripts

export UCORRELATOR_SPECAVG_DIR=~/project-bern/UCorrelatorSpecAveDir
root -l -b -q makeUCorrAvePowSpec.C
