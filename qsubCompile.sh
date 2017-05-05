for arch in intel-X5650 intel-E5-2650 intel-E5-2670 amd-2380 intel-E5530; do
    # use this file as a notification that the complation is done...
    rm -f ~/compiledArches/${arch}
    qsub -cwd -V -N ${arch} -l arch=${arch},h_data=4G,h_rt=00:10:00 /u/home/s/strutt/hoffman2Scripts/compileForThisArchitecture.sh
done
