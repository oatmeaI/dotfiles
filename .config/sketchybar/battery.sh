INFO=$(pmset -g batt)
PERCENT=$(pmset -g batt | grep -Eo '\d+%')
if [[ "$INFO" == *"AC Power"* ]]; then
    # echo ""
    echo "PWR: $PERCENT"
else
    echo "BATT: $PERCENT"
fi
