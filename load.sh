#!/bin/bash
cpus=$(grep -c processor /proc/cpuinfo); 
load=$(cut -d ' ' -f  3 /proc/loadavg); 
half=$(echo - | awk "{print $cpus / 2}") ; 
critical=$(echo - | awk "{print $cpus + $half }"); 
echo " "; 
myvar=`echo - | awk "{print  $cpus - $load}"`; 
float='^[0-9]+([.][0-9]+)?$' ; 

if [[ $myvar =~ $float ]] && [[ "$myvar" != 0 ]]  ;  
     then newline="\n=========================================================================================\n"; 
         printf "$newline";  
         echo "the server currently has had an available CPU capacity of approximately $myvar over the past 15 minutes"; 
         printf "\n"; 
else if [[ "$myvar" == 0 ]]  ; 
     then printf "\n"; 
         echo  "the server is currently running at maximum capacity with $myvar, please monitor this if capacity drops below the minimum\n" ; 
         printf "\n"; 
else overcap=`echo $myvar | sed 's/-//g'`; 
     printf "\n"; 
     echo "The server has bypassed its maximum level of available capacity by approximately ~ $overcap over the past 15 minutes, please investigate this."; 
     printf "\n"; 
     fi; 
     fi; 
     printf "This is derived from the current load of $load \n\n" ; 
     printf  "The status of this servers load will be at WARNING when it reaches %.2f\nThe recommended alarm setting for this servers WARNING alarm threshold for LOAD should be set to this same value\n\n" $cpus ; 
     printf "The status of this servers load will be at CRITICAL when it reaches %.2f\nThe recommended alarm setting for the servers CRITICAL alarm threshold for LOAD should be set to the same value\n" $critical;
     printf "\nbelow you will find the results of the five processes that are consuming the most CPU time on your system\n\n" ; 
     OUTPUT="$(ps -eo user,pcpu,pid,cmd | sort -r -k2 | head -6)"; 
     echo "${OUTPUT}"; 
     printf "$newline";

