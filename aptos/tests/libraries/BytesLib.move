module 0x1::BytesLib {
    use std::vector;
    use std::string;
    use std::error;

    public fun concat(pre_bytes: vector<u8>, post_bytes: vector<u8>): vector<u8> {
        let mut temp_bytes = pre_bytes;
        vector::extend(&mut temp_bytes, post_bytes);
        temp_bytes
    }

    public fun slice(bytes: vector<u8>, start: u64, length: u64): vector<u8> acquires Error {
        let bytes_length = vector::length(&bytes);
        if length == 0 {
            return vector::empty<u8>();
        } else if bytes_length >= start + length {
            return vector::sub_vector(&bytes, start, length);
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun to_address(bytes: vector<u8>, start: u64): address acquires Error {
        let address_length = 20;
        let bytes_length = vector::length(&bytes);
        if bytes_length >= start + address_length {
            let address_bytes = vector::sub_vector(&bytes, start, address_length);
            vector::to_address(&address_bytes)
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun to_u8(bytes: vector<u8>, start: u64): u8 acquires Error {
        let bytes_length = vector::length(&bytes);
        if bytes_length >= start + 1 {
            vector::borrow(&bytes, start)
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun to_u16(bytes: vector<u8>, start: u64): u16 acquires Error {
        let bytes_length = vector::length(&bytes);
        if bytes_length >= start + 2 {
            u16::from_bytes(vector::sub_vector(&bytes, start, 2))
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun to_u32(bytes: vector<u8>, start: u64): u32 acquires Error {
        let bytes_length = vector::length(&bytes);
        if bytes_length >= start + 4 {
            u32::from_bytes(vector::sub_vector(&bytes, start, 4))
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun to_u64(bytes: vector<u8>, start: u64): u64 acquires Error {
        let bytes_length = vector::length(&bytes);
        if bytes_length >= start + 8 {
            u64::from_bytes(vector::sub_vector(&bytes, start, 8))
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun to_u128(bytes: vector<u8>, start: u64): u128 acquires Error {
        let bytes_length = vector::length(&bytes);
        if bytes_length >= start + 16 {
            u128::from_bytes(vector::sub_vector(&bytes, start, 16))
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun to_bytes32(bytes: vector<u8>, start: u64): vector<u8> acquires Error {
        let bytes_length = vector::length(&bytes);
        if bytes_length >= start + 32 {
            vector::sub_vector(&bytes, start, 32)
        } else {
            error::abort(error::new_error_code(1));
        }
    }

    public fun equal(pre_bytes: vector<u8>, post_bytes: vector<u8>): bool {
        pre_bytes == post_bytes
    }
}
