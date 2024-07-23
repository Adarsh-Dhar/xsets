// WormholeStructs.move

address 0x1 {
    module WormholeStructs {
        struct Provider {
            chain_id: u16,
            governance_chain_id: u16,
            governance_contract: vector<u8>,
        };

        struct GuardianSet {
            keys: vector<address>,
            expiration_time: u32,
        };

        struct Signature {
            r: vector<u8>,
            s: vector<u8>,
            v: u8,
            guardian_index: u8,
        };

        struct VM {
            version: u8,
            timestamp: u32,
            nonce: u32,
            emitter_chain_id: u16,
            emitter_address: vector<u8>,
            sequence: u64,
            consistency_level: u8,
            payload: vector<u8>,
            guardian_set_index: u32,
            signatures: vector<Signature>,
            hash: vector<u8>,
        };
    }
}

