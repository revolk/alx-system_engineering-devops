#!/usr/bin/env bash
# This script signs up for Datadog and installs the Datadog agent on web-01

# Add Datadog repository
echo 'deb https://apt.datadoghq.com/ stable 7' > /etc/apt/sources.list.d/datadog.list

# Add Datadog's apt key
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 A2923DFF56EDA6E76E55E492D3A80E30382E94DE

# Install Datadog agent
apt-get update
apt-get install datadog-agent -y

# Set up configuration
sed -i -e "s/api_key:.*/api_key: 0dd1c4ba2e84ad26500191225fc70414/g" /etc/datadog-agent/datadog.yaml
sed -i -e "s/# logs_enabled: false/logs_enabled: true/g" /etc/datadog-agent/datadog.yaml
sed -i -e "s/# logs_config:/logs_config:/g" /etc/datadog-agent/datadog.yaml
sed -i -e "s/#   service: <SERVICE_NAME>/  service: nginx/g" /etc/datadog-agent/datadog.yaml
sed -i -e "s/#     source: <SOURCE_NAME>/    source: nginx/g" /etc/datadog-agent/datadog.yaml

# Restart Datadog agent
service datadog-agent restart
