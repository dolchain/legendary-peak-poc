import "TopShot"
import "NonFungibleToken"

transaction(momentMetaData: {String: String}) {
  // Private reference to this account's Admin resource
  let AdminRef: &TopShot.Admin
       
  prepare(account: AuthAccount) {
    // Borrow a reference for the Admin in storage
    self.AdminRef = account.borrow<&TopShot.Admin>(from: /storage/TopShotAdmin)
        ?? panic("Could not borrow Admin reference")
    log("got AdminRef successfully")
  }
  
  execute {
    // Add new Play with moment meta data
    // let newId = self.AdminRef.createPlay(metadata: momentMetaData)
    // log(newId);

    // Add new Set with set name and borrow its resource
    // let newSetId = self.AdminRef.createSet(name: "NewSet")
    // let newSet = self.AdminRef.borrowSet(setID: newSetId)
    // log(newSet.setID)

    // Add Play2 to the Set2
    // let secondSet = self.AdminRef.borrowSet(setID: 2)
    // secondSet.addPlay(playID: 2);
    // log(secondSet.getPlays())

    // let secondSet = self.AdminRef.borrowSet(setID: 2)
    // let moment <- secondSet.mintMoment(playID: 2)
  }
}
