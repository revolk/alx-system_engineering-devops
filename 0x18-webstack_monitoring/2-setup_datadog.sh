#!/usr/bin/env bash
# This script retrieves the dashboard ID from Datadog's API and stores it in a file

# Set up Datadog API credentials
API_KEY="0dd1c4ba2e84ad26500191225fc70414"
APP_KEY="d4016ef8cc5523824bbf53b30ac832042a5f7f9a"

# Get dashboard ID
dashboard_id=$(curl -X GET "https://api.datadoghq.com/api/v1/dashboard?api_key=$API_KEY" -H "Content-Type: application/json" -H "DD-APPLICATION-KEY: $APP_KEY" | jq -r '.dashboards[0].id')

# Write dashboard ID to file
echo "$dashboard_id" > dashboard_id.txt
