#!/usr/bin/env bash
trap ctrl_c INT

function ctrl_c() {
        echo "CTRL+C detected"
        exit 1
}

if [ -z "$LEDGER_TYPE" ]
    then
        echo "\$LEDGER_TYPE is a required ENV var"
        exit 1
    else
        if [ "$LEDGER_TYPE" != "xrp" ] && [ "$LEDGER_TYPE" != "eth" ]
            then
                echo "LEDGER_TYPE ENV var valid values: \"eth\" or \"xrp\""
                exit 1
        fi
fi

if [ -z "$NETWORK_TYPE" ]
    then
        echo "\$NETWORK_TYPE is a required ENV var"
        exit 1
    else
        if [ "$NETWORK_TYPE" != "live" ] && [ "$NETWORK_TYPE" != "test" ]
            then
                echo "NETWORK_TYPE ENV var valid values: \"live\" or \"test\""
                exit 1
        fi
fi

if [ "$NETWORK_TYPE" == "test" ]
    then
        echo $LEDGER_SECRET | moneyd --testnet "$LEDGER_TYPE:configure"
        moneyd --testnet "$LEDGER_TYPE:start"
    else
        if [ -z "$LEDGER_SECRET" ]
            then
                echo "LEDGER_SECRET is a required ENV var for live network"
                exit 1
        fi
        echo $LEDGER_SECRET | moneyd "$LEDGER_TYPE:configure"
        moneyd "$LEDGER_TYPE:start"
fi