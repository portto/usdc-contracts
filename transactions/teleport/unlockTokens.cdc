import FungibleToken from "../../contracts/flow/token/FungibleToken.cdc"
import FiatToken from "../../contracts/flow/token/FiatToken.cdc"
import TeleportCustody from "../../contracts/flow/teleport/TeleportCustody.cdc"

transaction(amount: UFix64, target: Address, from: String, hash: String) {

    // The TeleportControl reference for teleport operations
    let teleportControlRef: &TeleportCustody.TeleportAdmin{TeleportCustody.TeleportControl}

    // The Receiver reference of the user
    let receiverRef: &FiatToken.Vault{FungibleToken.Receiver}

    prepare(teleportAdmin: AuthAccount) {
        self.teleportControlRef = teleportAdmin.getCapability(TeleportCustody.TeleportAdminTeleportControlPath)
            .borrow<&TeleportCustody.TeleportAdmin{TeleportCustody.TeleportControl}>()
            ?? panic("Could not borrow a reference to TeleportControl")

        self.receiverRef = getAccount(target).getCapability(FiatToken.VaultReceiverPubPath)
            .borrow<&FiatToken.Vault{FungibleToken.Receiver}>()
            ?? panic("Could not borrow a reference to Receiver")
    }

    execute {
        let vault <- self.teleportControlRef.unlock(amount: amount, from: from.decodeHex(), txHash: hash)

        self.receiverRef.deposit(from: <- vault)
    }
}
