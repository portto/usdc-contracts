import FiatToken from "../../contracts/flow/token/FiatToken.cdc"
import TeleportCustodyEthereum from "../../contracts/flow/teleport/TeleportCustodyEthereum.cdc"

transaction(amount: UFix64) {
  prepare(admin: AuthAccount) {

    let adminRef = admin.borrow<&TeleportCustodyEthereum.Administrator>(from: TeleportCustodyEthereum.AdminStoragePath)
      ?? panic("Could not borrow a reference to the admin resource")
    
    // Get a reference to the signer's stored vault
    let vaultRef = admin.borrow<&FiatToken.Vault>(from: FiatToken.VaultStoragePath)
      ?? panic("Could not borrow reference to the owner's Vault!")

    // Withdraw tokens from the signer's stored vault
    let sentVault <- vaultRef.withdraw(amount: amount)

    adminRef.depositFiatToken(from: <-(sentVault as! @FiatToken.Vault))
  }
}
