module 0x1::NFTStorage {
    use std::option;
    use std::map;

    // Define the State resource
    resource struct State {
        wormhole: address,
        chain_id: u16,
        completed_transfers: map::Map<vector<u8>, bool>,
        nft_contracts: map::Map<u16, vector<u8>>,
    }

}
