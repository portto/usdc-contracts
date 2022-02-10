# FiatToken (USDC) Teleport Contracts

## Setup Flow CLI
https://docs.onflow.org/flow-cli/install

## Run Scripts/Transactions - Examples
### Setup Joyride Token Vault
```
flow transactions send ./transactions/token/setupFiatTokenVault.cdc \
  --network testnet \
  --signer usdc-user-testnet \
  --gas-limit 1000
```

### Transfer Joyride Token
```
flow transactions send ./transactions/token/transferFiatToken.cdc \
  --network testnet \
  --arg UFix64:100.0 \
  --arg Address:0x03d1e02a48354e2b \
  --signer usdc-admin-testnet \
  --gas-limit 1000
```

### Get Joyride Token Balance
```
flow scripts execute ./scripts/token/getFiatTokenBalance.cdc \
  --network testnet \
  --arg Address:0x03d1e02a48354e2b
```
