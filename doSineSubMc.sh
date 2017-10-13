source ~/hoffman2Scripts/standardJobInit.sh
export ANITA_ROOT_DATA=~/ANITA/flight1415/MinBiasEnergy_E222
sgeTaskId=$SGE_TASK_ID
for runInd in $(seq 0 1 9); do
    $ANITA_UTIL_INSTALL_DIR/bin/Acclaim/drivers/doSineSub --all --mc
    echo "Done for SGE_TASK_ID = "$SGE_TASK_ID
    sgeTaskId=$((sgeTaskId+1))
    export SGE_TASK_ID=${sgeTaskId}
    echo "Now set SGE_TASK_ID = "$SGE_TASK_ID
done
