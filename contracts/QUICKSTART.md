# Quick Deployment Reference

## Setup (One-time)

### 1. Create .env file
```bash
cat > .env << 'EOF'
HEDERA_TESTNET_RPC_URL=https://testnet.hashio.io/api
HEDERA_TESTNET_PRIVATE_KEY=your_private_key_here
EOF
```

### 2. Contract addresses (✅ Already configured!)
All addresses are already set in `ignition/parameters/hederatestnet.json`:
- WHBAR, WHBAR Helper, SaucerSwap V3 contracts
- SAUCE-HBAR pool for liquidity provision

## Deployment Commands

### Option 1: Using Hardhat Ignition (Recommended)
```bash
# Compile contracts
npx hardhat compile

# Deploy to Hedera testnet
npx hardhat ignition deploy ignition/modules/YielderaVault.ts \
  --network hederatestnet \
  --parameters ignition/parameters/hederatestnet.json
```

### Option 2: Using the deployment script
```bash
# Make script executable (first time only)
chmod +x scripts/deploy-yieldera.sh

# Run deployment
./scripts/deploy-yieldera.sh
```

### Option 3: Check parameters first
```bash
# Validate configuration before deploying
npx hardhat run scripts/deploy-yieldera.ts
```

## Post-Deployment

### 1. Associate tokens (Required before use)
```bash
# Replace <CONTRACT_ADDRESS> with your deployed address
npx hardhat console --network hederatestnet

# Then in console:
const vault = await ethers.getContractAt("YielderaVault", "<CONTRACT_ADDRESS>");
await vault.associateVaultTokens();
```

### 2. Set initial liquidity (Optional)
```bash
# Use rebalance or mintLiquidity functions
# See contract documentation for details
```

## Network Information

- **Network Name:** hederatestnet
- **RPC URL:** https://testnet.hashio.io/api
- **Chain ID:** 296
- **Explorer:** https://hashscan.io/testnet
- **Faucet:** https://portal.hedera.com/faucet

## Important Addresses (All Configured)

- **WHBAR:** `0x0000000000000000000000000000000000003aD2`
- **WHBAR Helper:** `0x000000000000000000000000000000000050a8a7`
- **SaucerSwap Factory:** `0x00000000000000000000000000000000001243eE`
- **NFT Position Manager:** `0x000000000000000000000000000000000013F618`
- **Swap Router:** `0x0000000000000000000000000000000000159398`
- **SAUCE-HBAR Pool:** `0x37814eDc1ae88cf27c0C346648721FB04e7E0AE7`

## Troubleshooting

### "Insufficient balance" error
- Get testnet HBAR from: https://portal.hedera.com/faucet
- Minimum required: ~10 HBAR

### "Parameter file not found"
- Ensure you're in the `contracts` directory
- Check that `ignition/parameters/hederatestnet.json` exists

### "Private key" errors
- Check `.env` file exists and is properly formatted
- Ensure private key doesn't have "0x" prefix
- Verify key has permissions on Hedera testnet

## Useful Commands

```bash
# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test

# Check Hardhat configuration
npx hardhat config

# List available networks
npx hardhat networks

# Clean build artifacts
npx hardhat clean
```
