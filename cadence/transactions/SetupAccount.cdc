// SetupAccount1Transaction.cdc

// import FungibleToken from 0x9a0766d93b6608b7
// import TopShot from 0x877931736ee77cff
import "FungibleToken"
import "TopShot"

// This transaction adds an empty Vault to account 0x02
// and mints an NFT with id=1 that is deposited into
// the NFT collection on account 0x01.
transaction {

  // Private reference to this account's minter resource
  // let minterRef: &TopShot.NFTMinter

  prepare(acct: AuthAccount) {
    // create a new vault instance with an initial balance of 0
    let vaultA <- FungibleToken.createEmptyVault()

    // Store the vault in the account storage
    acct.save<@FungibleToken.Vault>(<-vaultA, to: /storage/CadenceFungibleTokenVault)

    // Create a public Receiver capability to the Vault
    let ReceiverRef = acct.link<&FungibleToken.Vault{FungibleToken.Receiver, FungibleToken.Balance}>(/public/CadenceFungibleTokenReceiver, target: /storage/CadenceFungibleTokenVault)

    log("Created a Vault and published a reference")

    // // Borrow a reference for the NFTMinter in storage
    // self.minterRef = acct.borrow<&TopShot.NFTMinter>(from: TopShot.MinterStoragePath)
    //     ?? panic("Could not borrow owner's NFT minter reference")
  }
  // execute {
  //   // Get the recipient's public account object
  //   let recipient = getAccount(0x01)

  //   // Get the Collection reference for the receiver
  //   // getting the public capability and borrowing a reference from it
  //   let receiverRef = recipient.getCapability(TopShot.CollectionPublicPath)
  //                              .borrow<&{TopShot.NFTReceiver}>()
  //                              ?? panic("Could not borrow nft receiver reference")

  //   // Mint an NFT and deposit it into account 0x01's collection
  //   receiverRef.deposit(token: <-self.minterRef.mintNFT())

  //   log("New NFT minted for account 1")
  // }
}
