#!/bin/bash
source mvbuild.config
# Source file will include the following path names
	# tomcat_home - This is the main directory for all Tomcat install
	# workspace_home - This is the main directory containing Workspaces for all projects

param1=$1
param2=$2

if [ "$param1" = "-hot" ]; then
	# If the first parameter is -hot, script will hot deploy to the second parameter
	echo "Hot deploying..."
  echo "Deploy target: $tomcat_home/$param2"
	echo "Run hot deploy code"
	shift 2
else
	if [ "$param1" = "-clean" ]; then
		# If the first parameter is -clean, script will run a clean install to the second parameter
    #echo "Run clean install HAS CLEAN PARAM"
		echo "Building clean install..."
	  echo "Deploy target: $tomcat_home/$param2"
		shift 2
	else
		# If the first parameter is not -clean or -hot, script will default to a clean install to the first parameter
  	#echo "Run clean install NO PARAM"
		echo "Building clean install..."
	  echo "Deploy target: $tomcat_home/$param1"
		shift
  fi
fi

# Loop through the remaining parameters, changing directories through the workspace and build all necessary poms
until [ -z "$1" ]  # Until all parameters used up . . .
do
  echo "Change directory and execute again"
	echo "Tomcat directory: $tomcat_home"
  # cd $workspace_home/$1
	echo $workspace_home/${1}
	shift
done