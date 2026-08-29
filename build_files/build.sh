#!/bin/bash

set -ouex pipefail

# Copy system_files overlay to /
cp -avf "/ctx/system_files"/. /
