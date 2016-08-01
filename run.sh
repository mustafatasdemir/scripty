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
back_flag=0;

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
	# If user did not choose back, perform the evaluation
	if [ "$back_flag" = '0' ]; then
		if [ "$error_flag" = '1' ]; then
			echo "Invalid Option! Please, specify one of above options!";
			error_flag=0;
		else
			echo "\nTask finished! Press 'Enter' to continue!";
		fi
		read finished;
	else
		# Reset the back flag
		back_flag=0;
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


# Install apss that start with 'C'
install_dolphin_emu () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Dolphin Emulator started!";
	update_progress count total_steps Dolphin;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:dolphin-emu/ppa >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:dolphin-emu/ppa;
	fi
	update_progress count total_steps Dolphin;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Dolphin;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y dolphin-emu >> log/log.txt 2>&1;
	else
		sudo apt-get install dolphin-emu;
	fi

	update_progress count total_steps Dolphin;			# Update progress
}


# Install apss that start with 'F'
install_firefox () {
	count=-1;
	total_steps=2;

	# Initial feedback
	log_initial_feedback "Installation of Firefox started!";
	update_progress count total_steps Firefox;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Firefox;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y firefox >> log/log.txt 2>&1;
	else
		sudo apt-get install firefox;
	fi

	update_progress count total_steps Firefox;			# Update progress
}


# Install apss that start with 'G'
install_gimp () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Gimp started!";
	update_progress count total_steps Gimp;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:otto-kesselgulasch/gimp >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:otto-kesselgulasch/gimp;
	fi
	update_progress count total_steps Gimp;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Gimp;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y gimp >> log/log.txt 2>&1;
	else
		sudo apt-get install gimp;
	fi

	update_progress count total_steps Gimp;			# Update progress
}

install_gmusicbrowser () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Gmusicbrowser started!";
	update_progress count total_steps Gmusicbrowser;		# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:andreas-boettger/gmusicbrowser-daily >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:andreas-boettger/gmusicbrowser-daily;
	fi
	update_progress count total_steps Gmusicbrowser;		# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Gmusicbrowser;		# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y gmusicbrowser >> log/log.txt 2>&1;
	else
		sudo apt-get install gmusicbrowser;
	fi

	update_progress count total_steps Gmusicbrowser;		# Update progress
}

install_grubcustomizer () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of Grub Customizer started!";
	update_progress count total_steps GrubCustomizer;		# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:danielrichter2007/grub-customizer >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:danielrichter2007/grub-customizer;
	fi
	update_progress count total_steps GrubCustomizer;		# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps GrubCustomizer;		# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y grub-customizer >> log/log.txt 2>&1;
	else
		sudo apt-get install grub-customizer;
	fi

	update_progress count total_steps GrubCustomizer;		# Update progress
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


# Install apss that start with 'M'
install_mediaelch () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of MediaElch started!";
	update_progress count total_steps MediaElch;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:kvibes/mediaelch >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:kvibes/mediaelch;
	fi
	update_progress count total_steps MediaElch;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps MediaElch;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y mediaelch >> log/log.txt 2>&1;
	else
		sudo apt-get install mediaelch;
	fi

	update_progress count total_steps MediaElch;			# Update progress
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

install_pip () {
	count=-1;
	total_steps=2;

	# Initial feedback
	log_initial_feedback "Installation of pip started!";
	update_progress count total_steps pip;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps pip;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y python-pip >> log/log.txt 2>&1;
	else
		sudo apt-get install python-pip;
	fi

	update_progress count total_steps pip;			# Update progress
}

install_pycharm () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of PyCharm IDE started!";
	update_progress count total_steps PyCharm;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:mystic-mirage/pycharm >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:mystic-mirage/pycharm;
	fi
	update_progress count total_steps PyCharm;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps PyCharm;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y pycharm-community >> log/log.txt 2>&1;
	else
		sudo apt-get install pycharm-community;
	fi

	update_progress count total_steps PyCharm;			# Update progress
}


# Install apss that start with 'S'
install_spotify () {
	count=-1;
	total_steps=4;

	# Initial feedback
	log_initial_feedback "Installation of Spotify started!";
	update_progress count total_steps Spotify;              # Update progress

	# Add the Spotify repository signing key to be able to verify packages
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
			--recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 >> \
			log/log.txt 2>&1;
	else
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
			--recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886;
	fi
	update_progress count total_steps Spotify;              # Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		echo deb http://repository.spotify.com stable non-free | sudo tee \
			/etc/apt/sources.list.d/spotify.list >> log/log.txt 2>&1;
	else
		echo deb http://repository.spotify.com stable non-free | sudo tee \
			/etc/apt/sources.list.d/spotify.list;
	fi
	update_progress count total_steps Spotify;              # Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps Spotify;              # Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y spotify-client >> log/log.txt 2>&1;
	else
		sudo apt-get install spotify-client;
	fi

	update_progress count total_steps Spotify;              # Update progress
}

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


