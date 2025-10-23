#!/bin/bash

# YielderaVault Deployment Script for Hedera Testnet

echo "🚀 YielderaVault Deployment Script"
echo "=================================="
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found!"
    echo "Please create a .env file with your configuration."
    echo "See .env.example for reference."
    exit 1
fi

# Check if parameters file exists
if [ ! -f ignition/parameters/hederatestnet.json ]; then
    echo "❌ Error: Parameter file not found!"
    echo "Please ensure ignition/parameters/hederatestnet.json exists with correct addresses."
    exit 1
fi

echo "✅ Configuration files found"
echo ""

# Compile contracts
echo "📦 Compiling contracts..."
npx hardhat compile

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed!"
    exit 1
fi

echo "✅ Compilation successful"
echo ""

# Deploy
echo "🚀 Deploying YielderaVault to Hedera testnet..."
echo ""
npx hardhat ignition deploy ignition/modules/YielderaVault.ts --network hederatestnet --parameters ignition/parameters/hederatestnet.json

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Deployment successful!"
    echo ""
    echo "📝 Next steps:"
    echo "1. Save the deployed contract address"
    echo "2. Call associateVaultTokens() to associate tokens"
    echo "3. Set up initial liquidity position"
    echo "4. Test with a small deposit"
else
    echo ""
    echo "❌ Deployment failed!"
    echo "Please check the error messages above."
    exit 1
fi
