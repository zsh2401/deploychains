#!/bin/bash
source var.sh
source lib.sh
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



