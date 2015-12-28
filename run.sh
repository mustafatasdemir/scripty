#!/bin/bash
#title              : scripty.sh
#description        : This script will help you automate installation and
#                   restoration process.
#author             : Mustafa Tasdemir
#date               : 20151101
#version            : 0.1
#usage              : sudo sh scripty.sh
#notes              : Make sure you run this script in super user mode
#==============================================================================



# *** BEGIN REGION *** Global Variables
#
#
#
#

# Used to indicate the progress made
progress_string="[================================================]";
silent_install="silent";
error_flag=0;

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

final_feedback () {
	if [ "$error_flag" = '1' ]; then
		echo "Invalid Option! Please, specify one of above options!";
		error_flag=0;
	else
		echo "\nTask finished! Press 'Enter' to continue!";
	fi
}

invalid_option () {
	error_flag=1;
	echo "Invalid Option! Please, specify one of above options!";
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

# Install apss that start with 'A'
install_arronax () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Arronax started!";
	update_progress count total_steps Arronax;              # Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y ppa:diesch/testing >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:diesch/testing;
	fi
	update_progress count total_steps Arronax;              # Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Arronax;              # Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y arronax >> log/log.txt 2>&1;
	else
		sudo apt-get install arronax;
	fi

	update_progress count total_steps Arronax;              # Update progress
}


# Install apss that start with 'C'
install_clementine () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Clementine started!";
	update_progress count total_steps Clementine;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:me-davidsansome/clementine >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:me-davidsansome/clementine;
	fi
	update_progress count total_steps Clementine;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Clementine;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y clementine >> log/log.txt 2>&1;
	else
		sudo apt-get install clementine;
	fi

	update_progress count total_steps Clementine;			# Update progress
}

# Install apss that start with 'K'
install_kid3 () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Kid3 started!";
	update_progress count total_steps Kid3;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:ufleisch/kid3 >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:ufleisch/kid3;
	fi
	update_progress count total_steps Kid3;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Kid3;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y kid3 >> log/log.txt 2>&1;
	else
		sudo apt-get install kid3;
	fi

	update_progress count total_steps Kid3;			# Update progress
}


# Install apss that start with 'P'
install_pidgin () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Pidgin started!";
	update_progress count total_steps Pidgin;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:pidgin-developers/ppa >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:pidgin-developers/ppa;
	fi
	update_progress count total_steps Pidgin;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Pidgin;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y pidgin >> log/log.txt 2>&1;
	else
		sudo apt-get install pidgin;
	fi

	update_progress count total_steps Pidgin;			# Update progress
}


# Install apss that start with 'S'
install_sublime () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Sublime Text 2 started!";
	update_progress count total_steps Sublime;              # Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:webupd8team/sublime-text-2 >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:webupd8team/sublime-text-2;
	fi
	update_progress count total_steps Sublime;              # Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Sublime;              # Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y sublime-text >> log/log.txt 2>&1;
	else
		sudo apt-get install sublime-text;
	fi

	update_progress count total_steps Sublime;              # Update progress
}

# Install apss that start with 'T'
install_terminator () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Terminator started!";
	update_progress count total_steps Terminator;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:gnome-terminator >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:gnome-terminator;
	fi
	update_progress count total_steps Terminator;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Terminator;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y terminator >> log/log.txt 2>&1;
	else
		sudo apt-get install terminator;
	fi

	update_progress count total_steps Terminator;			# Update progress
}


# Install apss that start with 'V'
install_vim () {
	count=-1;
	total_steps=2;

	# Initial feedback
	log_initial_feedback "Installation of vim started!";
	update_progress count total_steps Vim;                  # Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Vim;                  # Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y vim >> log/log.txt 2>&1;
	else
		sudo apt-get install vim;
	fi

	update_progress count total_steps Vim;                  # Update progress
}


# Install all programs
install_all () {

	# Initial feedback
	log_initial_feedback "Installation of ALL programs started!";

	if [ "$1" = silent_install ]; then
		# A
		install_arronax $silent_install;

		# C
		install_clementine $silent_install;

		# K
		install_kid3 $silent_install;

		# P
		install_pidgin $silent_install;

		# S
		install_sublime $silent_install;

		# T
		install_terminator $silent_install;

		# V
		install_vim $silent_install;
	else
		# A
		install_arronax;

		# C
		install_clementine;

		# K
		install_kid3;

		# P
		install_pidgin;

		# S
		install_sublime;

		# T
		install_terminator;

		# V
		install_vim;
	fi
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
		(with category letter concatenated with specified
			number before the option)
		You can also append "v" to the input to see output of installation
		Example:
		(a1/A1) installs the program under alphabet A whose number is 1
			on the right
		(a1v/A1v) installs the program under alphabet A whose number is 1
			on the right. You can see command output with this option
		Type 'a/A' to install all programs listed
		Type 'b/B' to go back to main menu

		------------------------------
		List of Programs
		------------------------------

		A___
		(1) Arronax

		C___
		(1) Clementine

		K___
		(1) Kid3

		P___
		(1) Pidgin

		S___
		(1) Sublime Text 2

		T___
		(1) Terminator

		V___
		(1) Vim

		__________________________
		INSTALL ALL PROGRAMS (a/A)

		------------------------------
			   Back to Main Menu (B/b)
		------------------------------
IMEOF
		read install_option
		case "$install_option" in
			# All programs
			"a"|"A")		install_all $silent_install						;;
			"av"|"Av")		install_all										;;

			# A___
			"a1"|"A1")		install_arronax $silent_install					;;
			"a1v"|"A1v")	install_arronax									;;


			# C___
			"c1"|"C1")		install_clementine $silent_install				;;
			"c1v"|"C1v")	install_clementine								;;


			# K___
			"k1"|"K1")		install_kid3 $silent_install					;;
			"k1v"|"K1v")	install_kid3									;;


			# P___
			"p1"|"P1")		install_pidgin $silent_install					;;
			"p1v"|"P1v")	install_pidgin									;;


			# S___
			"s1"|"S1")		install_sublime $silent_install	;;
			"s1v"|"S1v")	install_sublime									;;


			# T___
			"t1"|"T1")		install_terminator $silent_install				;;
			"t1v"|"T1v")	install_terminator								;;


			# V___
			"v1"|"V1")		install_vim $silent_install						;;
			"v1v"|"V1v")	install_vim										;;

			# Others
			"B")			return											;;
			"b")			return											;;
			* )				error_flag=1;									;;
		esac
		final_feedback;
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

# Prepare logging elements before beginning
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
	"1")  install_menu                                                      ;;
	"2")  install_menu                                                      ;;
	"3")  echo "you chose choice 3"                 ;;
	"Q")  exit_program                      ;;
	"q")  exit_program                      ;;
	 * )  echo "Invalid Option! Please, specify any of above options!"      ;;
	esac
done

#
#
#
#
# *** END REGION *** MAIN
