#!/bin/bash
# ***************************************************************** 
#                                                                   
# IBM Confidential                                                  
#                                                                   
# Licensed Materials - Property of IBM                              
#                                                                   
# (C) Copyright IBM Corp. 2017 All Rights Reserved.                 
#                                                                   
# The source code for this program is not published or otherwise    
# divested of its trade secrets, irrespective of what has been      
# deposited with the U.S. Copyright Office.                         
#                                                                   
# ***************************************************************** 

#:init
#:check
	if [ "${IIB_HOME}" == "" ]; then
		echo "$0 error: environment variable 'IIB_HOME' is not defined : Fix then try again."
		exit 1
	fi
	if [ ! -e ${IIB_HOME}/server/bin/mqsipackagebar ]; then
		echo "$0 error: required file '${IIB_HOME}/server/bin/mqsipackagebar' is missing : Fix then try again."
		exit 1
	fi

#:main
	if ! grep "^LICENSE_ACCEPTED=1" ${IIB_HOME}/server/bin/mqsiprofile; then
		echo "${IIB_HOME}/iib accept license silently"
		${IIB_HOME}/iib accept license silently
	fi

	echo "source ${IIB_HOME}/server/bin/mqsiprofile"
	source ${IIB_HOME}/server/bin/mqsiprofile

	echo "${IIB_HOME}/server/bin/mqsipackagebar $*"
	${IIB_HOME}/server/bin/mqsipackagebar $*

#:done
#:end
