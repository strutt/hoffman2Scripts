#startJobId=130
#endJobId=439
# startJobId=1300
# endJobId=4390
#startJobId=3900
#endJobId=3999
startJobId=1300
endJobId=4399
echo ${@}
if [[ $@ == *"Wais"* ]]; then
    startJobId=3310
    endJobId=3549
elif [[ $@ == "makeUCorrAvePowSpec.sh" ]]; then
    startJobId=130
    endJobId=439
fi
#qsub -cwd -V -N $@ -l h_data=6G,h_rt=01:30:00,arch=intel-X5650\|intel-E5-2670\|intel-E5530 -m n -t $startJobId-$endJobId:1 /u/home/s/strutt/hoffman2Scripts/$@
#qsub -cwd -V -N $@ -l h_data=4G,h_rt=01:30:00 -m n -t $startJobId-$endJobId:1 /u/home/s/strutt/hoffman2Scripts/$@
qsub -cwd -V -N $@ -l h_data=2G,h_rt=03:00:00 -m n -t $startJobId-$endJobId:1 /u/home/s/strutt/hoffman2Scripts/$@
#intel-X5650:
#intel-E5-2670:
#intel-E5530:
