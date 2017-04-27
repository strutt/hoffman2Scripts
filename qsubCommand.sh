qsub -cwd -V -N test -l h_data=4096M,h_rt=00:60:00 -m n -t 1300-4390:1 /u/home/s/strutt/hoffman2Scripts/test.sh
