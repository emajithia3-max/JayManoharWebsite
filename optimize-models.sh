#!/bin/bash

# FTC Robot Model Optimization Script
# This script optimizes all 4 robot models for web viewing
# Reduces file sizes from 500-800MB to 20-50MB each

# Set your models directory
MODELS_DIR="/Users/eeshmajithia/Downloads/___-"
OUTPUT_DIR="$MODELS_DIR/optimized"

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "🤖 FTC Robot Model Optimizer"
echo "=============================="
echo ""
echo "Input directory: $MODELS_DIR"
echo "Output directory: $OUTPUT_DIR"
echo ""

# Check if gltf-transform is installed
if ! command -v gltf-transform &> /dev/null; then
    echo "❌ gltf-transform not found!"
    echo ""
    echo "Installing gltf-transform..."
    npm install -g @gltf-transform/cli
    echo ""
fi

echo "Starting optimization..."
echo ""

# Optimize Lebot James
echo "1/4 Optimizing Lebot James (495 MB)..."
gltf-transform optimize \
  "$MODELS_DIR/lebot-james.gltf" \
  "$OUTPUT_DIR/lebot-james.glb" \
  --compress draco \
  --texture-compress webp \
  --verbose

echo ""

# Optimize Thunder
echo "2/4 Optimizing Thunder (865 MB)..."
gltf-transform optimize \
  "$MODELS_DIR/thunder.gltf" \
  "$OUTPUT_DIR/thunder.glb" \
  --compress draco \
  --texture-compress webp \
  --verbose

echo ""

# Optimize Volt
echo "3/4 Optimizing Volt (718 MB)..."
gltf-transform optimize \
  "$MODELS_DIR/volt-assembly-extended.gltf" \
  "$OUTPUT_DIR/volt-assembly-extended.glb" \
  --compress draco \
  --texture-compress webp \
  --verbose

echo ""

# Optimize Fiber Eel
echo "4/4 Optimizing Fiber Eel (678 MB)..."
gltf-transform optimize \
  "$MODELS_DIR/fiber-eel.gltf" \
  "$OUTPUT_DIR/fiber-eel.glb" \
  --compress draco \
  --texture-compress webp \
  --verbose

echo ""
echo "✅ All models optimized!"
echo ""
echo "Results saved to: $OUTPUT_DIR"
echo ""
echo "Next steps:"
echo "1. Check the optimized models in: $OUTPUT_DIR"
echo "2. Upload them to your R2 bucket"
echo "3. Update index.html to use the new .glb files"
echo ""
ls -lh "$OUTPUT_DIR"
