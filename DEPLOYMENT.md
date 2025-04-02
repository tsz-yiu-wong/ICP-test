# Deployment Guide

## Prerequisites

1. Install Rust and Cargo
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

2. Install DFINITY Canister SDK (DFX)
```bash
sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
```

3. Check Installation
```bash
dfx --version
```

## Local Deployment

### Step 1: Grant Scripts Execution Permissions

```bash
chmod +x deploy.sh
chmod +x generate_did.sh
```

### Step 2: Deploy Canister

```bash
./deploy.sh
```

This script will:
- Stop any running dfx processes
- Start a local Internet Computer network
- Deploy the canister
- Display canister ID and local access URL
- Call canister methods for testing

### Step 3: Generate Candid Interface Definition

If you need to generate or update Candid interface definition files:

```bash
./generate_did.sh
```

## Mainnet Deployment

### Step 1: Set Up Identity and Wallet

```bash
# Check current identity
dfx identity list

# Create a new identity if needed
dfx identity new my_identity
dfx identity use my_identity

# Get mainnet wallet
dfx identity get-wallet --network ic
```

### Step 2: Ensure You Have Enough Cycles

You need cycles to deploy and run canisters on the mainnet. You can get test cycles from a cycles faucet, or purchase ICP and convert it to cycles on the mainnet.

### Step 3: Deploy to Mainnet

```bash
# Deploy to mainnet
dfx deploy --network ic

# Get canister ID
dfx canister --network ic id my_canister
```

## Interacting with the Canister

### Via Command Line

```bash
# Get current count
dfx canister call my_canister get_count

# Increment count
dfx canister call my_canister increment
```

### Via Candid UI

1. After local deployment, access the Candid UI:
```
http://localhost:8000/?canisterId=$(dfx canister id __Candid_UI)
```

2. Enter the canister ID in the UI:
```
$(dfx canister id my_canister)
```

## Troubleshooting

1. If deployment fails, check the error message:
```bash
dfx deploy --verbose
```

2. Clean cache and redeploy:
```bash
dfx stop
dfx start --clean --background
dfx deploy
```

3. Check canister status:
```bash
dfx canister status my_canister
```

4. View logs:
```bash
dfx canister call my_canister get_count
```

## More Resources

- [Internet Computer Developer Documentation](https://internetcomputer.org/docs/current/developer-docs/)
- [Rust Canister Development Guide](https://internetcomputer.org/docs/current/developer-docs/backend/rust/)
- [Candid Documentation](https://internetcomputer.org/docs/current/developer-docs/build/candid/candid-intro) 