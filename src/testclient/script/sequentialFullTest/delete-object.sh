


    TestSetFile=${4:-../testSet.env}
    
    FILE=$TestSetFile
    if [ ! -f "$FILE" ]; then
        echo "$FILE does not exist."
        exit
    fi
	source $TestSetFile
    source ../conf.env
    AUTH="Authorization: Basic $(echo -n $ApiUsername:$ApiPassword | base64)"

    echo "####################################################################"
    echo "## 0. Object: Delete"
    echo "####################################################################"

    KEY=${1}

    curl -H "${AUTH}" -sX DELETE http://$TumblebugServer/tumblebug/object?key=$KEY | jq '' 
