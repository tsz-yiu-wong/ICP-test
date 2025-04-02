#!/bin/bash

# Check and install wasm32 target
echo "Checking if wasm32 target is installed..."
if ! rustup target list --installed | grep -q "wasm32-unknown-unknown"; then
    echo "Installing wasm32-unknown-unknown target..."
    rustup target add wasm32-unknown-unknown
fi

# Stop previously running DFX processes
dfx stop

# Clean previous cache (optional)
dfx cache delete

# Start local Internet Computer network process in background
dfx start --background --clean

# Wait for network to start
sleep 5

# First create Cargo.lock file
echo "Generating Cargo.lock file..."
cargo update

# Deploy canister
echo "Deploying canister..."
dfx deploy

# Display canister ID and web URL
CANISTER_ID=$(dfx canister id my_canister)
echo "Canister ID: $CANISTER_ID"
echo "Local access URL: http://localhost:8000/?canisterId=$CANISTER_ID"

# Call methods in the canister (optional)
echo "Current count: $(dfx canister call my_canister get_count)"
echo "Incrementing count..."
dfx canister call my_canister increment
echo "Count after increment: $(dfx canister call my_canister get_count)" 