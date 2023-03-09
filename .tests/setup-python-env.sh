#!/bin/bash

# Create a new virtual environment
python3 -m venv .tests/venv

# Activate the virtual environment
source env/bin/activate

# Install the required packages
pip install -r requirements.txt
