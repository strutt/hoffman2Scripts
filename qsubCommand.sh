nArgs=$((${#}-1))
args=("$@")

if [ ${nArgs} -lt 0 ]; then
    echo "Error! This script requires arguments!"           1>&2
    echo ""                                                 1>&2    
    echo "Usage 1: ./qsubCommand.sh scriptName.sh"          1>&2
    echo "Automatically assigns start/end job Ids."         1>&2
    echo ""                                                 1>&2
    echo "Usage 2: ./qsubCommand.sh scriptName.sh a b c d"  1>&2
    echo "Runs a job for with job id a, b,c ,d"             1>&2
    exit 1;
fi;

scriptName=${args[0]}
echo -n "I got scriptName ${scriptName} "
opts="-cwd -V -N ${scriptName} -l h_data=4G,h_rt=15:00:00,highp -m n"

if [ ${nArgs} -gt 1 ]; then # There extra arguments, which were JobIds
    echo "with extra arguments!"
    for j in $(seq 1 1 ${nArgs}); do
	jobId=${args[${j}]}
	#echo ${jobId}
	if ([ ${jobId} -ge 257 ] && [ ${jobId} -le 263 ]) || ([ ${jobId} -ge 2570 ] && [ ${jobId} -le 2639 ]) || ([ ${jobId} -ge 25700 ] && [ ${jobId} -le 26399 ]) ; then
	   echo "Not submitting job for jobId ${jobID}"
	else
	    #echo ${jobId} ${scriptName}
	    qsub ${opts} -t ${jobId}-${jobId}:1 /u/home/s/strutt/hoffman2Scripts/${scriptName}
	    
	fi
    done
else #otherwise make educated guess at job IDs.
    echo "without extra arguments, will guess jobIds"
    startJobId=1300 # defaults
    endJobId=4399   # defaults
    increment=1
    if [[ $scriptName} == *"Mc"* ]]; then
        startJobId=101
	increment=10
	endJobId=491
    elif [[ ${scriptName} == *"Wais"* ]]; then
	startJobId=3310
	endJobId=3549
	increment=1
    elif [[ ${scriptName} == "makeUCorrAvePowSpec.sh" || ${scriptName} == "rmsCacheSineSubPlusBrickWall.sh" ]]; then
	startJobId=130
	endJobId=439
	increment=1
    fi
    echo "I guessed ${startJobId} ${endJobId}"

    #if [[ [ ${startJobId} -le 256 ] && [ ${endJobId} -ge 257 ] ]]; then
    # qsub ${opts} -t ${startJobId}-${256}:1 /u/home/s/strutt/hoffman2Scripts/${scriptName}
    #qsub ${opts} -t ${264}-${endJobId}:1 /u/home/s/strutt/hoffman2Scripts/${scriptName}
    #else
    #	echo "Not implemented the logic for skipping yet though!";
    #fi	
    qsub ${opts} -t ${startJobId}-${endJobId}:${increment} /u/home/s/strutt/hoffman2Scripts/${scriptName}    
fi

exit 0;
