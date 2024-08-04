module WormholeBridge {
    use 0x1::Signer;
    use 0x1::Account;
    use 0x1::NFT;
    use 0x1::Event;
    use 0x1::Wormhole;

    struct TransferRequestedEvent has copy, drop, store {
        from: address,
        to: address,
        token_id: u64,
        token_uri: vector<u8>,
    }

    struct TransferReceivedEvent has copy, drop, store {
        from: address,
        to: address,
        token_id: u64,
        token_uri: vector<u8>,
    }

    public fun send_message(account: &signer, recipient: address, token_id: u64, token_uri: vector<u8>) {
        // Burn the NFT on Aptos
        NFT::burn(account, token_id);

        // Create the payload
        let payload = bcs::to_bytes(&(Account::address_of(account), recipient, token_id, token_uri));

        // Send the message through Wormhole
        Wormhole::send_message(account, payload);

        // Emit TransferRequested event
        let event_handle = account.borrow_global_mut<EventHandle<TransferRequestedEvent>>(Account::address_of(account));
        Event::emit_event(&event_handle, TransferRequestedEvent {
            from: Account::address_of(account),
            to: recipient,
            token_id,
            token_uri,
        });
    }

    public fun receive_message(account: &signer, payload: vector<u8>) {
        // Decode the payload
        let (from, to, token_id, token_uri) = bcs::from_bytes<&(address, address, u64, vector<u8>)>(payload);

        // Mint the NFT to the recipient
        NFT::mint(account, to, token_id, token_uri);

        // Emit TransferReceived event
        let event_handle = account.borrow_global_mut<EventHandle<TransferReceivedEvent>>(Account::address_of(account));
        Event::emit_event(&event_handle, TransferReceivedEvent {
            from,
            to,
            token_id,
            token_uri,
        });
    }
}
