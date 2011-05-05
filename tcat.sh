#!/bin/bash
source mvbuild.config
# Source file will include the following path names
	# tomcat_home - This is the main directory for all Tomcat install
	# workspace_home - This is the main directory containing Workspaces for all projects

action=$1
instance=$2

cd $tomcat_home/$instance

if [ "$action" = "start" ]; then
	echo "Starting Tomcat in $tomcat_home/$instance ..."
	bin/startup.sh
else
	if [ "$action" = "stop" ]; then
		echo "Shutting down Tomcat in $tomcat_home/$instance ..."
		bin/shutdown.sh
	else
		echo "Please either start or stop Tomcat..."
  fi
fi