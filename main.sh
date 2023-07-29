#!/bin/bash
export TOOLS_PATH=$(dirname "$(readlink -f "$0")")
source $TOOLS_PATH/var.sh
source $TOOLS_PATH/lib.sh
dotenv

if [ -f "$TOOLS_PATH/deploy_$1.sh" ]; then
    script=$TOOLS_PATH/deploy_$1.sh
    echo "Executing single file $script"
    {
        set -e
        $script
    }
else
    for script in $TOOLS_PATH/deploy_*.sh; do
    if [ -x "$script" ]; then
        echo "Exechuing $script"
        {
            set -e
            $script
        }
    fi
    done
fi



