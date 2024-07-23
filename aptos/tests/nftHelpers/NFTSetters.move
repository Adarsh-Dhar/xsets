module 0x1::NFTSetters {
    use 0x1::NFTState;
    use 0x1::NFTStorage;
    use std::signer;
    use std::vector;

    // Function to set the wormhole address
    public fun set_wormhole(account: &signer, wormhole: address) {
        let state = NFTState::borrow_state_mut(account);
        state.wormhole = wormhole;
    }

    // Function to set the chain ID
    public fun set_chain_id(account: &signer, chain_id: u16) {
        let state = NFTState::borrow_state_mut(account);
        state.chain_id = chain_id;
    }

    // Function to mark a transfer as completed
    public fun set_transfer_completed(account: &signer, transfer_hash: vector<u8>) {
        let state = NFTState::borrow_state_mut(account);
        NFTStorage::add_completed_transfer(state, transfer_hash, true);
    }

    // Function to set the NFT contract address for a chain ID
    public fun set_nft_contract(account: &signer, chain_id: u16, nft_contract: vector<u8>) {
        let state = NFTState::borrow_state_mut(account);
        NFTStorage::add_nft_contract(state, chain_i
