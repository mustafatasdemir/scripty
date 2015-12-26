#!/bin/bash
#title				: scripty.sh
#description		: This script will help you automate installation and
#					restoration process.
#author				: Mustafa Tasdemir
#date				: 20151101
#version 			: 0.1    
#usage				: sudo sh scripty.sh
#notes				: Make sure you run this script in super user mode
#==============================================================================



# *** BEGIN REGION *** Global Variables
#
#
#
#

# Used to indicate the progress made
progress_string="[================================================]";
silent_installation_keyword="silent";

#
#
#
#
# *** END REGION *** Global Variables

#==============================================================================

# *** BEGIN REGION *** Helper Functions
#
#
#
#

# Prepare logging folders and files
prepare_log_env () {
	# Delete previously generated logs
	sudo rm -Rf log/
	# Create log directory
	mkdir log/
}

# Reflect the progress made depending on the current and total tasks (commands)
# $1 : current count of the commands processed within the local scope
# $2 : total count of the commands processed within the local scope
update_progress () {
	# Current count
	count=$(( $1 + 1 ));
	# Total count
	total=$(( $2 ));
	# Print the progress depending on the character count in progress string
  	pd=$(( $count * 50 / $total ));
  	printf "\rProgress[$3]: %3d.%1d%% %.${pd}s" \
  	$(( $count * 100 / $total )) \
  	$(( ($count * 1000 / $total) % 10 )) \
  	$progress_string;
}

# Logs initial feedback and underlines the log message
log_initial_feedback () {
	# Initial index
	start=1;
	# Hold parameter to calculate the size
	i=$1;
	# Find the size of the parameter
	size=${#i};
	# Print new line and parameter
	echo "\n";
	echo $1;
	# Print the special character in the amount of parameter size and new line
	while [ $start -le $size ]
	do
		printf "‾";
		start=`expr $start + 1`
	done
	printf "\n";
}

# Exit the program when prompted
exit_program () {
	# Clear the contents
	clear;
	# Exit program
	exit;
}

#
#
#
#
# *** END REGION *** Helper Functions

#==============================================================================

# *** BEGIN REGION *** Installation of individual scripts or programs
#
#
#
#

install_arronax () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Arronax started!";
	update_progress count total_steps Arronax;				# Update progress

	# Add required PPA repository
	sudo add-apt-repository -y ppa:diesch/testing >> log/log.txt 2>&1;
	update_progress count total_steps Arronax;				# Update progress
	
	# Update repository
	sudo apt-get update >> log/log.txt 2>&1;
	update_progress count total_steps Arronax;				# Update progress
	
	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = 'silent' ]; then
		sudo apt-get install -y arronax >> log/log.txt 2>&1;
	else
		sudo apt-get install -y arronax;
	fi

	update_progress count total_steps Arronax;				# Update progress
}

install_sublime () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Sublime Text 2 started!";
	update_progress count total_steps Sublime;				# Update progress

	# Add required PPA repository
	sudo add-apt-repository -y \
	ppa:webupd8team/sublime-text-2 >> log/log.txt 2>&1;
	update_progress count total_steps Sublime;				# Update progress
	
	# Update repository
	sudo apt-get update >> log/log.txt 2>&1;
	update_progress count total_steps Sublime;				# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = 'silent' ]; then
		sudo apt-get install -y sublime-text >> log/log.txt 2>&1;
	else
		sudo apt-get install -y sublime-text;
	fi
	
	update_progress count total_steps Sublime;				# Update progress
}


# Install all programs
install_all () {

	# Initial feedback
	log_initial_feedback "Installation of ALL programs started!";

	# A
	install_arronax silent;

	# S
	install_sublime silent;
}


# Install Menu
install_menu () {
	while :
	do
		# Clear the contents
		clear
		cat<<IMEOF
		==============================
		Install A Program
		------------------------------
		Please enter your choice:
		(with specified input after the option)
		You can also append "v" to the input to see output of installation

		A_____
		Arronax (1)

		S_____
		Sublime Text 2 (2)
		
		________________________
		INSTALL ALL PROGRAMS (a)

		------------------------------
			   Back to Main Menu (B/b)
		------------------------------
IMEOF
		read install_option
		case "$install_option" in
		"a")  install_all													;;
		"1")  install_arronax												;;
		"1v")  install_arronax silent										;;
		"2")  install_sublime												;;
		"2v")  install_sublime silent										;;
		"B")  return						;;
		"b")  return						;; 
		 * )  echo "Invalid Option! Please, specify any of above options!"	;;
		esac
		echo "Task finished! \nPress 'Enter' to continue!";
		read finished;
	done
}



#
#
#
#
# *** END REGION *** Installation of individual scripts or programs

#==============================================================================

# Restorea Gnome Shell Extensions that can be configured in Tweak Tool
restore_gnome_extensions () {
	# First remove the existing extensions folders
	sudo rm -Rf ~/.local/share/gnome-shell/extensions/
	# Untar the backup archieve to the destination folder
	sudo tar -zxvf extensions/extensions.tar.gz -C ~/.local/share/gnome-shell/
}




# *** BEGIN REGION *** MAIN
#
#
#
#


prepare_log_env;

while :
do
	# Clear the contents
	clear
	cat<<EOF
	==============================
	Linux Restore Components Script
	------------------------------
	Please enter your choice:
	(with specified input before the option)

	(1) Install -- Use this option to install several programs
	Restore Gnome Extensions (1)
	Install (2)
	Option (3)
	------------------------------
		   Quit (Q/q)
	------------------------------
EOF
	read option
	case "$option" in
	"1")  install_menu 														;;
	"2")  install_menu 														;;
	"3")  echo "you chose choice 3" 				;;
	"Q")  exit_program						;;
	"q")  exit_program						;; 
	 * )  echo "Invalid Option! Please, specify any of above options!"		;;
	esac
done

#
#
#
#
# *** END REGION *** MAIN