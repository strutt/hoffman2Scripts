nArgs=$((${#}-1))
args=("$@")

if [ ${nArgs} -lt 0 ]; then
    echo "Error! This script requires arguments!"           1>&2
    echo ""                                                 1>&2    
    echo "Usage: ./qsubCommand.sh scriptName.sh"            1>&2
    echo "Automatically assigns start/end job Ids."         1>&2
    exit 1;
fi;

scriptName=${args[0]}

nCpu=16
totalMemM=4096
memMPerCpu=$((totalMemM/nCpu))

echo -n "I got scriptName ${scriptName} "
#opts="-cwd -V -N ${scriptName} -l h_data=4G,h_rt=24:00:00,highp -m n -pe shared 16"
opts="-cwd -V -N ${scriptName} -l h_data=${memMPerCpu}M,h_rt=24:00:00 -m n -pe shared 16"



waitTime=1
echo "Will submit qsub ${opts} /u/home/s/strutt/hoffman2Scripts/${scriptName}"
echo "in ${waitTime} seconds"
sleep ${waitTime}

qsub ${opts} /u/home/s/strutt/hoffman2Scripts/${scriptName}
