# Quick reference lookout for working on the University of Pretoria Cluster 
# echoing the current present working dir  
echo $(pwd)
# using the cut on the comma delimiter files the sample data can be found in the main directory named iris
cat iris.csv| cut -f 1 -d "," # you can use any delimited here
# if you want to select from the first column and then select the numbers starting with the specific number or the alphanumeral
cat iris.csv| cut -f 1 -d "," | grep "^4"
# string sort based on the start of the string
cat iris.csv| cut -f 1 -d "," | grep "^Pretoria" 
# alphanumeral sort based on the end of the string
cat iris.csv | cut -f 1 -d "," | grep "7$"
# looking out for the multiple variables at one time 
cat iris.csv | cut -f 1 -d "," | grep "7$" | grep "^4"
# counting the number of the occurences of the specific variables present in the datsets
cat iris.csv | cut -f 1 -d "," | grep "7$" | grep "^4" | wc -l
# checking out the listing of the specific files in the present working directory
for i in $(pwd)/*csv; do echo $i; done
# checking out the listing of all the files in the present working directory
for i in $(pwd)/*; do echo $i; done
# iterative command loops for a dry run simply echoing the command to check how it runs
for i in $(pwd)/*csv; do echo wc -l $i; done # on specific files
for i in $(pwd)/*; do echo wc -l $i; done # one all the files with in the present given directory
# running the iteration on the specific files
for i in $(pwd)/*csv; do wc -l $i; done 
# running the iteration on all the files 
for i in $(pwd)/*; do wc -l $i; done
# printing a quick range for the iterations
for i in {1..10}; do echo $i; done
# extacting all the columns starting with the particular regular expression and sorting it out and counting the unique ones
cat iris.csv | grep "^4" | sort | uniq -c
# exporting the PATH environment 
echo $PATH
# Adding a installed extenal library to your PATH
export PATH="PATH_to_the_installed_library":$PATH
#checking the length variable 
variable=teststring
echo ${#variable}
#cutting the string for the variables
echo ${#variable=-$num} # where num is how much you want to cut the string
# sorting the specific columns based on the import
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2
# sorting the specific import and then listing the required variable 
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2 | grep "^4" # list the variable starting with the given value
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2 | grep "^Pretoria" # list the variable starting with the given string
cat iris.csv | cut -f 1,2 -d "," | sort -k 2,2 | grep "7$" # list the variable ending with the given conditon
# sorting out the string text in the output files and counting the occurences for the frequency table
awk '{for(i=1;i<=NF;i++) text[$i]++} END {for(k in text) print k,text[k]}' file.txt | sort -k2 -nr
# invoking the bash through the python interface and interactive shell in the CHPC cluster
import os
import subprocess
os.chdir("path_to_your_dir")
subprocess.run("awk '{for(i=1;i<=NF;i++) a[$i]++} END {for(k in a) print k,a[k]}' file.txt | sort -k2 -nr", shell=True)
# writing the custom configuration PBS files for the cluster computing one without the path and one with the path
import os 
import subprocess
def makePBS(path):   
    """a function call to make all the command line application for the
    CHPC cluster. Run with the parameters asked and it will make and 
    submit the job to the cluster
    qsub: Submit a job
    qdel: Delete a batch job
    qsig: Send a signal to batch job
    qhold: Hold a batch job
    qrls: Release held jobs
    qrerun: Rerun a batch job
    qmove: Move a batch job to another queue
    qstat: Show status of batch jobs 
    qselect: Select a specific subset of jobs
    qalter: Alter a batch job
    qmsg: Send a message to a batch job
    """
    if not os.path.exists(path):
        os.mkdir(path)
        os.chdir(os.mkdir(path))
    PBS_JOBNAME = ""
    PBS_O_LOGNAME = ""
    PBS_O_MAIL = ""
    PBS_O_HOST = ""
    PBS_O_QUEUE = ""
    PBS_O_WORKDIR = ""
    PBS_NODES = ""
    PBS_COMMAND = ""
    PBS_MODULE = ""
    PBS_NCPUS = ""
    while True:
        take_jobname = input("Please enter the jobname:")
        take_queue = input("Please enter the queue name:")
        take_logname = input("Please enter the name for the logname:")
        take_mail = input("Please enter the email for the job:")
        take_host = input("Please enter the hostname for the cluster:")
        take_queue = input("Please enter the queue for the job to run:")
        take_workdir = input("Please enter the working directory for the job:")
        take_node = input("please enter the computing node:")
        take_threads = input("Please enter the threads:")
        take_command = input("Please enter the command:")
        PBS_JOBNAME += take_jobname
        PBS_O_QUEUE += take_queue
        PBS_O_LOGNAME += take_logname
        PBS_O_MAIL += take_mail
        PBS_O_HOST += take_host
        PBS_O_QUEUE += take_queue
        PBS_O_WORKDIR += take_workdir
        PBS_NODES += take_node
        PBS_NCPUS += take_threads
        PBS_COMMAND += take_command
        #take_vars = ["take_jobname", "take_queue", "take_logname", "take_mail", "take_host", "take_queue", \
                         #"take_workdir", "take_node", "take_threads", "take_command"] 
        if take_jobname and take_queue and take_logname and take_mail and take_host and take_queue \
            and take_workdir and take_node and take_threads and take_command == "None":
                break
        while True:
            """
            You can pass a space separated list of all the modules you want to load 
            on the cluster. 
            """
            take_module = input("Please enter the module name:")
            PBS_MODULE += take_module
            if take_module == "":
                break
            return print(f"PBS_JOBNAME={''.join(PBS_JOBNAME)} \
                         \nPBS_O_LOGNAME = {''.join(PBS_O_LOGNAME)} \
                         \nPBS_O_MAIL = {''.join(PBS_O_MAIL)} \
                         \nPBS_O_HOST = {''.join(PBS_O_HOST)} \
                         \nPBS_O_QUEUE = {''.join(PBS_O_QUEUE)} \
                         \nPBS_O_WORKDIR = {''.join(PBS_O_WORKDIR)} \
                         \nPBS_NODES = {''.join(PBS_NODES)} \
                         \nPBS_NCPUS = {''.join(PBS_NCPUS)} \
                         \nPBS_COMMAND = {''.join(PBS_COMMAND)} \
                         \nPBS_MODULE = {''.join(PBS_MODULE)}")

# without path version
import os 
import subprocess
def makepbsPATH():   
    """a function call to make all the command line application for the
    CHPC cluster. Run with the parameters asked and it will make and 
    submit the job to the cluster
    qsub: Submit a job
    qdel: Delete a batch job
    qsig: Send a signal to batch job
    qhold: Hold a batch job
    qrls: Release held jobs
    qrerun: Rerun a batch job
    qmove: Move a batch job to another queue
    qstat: Show status of batch jobs 
    qselect: Select a specific subset of jobs
    qalter: Alter a batch job
    qmsg: Send a message to a batch job
    """
    PBS_JOBNAME = ""
    PBS_O_LOGNAME = ""
    PBS_O_MAIL = ""
    PBS_O_HOST = ""
    PBS_O_QUEUE = ""
    PBS_O_WORKDIR = ""
    PBS_NODES = ""
    PBS_COMMAND = ""
    PBS_MODULE = ""
    PBS_NCPUS = ""
    while True:
        take_jobname = input("Please enter the jobname:")
        take_queue = input("Please enter the queue name:")
        take_logname = input("Please enter the name for the logname:")
        take_mail = input("Please enter the email for the job:")
        take_host = input("Please enter the hostname for the cluster:")
        take_queue = input("Please enter the queue for the job to run:")
        take_workdir = input("Please enter the working directory for the job:")
        take_node = input("please enter the computing node:")
        take_threads = input("Please enter the threads:")
        take_command = input("Please enter the command:")
        PBS_JOBNAME += take_jobname
        PBS_O_QUEUE += take_queue
        PBS_O_LOGNAME += take_logname
        PBS_O_MAIL += take_mail
        PBS_O_HOST += take_host
        PBS_O_QUEUE += take_queue
        PBS_O_WORKDIR += take_workdir
        PBS_NODES += take_node
        PBS_NCPUS += take_threads
        PBS_COMMAND += take_command
        #take_vars = ["take_jobname", "take_queue", "take_logname", "take_mail", "take_host", "take_queue", \
                         #"take_workdir", "take_node", "take_threads", "take_command"] 
        if take_jobname and take_queue and take_logname and take_mail and take_host and take_queue \
            and take_workdir and take_node and take_threads and take_command == "None":
                break
        while True:
            """
            You can pass a space separated list of all the modules you want to load 
            on the cluster. 
            """
            take_module = input("Please enter the module name:")
            PBS_MODULE += take_module
            if take_module == "":
                break
            return print(f"PBS_JOBNAME={''.join(PBS_JOBNAME)} \
                         \nPBS_O_LOGNAME = {''.join(PBS_O_LOGNAME)} \
                         \nPBS_O_MAIL = {''.join(PBS_O_MAIL)} \
                         \nPBS_O_HOST = {''.join(PBS_O_HOST)} \
                         \nPBS_O_QUEUE = {''.join(PBS_O_QUEUE)} \
                         \nPBS_O_WORKDIR = {''.join(PBS_O_WORKDIR)} \
                         \nPBS_NODES = {''.join(PBS_NODES)} \
                         \nPBS_NCPUS = {''.join(PBS_NCPUS)} \
                         \nPBS_COMMAND = {''.join(PBS_COMMAND)} \
                         \nPBS_MODULE = {''.join(PBS_MODULE)}")
#fixing the brew path on your environment as issued by brew 
sudo chown -R $(whoami) $(brew --prefix)/*
# Altair PBS pro at your hand save it in a .sh script and run as ./script_name
#!/bin/bash
PS3 = "Altair PBS Pro Manual at hand (#)? "; \
select i in qsub qdel qhold qrls qmove qstat qselect qalter; do
if [[ $i == qsub ]]; then
        echo "this is a qsub option and this is used for the 
        submission of the job queue and the job queue should
        follow the following format for the submission to the
        #PBS -o path_out_file
        #PBS -e path_error_file
        #PBS -l walltime=1:00:00
        #PBS -l mem=100GB
        #PBS -l ncpus=64
        #PBS -j jobname
        submission should be made as 
        qsub script_name.sh
        qsub -M user@pbspro.com"
        break; fi; 
if [[ $i == qdel ]]; then
        echo " this is used for the continous monitoring of the 
        job queues on the system and is used for the deletion of
        the jobs from the system and this can be used only by the
        administrator of the system"; 
        break; fi;
if [[ $i == qhold ]]; then
        echo "The qhold is used to hold the jobs on the
        system when the requested resources are not available
        qhold [ -h hold_list ] job_identifier
        n:none, u:user,o:operator,s:system"; 
        break; fi;
if [[ $i == qrls ]]; then
        echo "The qrls is used to release the jobs holded
        due to the system resource unavailability 
        qrls [ -h hold_list ] job_identifier
        qstat -a jobid # get the job
        qhold jobid # hold the job
        qrls -h u jobid # release the job"; 
        break; fi;
if [[ $i == qmove ]]; then
        echo "this allows for the moving of the jobs to
        the new allocated server and to allow for the new
        server to be used.
        qmove destination job_identifier(s)"; 
        break; fi;
if [[ $i == qstat ]]; then
        echo "qstat is the most user friendly command
        to be used on the PBS and it is used to check 
        your server status and also check your job status
        Available options are qstat -a or qstat -Bf or
        qstat -Q or qstat -Qf qstat -f jobname or qstat -u username
        qstat -G (GB mem list), qstat -M (megaword listing),
        qstat -n (display all the nodes), qstat -s (display job comments)
        qstat -q (display limits) "; 
        break; fi;
if [[ $i == qselect ]]; then
        echo "The qselect is used to alter the allocated resources and 
        also to allow for the change. List all the nodes used by the 
        user which require such number of nodes
        qselect -u user -l ncpus.gt.cpu # where cpu is the cpu number
        qstat -a ' qselect -u user -l ncpus.gt.cpu"; 
        break; fi;
if [[ $i == qalter ]]; then
        echo "qalter is used to alter the allocated resources and 
        it should be used to change the resources on the jobs 
        already allocated. 
        qalter -l walltime=110:00 -N bladename username"; 
        break; fi;
done
