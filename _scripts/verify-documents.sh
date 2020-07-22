#!/bin/bash

echo "Verifying documents match the  documentsupdated yaml file \\n \\n"
ruby -rjson -ryaml -e "puts YAML.load_file('./_data/documentsupdated.yaml').to_json" > ./_scripts/documentsupdated.json
node ./_scripts/verify_documents.js > ./_scripts/docOutputError.log
cat ./_scripts/docOutputError.log
rm -f ./_scripts/documentsupdated.json

input="./_scripts/docOutputError.log"
allowCommit="false"

while IFS= read -r line
do
    message=${line:0:8}
    if [[ $message == "Congrats" ]]; then

        allowCommit="true"
    fi
done < "$input"
if [[ $allowCommit == "false" ]]; then
    echo 'THERE ARE ISSUES IN BUILD PLEASE REVIEW'
    exit 1
fi

