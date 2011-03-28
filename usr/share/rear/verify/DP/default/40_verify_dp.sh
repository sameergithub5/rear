# 40_verify_dp.sh
# read DP vars from config file
CELL_SERVER="`cat /etc/opt/omni/client/cell_server`"

# check that cell server is actually available (ping)
test "${CELL_SERVER}" || Error "DP Cell Server not set in /etc/opt/omni/client/cell_server (TCPSERVERADDRESS) !"

if test "$PING" ; then
	if ping -c 1 "${CELL_SERVER}" >/dev/null 2>&1 ; then
	   Log "DP Cell Server ${CELL_SERVER} seems to be up and running."
	else
	   Error "Sorry, but cannot reach DP Cell Server ${CELL_SERVER}"
	fi
else
	Log "Skipping ping test"
fi
