qsub -cwd -V -N test -l h_data=1024M,h_rt=00:10:00 -m n -t 1-10:1 /u/home/s/strutt/testQSub/test.sh
