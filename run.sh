#!/bin/bash

# Variables
BUILD_DIR="build_run"
EXECUTABLE_PATH="$BUILD_DIR/src/vui"

if [ ! -d "$BUILD_DIR" ]; then
    echo "Setting up Meson build directory..."
    meson setup "$BUILD_DIR" || { echo "Meson setup failed."; exit 1; }
fi

echo "Building the project..."
meson compile -C "$BUILD_DIR" || { echo "Build failed."; exit 1; }

APP_PATH=$(find "$BUILD_DIR" -type f -executable | head -n 1)

# Step 3: Run the application
if [ -x "$EXECUTABLE_PATH" ]; then
    echo "Running the application: $EXECUTABLE_PATH"
    "$EXECUTABLE_PATH" || { echo "Application failed to run."; exit 1; }
else
    echo "Executable not found or not executable at: $EXECUTABLE_PATH"
    exit 1
fi
