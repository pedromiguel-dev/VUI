BUILD_DIR="build_run"

echo "Installing the project locally..."
meson install -C "$BUILD_DIR" || { echo "Installation failed."; exit 1; }
