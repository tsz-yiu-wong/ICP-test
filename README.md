# Counter Canister Project

This is a simple Internet Computer (ICP) canister project that implements a counter functionality.

## Features

- Initialize counter to 0
- Increment counter
- Get current count value

## Project Structure

- `src/lib.rs`: Main code implementation of the canister
- `Cargo.toml`: Rust project dependency configuration
- `dfx.json`: Internet Computer deployment configuration
- `deploy.sh`: Deployment script

## Prerequisites

Please ensure you have the following tools installed:

1. Rust and Cargo (https://www.rust-lang.org/tools/install)
2. Internet Computer SDK (DFX) (https://internetcomputer.org/docs/current/developer-docs/setup/install/)

```bash
sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
```

## Deployment Steps

### Local Deployment

1. Grant execution permission to the deployment script:

```bash
chmod +x deploy.sh
```

2. Run the deployment script:

```bash
./deploy.sh
```

This will start a local network, build and deploy the canister, and display the canister ID and access URL.

### Manual Deployment

If you want to deploy manually, follow these steps:

1. Start the local Internet Computer network:

```bash
dfx start --background --clean
```

2. Deploy the canister:

```bash
dfx deploy
```

3. Interact with the canister:

```bash
# Get the current count
dfx canister call my_canister get_count

# Increment the count
dfx canister call my_canister increment
```

### Deployment to Mainnet

To deploy to the ICP mainnet, make sure you have enough cycles:

1. Configure identity and wallet:

```bash
dfx identity use default
dfx identity get-wallet
```

2. Deploy to mainnet:

```bash
dfx deploy --network ic
```

## Candid Interface

You can interact with the canister through the Candid UI. After local deployment, visit:

http://localhost:8000/?canisterId=$(dfx canister id __Candid_UI) 