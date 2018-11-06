#!/bin/bash

source ../../test-utils.sh

rm -f -R cmd_del
rm -f -R cmd
rm -f -R .build-tested
rm -f -R .build-tester

log "-------------------------------------------------------"
log "Test for name-topics script"

# Creating tester script
run_bigmler whizzml --package-dir ./ --output-dir ./.build-tester

# Creating tested script
run_bigmler whizzml --package-dir ../ --output-dir ./.build-tested

# Tester script inputs
prefix='[["script-id", "'
suffix='"]]'
cat ./.build-tested/scripts | while read script
do
echo "$prefix$script$suffix" > "tester_inputs.json"
done
# Run tester script
run_bigmler execute --scripts .build-tester/scripts --inputs tester_inputs.json \
                    --output-dir cmd/results

# Check the outputs
declare file="cmd/results/whizzml_results.json"
declare regex="\"outputs\": \[\[\"test-results\", \[\"Success\"\]"

declare file_content=$( cat "${file}" )
if [[ " $file_content " =~ $regex ]]
    then
        log "Script OK"
    else
        echo "Script  KO:\n $file_content"
        exit 1
fi
# remove the created resources
run_bigmler delete --from-dir cmd --output-dir cmd_del
run_bigmler delete --from-dir .build-tester --output-dir cmd_del
run_bigmler delete --from-dir .build-tested --output-dir cmd_del
rm -f -R tester_inputs.json cmd cmd_del
rm -f -R .build-tested .build-tester .bigmler*
