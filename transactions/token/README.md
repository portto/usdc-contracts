# Token
### Setup FiatToken Vault
```
flow transactions send ./transactions/token/setupFiatTokenVault.cdc \
  --network testnet \
  --signer usdc-user-testnet \
  --gas-limit 1000
```

### Transfer FiatToken
```
flow transactions send ./transactions/token/transferFiatToken.cdc \
  --network testnet \
  --arg UFix64:100.0 \
  --arg Address:0x03d1e02a48354e2b \
  --signer usdc-admin-testnet \
  --gas-limit 1000
```
