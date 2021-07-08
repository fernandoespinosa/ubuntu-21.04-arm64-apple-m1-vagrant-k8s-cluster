
DIR=$( cd "$( dirname "$0" )" && pwd )

echo "Absolute Path: ${DIR}"

KUBECONFIG="${DIR}/kubeconfig"
ls -l "${KUBECONFIG}"

export KUBECONFIG

function prepend_time_millis() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(gdate +%H:%M:%S.%N)" "$line";
    done
}

function prepend_time() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(date +%H:%M:%S)" "$line";
    done
}

