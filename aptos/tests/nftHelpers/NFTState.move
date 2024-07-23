module 0x1::NFTState {
    use 0x1::NFTStorage;
    use std::signer;

    resource struct NFTStateResource {
        wormhole_state: NFTStorage::State,
    }

    
}
