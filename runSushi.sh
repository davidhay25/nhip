#!/bin/bash





sushi fsh -o .

if [[ $? -eq 0 ]]
then
 # note it needs to be run manually first as it creates a sample file for sushi
 echo "Creating Program summary..."
 localScripts/makePlanTable.js

# create the 2 summary files extensions.xml & profiles.xml. Saves in both /input.. & /fsh/ig-data...

# echo "Creating Profiles and extensions summary pages..."
# ../scripts/makeProfilesAndExtensions.js hpi

# echo "Making terminology summary"  
# # ../scripts/makeTerminologySummary.js hpi

# echo "Making API summary"
# ../scripts/makeCapabilityStatement.js hpi

# echo "Making NamingSystem summary"
# ../scripts/makeNamingSystemSummary.js hpi



else 
echo
echo
echo "There were errors, so the other scripts weren't run..."
fi

