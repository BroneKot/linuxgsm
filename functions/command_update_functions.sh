#!/bin/bash
# LGSM update_functions.sh function
# Author: Daniel Gibbs
# Website: http://gameservermanagers.com
lgsm_version="270216"

# Description: Deletes the functions dir to allow re-downloading of functions from GitHub.

function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"
check.sh
fn_printdots "Updating functions"
fn_scriptlog "Updating functions"
sleep 1
echo -ne "\n"
if [ -d "${rootdir}/functions/" ]; then
	rm -rfv "${rootdir}/functions/"
	exitcode=$?
elif [ -n "${functionsdir}" ]; then
	rm -rfv "${functionsdir}/"*
	exitcode=$?
else
	fn_printfail "Updating functions"
	fn_scriptlog "Failure! Updating functions"	
fi

if [ "${exitcode}" == "0" ]; then
	fn_printok "Updating functions"
	fn_scriptlog "Success! Updating functions"
else
	fn_printfail "Updating functions"
	fn_scriptlog "Failure! Updating functions"
fi
echo -ne "\n"