install_vlc () {
	count=-1;
	total_steps=3;

	# Initial feedback
	log_initial_feedback "Installation of VLC started!";
	update_progress count total_steps VLC;			# Update progress

	# Add required PPA repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo add-apt-repository -y \
			ppa:nicola-onorata/desktop >> log/log.txt 2>&1;
	else
		sudo add-apt-repository ppa:nicola-onorata/desktop;
	fi
	update_progress count total_steps VLC;			# Update progress

	# Update repository
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get update >> log/log.txt 2>&1;
	else
		sudo apt-get update;
	fi
	update_progress count total_steps VLC;			# Update progress

	# Install the program
	# If detailed output is desired, execute accordingly
	if [ "$1" = $silent_install ]; then
		sudo apt-get install -y vlc >> log/log.txt 2>&1;
	else
		sudo apt-get install vlc;
	fi

	update_progress count total_steps VLC;			# Update progress
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

		# D
		install_dolphin_emu $silent_install;

		# F
		install_firefox $silent_install;

		# G
		install_gimp $silent_install;
		install_gmusicbrowser $silent_install;
		install_grubcustomizer $silent_install;

		# K
		install_kid3 $silent_install;

		# M
		install_mediaelch $silent_install;

		# P
		install_pidgin $silent_install;
		install_pip $silent_install;
		install_pycharm $silent_install;

		# S
		install_spotify $silent_install;
		install_sublime $silent_install;

		# T
		install_terminator $silent_install;

		# V
		install_vim $silent_install;
		install_vlc $silent_install;
	else
		# A
		install_arronax;

		# C
		install_clementine;

		# D
		install_dolphin_emu;

		# F
		install_firefox;

		# G
		install_gimp;
		install_gmusicbrowser;
		install_grubcustomizer;

		# K
		install_kid3;

		# M
		install_mediaelch;

		# P
		install_pidgin;
		install_pip;
		install_pycharm;

		# S
		install_spotify;
		install_sublime;

		# T
		install_terminator;

		# V
		install_vim;
		install_vlc;
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

		D___
		(1) Dolphin Emulator

		F___
		(1) Firefox

		G___
		(1) Gimp
		(2) Gmusicbrowser
		(3) Grub Customizer

		K___
		(1) Kid3

		M___
		(1) Mediaelch

		P___
		(1) Pidgin
		(2) Pip
		(3) PyCharm IDE

		S___
		(1) Spotify
		(2) Sublime Text 2

		T___
		(1) Terminator

		V___
		(1) Vim
		(2) VLC

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


			# D___
			"d1"|"D1")		install_dolphin_emu $silent_install				;;
			"d1v"|"D1v")	install_dolphin_emu								;;


			# F___
			"f1"|"F1")		install_firefox $silent_install					;;
			"f1v"|"F1v")	install_firefox									;;


			# G___
			"g1"|"G1")		install_gimp $silent_install					;;
			"g1v"|"G1v")	install_gimp									;;
			"g2"|"G2")		install_gmusicbrowser $silent_install			;;
			"g2v"|"G2v")	install_gmusicbrowser							;;
			"g3"|"G3")		install_grubcustomizer $silent_install			;;
			"g3v"|"G3v")	install_grubcustomizer							;;


			# K___
			"k1"|"K1")		install_kid3 $silent_install					;;
			"k1v"|"K1v")	install_kid3									;;


			# M___
			"m1"|"M1")		install_mediaelch $silent_install				;;
			"m1v"|"M1v")	install_mediaelch								;;


			# P___
			"p1"|"P1")		install_pidgin $silent_install					;;
			"p1v"|"P1v")	install_pidgin									;;
			"p2"|"P2")		install_pip	$silent_install						;;
			"p2v"|"P2v")	install_pip										;;
			"p3"|"P3")		install_pycharm	$silent_install						;;
			"p3v"|"P3v")	install_pycharm										;;


			# S___
			"s1"|"S1")		install_spotify $silent_install	;;
			"s1v"|"S1v")	install_spotify									;;
			"s2"|"S2")		install_sublime $silent_install	;;
			"s2v"|"S2v")	install_sublime									;;


			# T___
			"t1"|"T1")		install_terminator $silent_install				;;
			"t1v"|"T1v")	install_terminator								;;


			# V___
			"v1"|"V1")		install_vim $silent_install						;;
			"v1v"|"V1v")	install_vim										;;
			"v2"|"V2")		install_vlc $silent_install										;;
			"v2v"|"V2v")	install_vlc										;;

			# Others
			"B"|"b")		back_flag=1 && return							;;
			* )				error_flag=1;									;;
		esac
		final_feedback;
	done
}



