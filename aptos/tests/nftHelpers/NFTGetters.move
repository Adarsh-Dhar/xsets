module 0x1::NFTGetters {
    use 0x1::NFTState;
    use 0x1::NFTStorage;
    use std::option;
    use std::signer;
    use std::vector;

    // Function to check if a transfer is completed
    public fun is_transfer_completed(account: address, transfer_hash: vector<u8>): bool {
        let state = NFTState::borrow_state(account);
        NFTStorage::is_transfer_completed(state, transfer_hash)
    }

    // Function to get the NFT contract address for a given chain ID
    public fun nft_contract(account: address, chain_id: u16): option::Option<vector<u8>> {
        let state = NFTState::borrow_state(account);
        NFTStorage::get_nft_contract(state, chain_id)
    }

    // Function to get the wormhole address
    public fun wormhole(account: address): address {
        let state = NFTState::borrow_state(account);
        state.wormhole
    }

    // Function to get the chain ID
    public fun chain_id(account: address): u16 {
        let state = NFTState::borrow_state(account);
        state.chain_id
    }
}
