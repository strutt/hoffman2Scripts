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
#opts="-cwd -V -N ${scriptName} -l h_data=2G,h_rt=24:00:00,highp -m n"
#opts="-cwd -V -N ${scriptName} -l h_data=2G,h_rt=24:00:00 -m n"
opts="-cwd -V -N ${scriptName} -l h_data=4G,h_rt=24:00:00,highp -m n"
#opts="-cwd -V -N ${scriptName} -l h_data=1G,h_rt=1:00:00 -m n"

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
    startJobId=221 #130 #353 # 130 #130 #363 #221 # 130 # defaults 
    endJobId=362 #220 #439 #220 #362 #220 #439 #362 # 439   # defaults
    increment=1
    avoidBadRuns=1
    if [[ ${scriptName} == *"Mc"* ]]; then
	#startJobId=1
	#increment=10
	#endJobId=491
	startJobId=1
	increment=10
	endJobId=491
	avoidBadRuns=0
    elif [[ ${scriptName} == *"Wais"* ]]; then
	startJobId=331
	endJobId=354
	increment=1;
    elif [[ ${scriptName} == "newPayloadBlastCut.sh" ]]; then
	startJobId=130
	endJobId=430
	increment=1;
    elif [[ ${scriptName} == "makeUCorrAvePowSpec.sh" || ${scriptName} == "rmsCacheSineSub"*".sh" ]]; then
	startJobId=130
	endJobId=439
	increment=1
    else
	#startJobId=1300
	#endJobId=2569
	startJobId=2640
	endJobId=4399
	#startJobId=4000
	#endJobId=4399
	
	increment=1;	
    fi
    waitTime=10
    echo "I guessed ${startJobId} ${endJobId} with increment ${increment}"
    echo "Will submit qsub ${opts} -t ${startJobId}-${endJobId}:${increment} /u/home/s/strutt/hoffman2Scripts/${scriptName}"
    echo "in ${waitTime} seconds"
    sleep ${waitTime}

    #if [[ ${avoidBadRuns} == 1 ]]; then # Only need to do this for data...
    if [[ 0 == 1 ]]; then # Only need to do this for data...
	if [[ ${startJobId} -lt 1000 ]]; then
	    if [ ${startJobId} -gt 263 ] || [ ${endJobId} -lt 257 ] ; then
		echo "here"
		exit 1;
		qsub ${opts} -t ${startJobId}-256:${increment} /u/home/s/strutt/hoffman2Scripts/${scriptName}
		qsub ${opts} -t 264-${endJobId}:${increment} /u/home/s/strutt/hoffman2Scripts/${scriptName}
	    fi
	else
	    echo "Not yet implemented!"
	    exit 1;
	fi
    else
	qsub ${opts} -t ${startJobId}-${endJobId}:${increment} /u/home/s/strutt/hoffman2Scripts/${scriptName}    
    fi
fi

exit 0;
