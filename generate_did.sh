#!/bin/bash

# Check if dfx output directory exists
if [ ! -d ".dfx/local/canisters/my_canister" ]; then
    echo "Error: Please deploy the canister first using './deploy.sh'."
    exit 1
fi

# Copy service.did file to src directory
echo "Copying Candid interface file..."
DID_FILE=".dfx/local/canisters/my_canister/service.did"
if [ ! -f "$DID_FILE" ]; then
    echo "Warning: Cannot find $DID_FILE"
    echo "Trying to use LSP generated file..."
    DID_FILE=".dfx/local/lsp/bkyz2-fmaaa-aaaaa-qaaaq-cai.did"
fi

# Ensure target directory exists
mkdir -p src/declarations/my_canister

# Copy file
if [ -f "$DID_FILE" ]; then
    cp "$DID_FILE" src/my_canister.did
    echo "Candid interface file generation complete!"
    echo "Interface file location: src/my_canister.did"
    
    # Display file content
    echo "Candid interface content:"
    cat src/my_canister.did
else
    echo "Error: Cannot find any valid .did file."
    exit 1
fi 