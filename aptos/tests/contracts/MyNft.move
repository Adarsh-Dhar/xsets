module MyNFT {

    struct NFT has copy, drop, store {
        id: u64,
        owner: address,
        metadata_uri: vector<u8>,
    }

    resource struct NFTCollection has key {
        nfts: vector<NFT>,
    }

    public fun initialize_collection(account: &signer) {
        let collection = NFTCollection {
            nfts: vector::empty<NFT>(),
        };
        move_to(account, collection);
    }

    public fun mint(account: &signer, metadata_uri: vector<u8>): u64 {
        let collection = borrow_global_mut<NFTCollection>(signer::address_of(account));
        let new_nft = NFT {
            id: vector::length(&collection.nfts) as u64,
            owner: signer::address_of(account),
            metadata_uri,
        };
        vector::push_back(&mut collection.nfts, new_nft);
        new_nft.id
    }

    public fun transfer(account: &signer, recipient: address, nft_id: u64) {
        let collection = borrow_global_mut<NFTCollection>(signer::address_of(account));
        let nft = vector::borrow_mut(&mut collection.nfts, nft_id);
        nft.owner = recipient;
    }

    public fun burn(account: &signer, nft_id: u64) {
        let collection = borrow_global_mut<NFTCollection>(signer::address_of(account));
        vector::remove(&mut collection.nfts, nft_id);
    }

    public fun get_nft(account: address, nft_id: u64): &NFT {
        let collection = borrow_global<NFTCollection>(account);
        vector::borrow(&collection.nfts, nft_id)
    }
}
