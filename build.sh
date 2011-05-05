#!/bin/bash
echo "Reading config..."
source mvbuild.config
# Source file will include the following path names
	# tomcat_home - This is the main directory for all Tomcat install
	# workspace_home - This is the main directory containing Workspaces for all projects

param1=$1
param2=$2

if [ "$param1" = "-hot" ]; then
	# If the first parameter is -hot, script will hot deploy to the second parameter
	echo "Hot deploying..."
	project_name=$param2
	echo "Deploy target: $tomcat_home/$project_name"
	echo "Run hot deploy code"
	command="mvn -Dtomcat.home=$tomcat_home/$project_name -Dmaven.test.skip=true resources:resources compile war:exploded"
	shift 2
else
	if [ "$param1" = "-clean" ]; then
		# If the first parameter is -clean, script will run a clean install to the second parameter
    #echo "Run clean install HAS CLEAN PARAM"
		echo "Building clean install..."
		project_name=$param2
		echo "Deploy target: $tomcat_home/$param2"
		command="mvn -Dtomcat.home=$tomcat_home/$project_name -Dmaven.test.skip=true clean install"
		shift 2
	else
		# If the first parameter is not -clean or -hot, script will default to a clean install to the first parameter
  	#echo "Run clean install NO PARAM"
		echo "Building clean install..."
		project_name=$param1
		echo "Deploy target: $tomcat_home/$project_name"
		command="mvn -Dtomcat.home=$tomcat_home/$project_name -Dmaven.test.skip=true clean install"
		shift
  fi
fi

echo "Executing on project: $project_name"

# Loop through the remaining parameters, changing directories through the workspace and build all necessary poms
until [ -z "$1" ]  # Until all parameters used up . . .
do
	echo "Project name: $project_name"
	echo "Tomcat directory: $tomcat_home"
	echo "Building project: $workspace_home/$project_name/$1"
	cd $workspace_home/$project_name/$1
	$command
	shift
done