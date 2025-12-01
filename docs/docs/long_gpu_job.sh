echo "#!/bin/bash
### Set the job name (for your reference)
#PBS -N `echo $* | sed 's/ /_/g;s/\//_/g'`
### Set the project name, your department code by default
#PBS -P cse
### Request email when job begins and ends
#PBS -m bea
### Specify email address to use for notification.
#PBS -M $USER@iitd.ac.in
####
#PBS -l select=1:ncpus=4:ngpus=1
### Specify "wallclock time" required for this job, hhh:mm:ss
#PBS -l walltime=48:00:00

### #PBS -l software=replace_with_Your_software_name
# After job starts, must goto working directory. 
# $PBS_O_WORKDIR is the directory from where the job is fired. 
echo "==============================="
echo \$PBS_JOBID
cat \$PBS_NODEFILE
echo "==============================="
cd $PWD 
pwd
source $HOME/.bashrc
. $HOME/anaconda3/etc/profile.d/conda.sh
conda activate $CONDA_DEFAULT_ENV
#job 
$*" > temp.sh
qsub temp.sh
rm temp.sh