#
#
#
#
# *** END REGION *** Installation of individual scripts or programs

#==============================================================================


# *** BEGIN REGION *** Tweak and/or restore features
#
#
#
#

# Restorea Gnome Shell Extensions that can be configured in Tweak Tool
restore_gnome_extensions () {
	# First remove the existing extensions folders
	sudo rm -Rf ~/.local/share/gnome-shell/extensions/
	# Untar the backup archieve to the destination folder
	sudo tar -zxvf extensions/extensions.tar.gz -C ~/.local/share/gnome-shell/
}

restore_terminal_welcome_message_via_file () {
	if [ "$1" = 'use_default_file' ]; then
		rm -Rf ~/bash_welcome_message;
		cp files/bash_welcome_message ~/;
	fi
	sudo sed -i "/\b\(bash_welcome_message\)\b/d" ~/.bashrc;
	sudo sed -i '$a printf "$(cat ~/bash_welcome_message)"' ~/.bashrc;
}

delete_terminal_welcome_message () {
	rm -Rf ~/bash_welcome_message;
	sudo sed -i "/\b\(bash_welcome_message\)\b/d" ~/.bashrc;
}

set_terminal_welcome_message () {
	while :
	do
		# Clear the contents
		clear
		cat<<BASHWELCOME
		==============================
		Set Welcome Message for Terminal
		------------------------------

		You are about to set a welcome message for your system terminal.
		Please, make sure that you have a file named as
		'bash_welcome_message' under user's home directory
		for this script to work effectively!

		Please enter your choice:
		(with with specified letter in brackets)
		Type 'c/C' to copy & use the file that comes with this installation
		Type 'b/B' to go back to main menu

		------------------------------
		Proceed?
		------------------------------

		[Y]es! 									[N]o!!!


		------------------------------
			   Back to Main Menu (B/b)
		------------------------------
BASHWELCOME
		read install_option
		case "$install_option" in

			"Y"|"y")		restore_terminal_welcome_message_via_file \
							${1-no_default_file}							;;
			"N"|"n")		return											;;

			# Use provided file
			"C"|"c")		restore_terminal_welcome_message_via_file \
							use_default_file								;;

			# Others
			"B"|"b")		back_flag=1 && return							;;
			* )				error_flag=1;									;;
		esac
		final_feedback;
	done

}

remove_terminal_welcome_message () {
	while :
	do
		# Clear the contents
		clear
		cat<<BASHWELCOME
		==============================
		Remove Welcome Message for Terminal
		------------------------------

		You are about to remove welcome message for your system terminal.
		This feature will work if you have set the message using this
		program. Otherwise, it won't take effect!

		Please enter your choice:
		(with with specified letter in brackets)
		Type 'b/B' to go back to main menu

		------------------------------
		Proceed?
		------------------------------

		[Y]es! 									[N]o!!!


		------------------------------
			   Back to Main Menu (B/b)
		------------------------------
BASHWELCOME
		read remove_option
		case "$remove_option" in

			"Y"|"y")		delete_terminal_welcome_message					;;
			"N"|"n")		return											;;

			# Others
			"B"|"b")		back_flag=1 && return							;;
			* )				error_flag=1;									;;
		esac
		final_feedback;
	done

}


# Tweak & Restore Menu
tweak_restore_menu () {
	while :
	do
		# Clear the contents
		clear
		cat<<TWEAKRESTORE
		==============================
		Tweak & Restore Features
		------------------------------

		Please enter your choice:
		(with specified number before the option)
		Type 'b/B' to go back to main menu

		------------------------------
		List of Options
		------------------------------

		(1) Set Welcome Message for Terminal
		(2) Remove Welcome Message from Terminal


		------------------------------
			   Back to Main Menu (B/b)
		------------------------------
TWEAKRESTORE
		read restore_option
		case "$restore_option" in

			"1")		set_terminal_welcome_message						;;
			"2")		remove_terminal_welcome_message						;;

			# Others
			"B"|"b")	back_flag=1 && return								;;
			* )			error_flag=1;										;;
		esac
		final_feedback;
	done
}



#
#
#
#
# *** END REGION *** Tweak and/or restore features


#==============================================================================

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

	(1) Install -- This option lets you install several programs
	(2) Tweak & Restore -- This option lets you change features
	Install (2)
	Option (3)
	------------------------------
		   Quit (Q/q)
	------------------------------
EOF
	read option
	case "$option" in

		"1")		install_menu											;;
		"2")		tweak_restore_menu										;;
		"3")		echo "you chose choice 3"								;;


		# Others
		"Q"|"q")	exit_program											;;
		* )			error_flag=1;											;;
	esac
	final_feedback;
done

#
#
#
#
# *** END REGION *** MAIN
