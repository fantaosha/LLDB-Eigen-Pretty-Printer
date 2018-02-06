#/bin/bash
INSTALL_PATH=~/.lldb-eigen-pretty-printer

# color helpers
function heading () {
	printf '\e[48;1;4m%s\e[0m \n' "$1"
}

function notice () {
	printf '\e[0;32m%s\e[0m \n' "$1"
}

function error () {
	printf '\e[41m%s\e[0m \n' "$1"
	exit;
}

function warn () {
	printf '\e[48;5;208m%s\e[0m \n' "$1"
}

function color_grad () {
	if [ "$1" -lt "$2" ]; then
		for (( i=$1; i<=$2; i++ )); do printf "\e[48;5;${i}m \e[0m" ; done ;
	else
		for (( i=$1; i>=$2; i-- )); do printf "\e[48;5;${i}m \e[0m" ; done ;
	fi
}

function fancy_heading () {
	#color_grad 16 21
	printf "%-60s" "$1"
	#color_grad 21 16
	printf "\n"
}

function fancy_sep () {
	local colored_ws=$(printf "%60s" " " | sed -e 's/./\\e[48;5;21m \\e[0m/g');

	#color_grad 16 21
	#printf "$colored_ws"
	#color_grad 21 16
	printf "\n"
}

function colored_ws () {
	#local colored_ws=$(echo "$2" | sed -e 's/./\\e[48;5;'"$1"'m \\e[0m/g');
	local colored_ws=$(printf "%$2s" " " | sed -e 's/./\\e[48;5;'"$1"'m \\e[0m/g');
	#printf "$colored_ws";
}

# error handler
function error_handler () {
	local signal=$?
	if $EXIT_ON_ERROR; then
		# exit on error with error message
		[ "$signal" -eq 0 ] || error "uncaught exception occured"
	else
		[ "$signal" -eq 0 ] || warn "uncaught exception occured"
	fi
}

trap error_handler ERR # use 'trap - ERR' to remove

fancy_sep;
fancy_heading "------------------------------------------------------------"
fancy_heading "    LLDB Eigen Pretty Printer"
fancy_heading "------------------------------------------------------------"
fancy_heading " Contact"
fancy_heading "   Taohsa Fan"
fancy_heading "   taosha.fan@gmail.com"
fancy_heading " Documentation"
fancy_heading "   https://github.com/fantaosha/LLDB-Eigen-Pretty-Printer"
fancy_heading "------------------------------------------------------------"
fancy_sep;

if [ -d "$INSTALL_PATH" ]; then
	notice "Already installed."
	exit
fi

notice "Downloading files"
git clone -q https://github.com/fantaosha/LLDB-Eigen-Pretty-Printer.git $INSTALL_PATH

#
# Add to lldbinit
#
trap - Err
$(cat ~/.lldbinit 2>/dev/null | grep "LLDB-Eigen-Pretty-Printer.py")
ALREADY_INSTALLED=$?
trap error_handler Err
notice "Adding pretty printer to ~/.lldbinit"
if [ ! $ALREADY_INSTALLED -eq 0 ]; then
	echo 'command script import "'$INSTALL_PATH'/LLDB_Eigen_Pretty_Printer.py"' >> ~/.lldbinit
else
	notice "Skipping"
fi

notice "Installation successfull."
