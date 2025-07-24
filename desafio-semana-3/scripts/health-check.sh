#!/bin/bash
set -e

URL=$1
echo "🩺 Checking $URL"
curl --fail --retry 3 --retry-delay 5 $URL && echo "✅ Healthy"