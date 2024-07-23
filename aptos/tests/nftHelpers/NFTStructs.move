module 0x1::NFTStructs {
    use std::vector;
    
    // Define the Transfer struct
    struct Transfer has copy, drop, store {
        token_id: u64,
        to: vector<u8>,
        to_chain: u16,
    }

    
}
