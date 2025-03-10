pub contract CollectiblesContract {

  pub var totalSupply: UInt64
  pub var nextID: UInt64

  pub resource Collectible {
    pub let id: UInt64
    pub let url: String

    init(id: UInt64, url: String) {
      self.id = id
      self.url = url
    }
  }

  pub resource interface CollectionPublic {
    pub fun addCollectibles(collectible: @Collectible)
    pub fun fetchCollectibles(id: UInt64): &Collectible?
  }

  pub resource Collection { 
    // A dictionary that maps integer IDs to Collectible resource object 
    // Keys are `UInt64`, Values are `Collectible` 
    pub var ownedCollectibles: @{UInt64: Collectible} 

    init() { 
      self.ownedCollectibles <- {}
    }

    pub fun addCollectibles(collectible: @Collectible) {
      let id = collectible.id
      self.ownedCollectibles[id] <-! collectible
    }

    pub fun fetchCollectibles(id: UInt64): &Collectible? {
      return &self.ownedCollectibles[id] as &CollectiblesContract.Collectible?
    }

    destroy() {
      destroy self.ownedCollectibles
    }
  }

 init() {
    self.totalSupply = 0
    self.nextID = 1
  }

  pub fun mintCollectibles(url: String): @Collectible {
    let newCollectible <- create Collectible(id: self.nextID, url: url)
    self.nextID = self.nextID + 1
    self.totalSupply = self.totalSupply + 1
    return <-newCollectible
  }

  pub fun createCollection(): @Collection {
    return <-create Collection()
  }
}

