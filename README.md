# Command Line Scripts for Maven Builds and Tomcat Administration

 This project contains basic bash scripts which create and easy way to complete maven builds and run tomcat commands through the Command Line Interface.

## Usage
 In order to download or participate in development of these scripts, please download and install Git.  Instructions can be found [here](http://help.github.com/mac-set-up-git/).

 After you have downloaded the scripts and config file to your desired directory, make the .sh files executable:

	$ chmod +x build.sh
	$ chmod +x tcat.sh

## The Files

### mvbuild.config
 In their current states, these scripts will only work if your Workspace (the directory containing your working copies from SVN) and Tomcat directory (each site will need its own instance of Tomcat) have the same name.  Use this config file to point to the directory containing these directories (easy, right?...).

### build.sh
 With the scripts being executable and your config file setup, you're ready to build some projects.  The script can be executed like this:

	$ ./build.sh buildType website project1 project2 ...

 **buildType** - This script can either build a clean install or hot deploy projects.  By default, the script will run a clean install on all projects listed after the website.  It can also be triggered by using *-clean* as the value for buildType.  In order to hot deploy a project, use *-hot* as the buildType.


 **website** - This value is used to tell the script in which Workspace to find the projects, as well as to which instance of Tomcat to deploy.

 **project1** - This script can build as many projects as you would like.  As long as the project you put here has a pom.xml file, this script will build it.

### tcat.sh
 All this script does is provide an easy way to start and stop Tomcat.  It takes *start* or *stop* as the first argument, and the instance of Tomcat for the second argument.  The second argument should be the same value that you used for *website* in **build.sh**.

	$ ./tcat.sh start website
	$ ./tcat.sh stop website

 

