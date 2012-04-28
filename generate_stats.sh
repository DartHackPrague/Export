#!/bin/bash

GITSTATS_SCRIPT_PATH="/Users/inza/Projects/Tools/gitstats/gitstats"
GOURCE_SCRIPT_PATH="/Users/inza/Projects/Tools/scripts/run_gource.sh"
STATS_OUTPUT_PATH="GADCPrague_stats"
VIDEO_OUTPUT_PATH="GADCPrague_visualization"

# Update Submodules
git submodule update

# Checkout master branches
find . -type d -mindepth 1 -maxdepth 1 -exec bash -c "cd '{}' && git checkout master" \;

# Clean stats
find . -type d -mindepth 1 -maxdepth 1 -exec bash -c "cd '{}' && rm -Rf ./$STATS_OUTPUT_PATH" \;

# Generate stats
find . -type d -mindepth 1 -maxdepth 1 -exec bash -c "cd '{}' && $GITSTATS_SCRIPT_PATH . ./$STATS_OUTPUT_PATH" \;

# Add, Commit and Push generated stats
find . -type d -maxdepth 1 -exec bash -c "cd '{}' && git add -A && git commit -m 'Generated git repository statistics' && git pull origin master && git push origin master" \;

# Update Submodules
git submodule update

# Clean stats
find . -type d -mindepth 1 -maxdepth 1 -exec bash -c "cd '{}' && rm -Rf ./$VIDEO_OUTPUT_PATH" \;

# Generate gource
find . -type d -mindepth 1 -maxdepth 1 -exec bash -c "cd '{}' && $GOURCE_SCRIPT_PATH $VIDEO_OUTPUT_PATH" \;

# Add, Commit and Push generated stats
find . -type d -maxdepth 1 -exec bash -c "cd '{}' && git add -A && git commit -m 'Generated git repository visualization' && git pull origin master && git push origin master" \;
