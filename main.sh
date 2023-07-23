#!/bin/bash
source var.sh
source lib.sh
dotenv


for script in $TOOLS_PATH/deploy_*.sh; do
    if [ -x "$script" ]; then
        echo "Exechuing $script"
        {
            set -e
            $script
        }
    fi
done
