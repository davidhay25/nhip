#!/bin/bash





sushi fsh -o .

if [[ $? -eq 0 ]]
then

# create the 2 summary files extensions.xml & profiles.xml. Saves in both /input.. & /fsh/ig-data...

# echo "Creating Profiles and extensions summary pages..."
# ../scripts/makeProfilesAndExtensions.js hpi

# echo "Making terminology summary"  
# # ../scripts/makeTerminologySummary.js hpi

# echo "Making API summary"
# ../scripts/makeCapabilityStatement.js hpi

# echo "Making NamingSystem summary"
# ../scripts/makeNamingSystemSummary.js hpi

echo "disabled"

else 
echo
echo
echo "There were errors, so the other scripts weren't run..."
fi

