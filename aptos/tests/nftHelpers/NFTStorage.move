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

    // Function to initialize the State resource
    public fun create_state(
        wormhole: address,
        chain_id: u16
    ): State {
        State {
            wormhole,
            chain_id,
            completed_transfers: map::empty(),
            nft_contracts: map::empty(),
        }
    }

    // Function to add a completed transfer
    public fun add_completed_transfer(state: &mut State, transfer_id: vector<u8>, completed: bool) {
        map::add(&mut state.completed_transfers, transfer_id, completed);
    }

    // Function to add an NFT contract
    public fun add_nft_contract(state: &mut State, chain_id: u16, contract_address: vector<u8>) {
        map::add(&mut state.nft_contracts, chain_id, contract_address);
    }

    // Function to check if a transfer is completed
    public fun is_transfer_completed(state: &State, transfer_id: vector<u8>): bool {
        map::contains_key(&state.completed_transfers, transfer_id)
    }

    // Function to get an NFT contract address by chain ID
    public fun get_nft_contract(state: &State, chain_id: u16): option::Option<vector<u8>> {
        map::get(&state.nft_contracts, chain_id)
    }
}
