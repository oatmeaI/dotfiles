INFO=$(pmset -g batt)
PERCENT=$(pmset -g batt | grep -Eo '\d+%')
if [[ "$INFO" == *"AC Power"* ]]; then
    echo ""
else
    echo "BATT: $PERCENT"
fi
