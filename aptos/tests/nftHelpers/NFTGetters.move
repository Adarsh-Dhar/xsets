module NFTStorage {

    use std::address;
    use std::bool;
    use std::string;

    // Resource representing the state of the contract
    struct State has key {
        // Wormhole bridge contract address and chainId
        wormhole: address,
        chain_id: u16,
        // Mapping of consumed token transfers
        completed_transfers: table::Table<vector<u8>, bool>,
        // Mapping of NFT contracts on other chains
        nft_contracts: table::Table<u16, vector<u8>>,
    }

   
}
