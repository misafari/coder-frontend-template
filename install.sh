#!/bin/bash

# Install Yarn via npm
if command -v npm &> /dev/null; then
  npm install -g yarn
fi