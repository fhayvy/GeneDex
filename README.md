# GeneDex: Decentralized Genetic Data Marketplace

GeneDex is a blockchain-based platform that enables secure, transparent, and controlled sharing of genetic data. Built on Stacks blockchain using Clarity smart contracts, it creates a marketplace where genetic data owners can monetize their data while researchers gain verifiable access to valuable genetic assets.

## Key Features

- **Secure Data Ownership**: Genetic data owners maintain complete control over their data assets
- **Tiered Access Levels**: Customizable access tiers for different research needs
- **Time-Limited Access**: Automatic expiration of access rights
- **Verifiable Transactions**: All data exchanges are recorded on the blockchain
- **Privacy-Preserving**: Only hashed metadata is stored on-chain

## Smart Contracts

The platform consists of two main smart contracts:

1. `gene-asset-trait.clar`: Defines the trait interface for genetic data assets
2. `gene-market.clar`: Implements the marketplace functionality

## How It Works

1. **Asset Registration**: Data owners register their genetic data with metadata and pricing
2. **Discovery**: Researchers browse available genetic data assets
3. **Purchase**: Researchers purchase time-limited access to specific data sets
4. **Verification**: Smart contracts verify access rights during data retrieval
5. **Automatic Expiry**: Access permissions automatically expire after the designated period

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) for local development
- [Stacks Wallet](https://www.hiro.so/wallet) for deployment and interaction

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/fhayvy/genedex.git
   cd genedex
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Run tests:
   ```
   clarinet test
   ```

## Usage

### For Data Owners

```clarity
;; Register a new genetic data asset
(contract-call? .gene-market register-asset u1000 0x012345...)
```

### For Researchers

```clarity
;; Purchase access to a genetic data asset
(contract-call? .gene-market purchase-access u1 u2)
```

### For Administrators

```clarity
;; Set a new curator
(contract-call? .gene-market set-curator 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
```

## Roadmap

- Integration with off-chain storage solutions
- Enhanced privacy features using zero-knowledge proofs
- Mobile application for easy marketplace access
- API for third-party integration

## Contributing

We welcome contributions to GeneDex!

## License

This project is licensed under the MIT License 