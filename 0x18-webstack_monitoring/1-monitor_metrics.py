#!/usr/bin/env python3
# This script sets up monitors in Datadog to monitor system metrics

import datadog
from datadog import initialize, api

# Initialize Datadog API
options = {
    'api_key': '0dd1c4ba2e84ad26500191225fc70414',
    'app_key': 'd4016ef8cc5523824bbf53b30ac832042a5f7f9a'
}

initialize(**options)

# Define monitors
monitors = [
    {
        "type": "metric alert",
        "query": "avg(last_1m):sum:system.io.read{host:host-01} > 100",
        "name": "Read Requests High",
        "message": "High read requests detected on host-01",
        "options": {
            "notify_no_data": True,
            "no_data_timeframe": 10,
            "notify_audit": False,
            "require_full_window": True
        },
        "tags": ["env:prod", "app:web"]
    },
    {
        "type": "metric alert",
        "query": "avg(last_1m):sum:system.io.write{host:host-01} > 100",
        "name": "Write Requests High",
        "message": "High write requests detected on host-01",
        "options": {
            "notify_no_data": True,
            "no_data_timeframe": 10,
            "notify_audit": False,
            "require_full_window": True
        },
        "tags": ["env:prod", "app:web"]
    }
]

# Create monitors
for monitor in monitors:
    api.Monitor.create(**monitor)
