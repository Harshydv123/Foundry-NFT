🧱 Foundry NFT Project

A Solidity-based NFT project built with Foundry, demonstrating two types of NFTs:

BasicNft – Metadata stored on IPFS

MoodNft – 100% on-chain, dynamic NFT that changes appearance based on the owner’s “mood”

🧩 Features

✅ Simple ERC721 minting and metadata handling
✅ Fully on-chain SVG-based NFT
✅ Automated deployment using Foundry scripts
✅ Comprehensive unit testing

⚙️ Requirements

Make sure you have the following installed before running the project:

Foundry

Node.js

Git
```

🚀 Setup Instructions

Clone the repository

git clone https://github.com/<your-username>/foundry-nft.git
cd foundry-nft


Install dependencies

forge install


Build the contracts

forge build


Run the tests

forge test -vv


Format the code (optional)

forge fmt

📁 Project Structure
foundry-nft/
│
├── src/
│   ├── BasicNft.sol        # Simple ERC721 NFT with metadata stored on IPFS
│   └── MoodNft.sol         # Fully on-chain dynamic NFT with mood switching
│
├── script/
│   ├── DeployBasicNft.s.sol   # Deployment script for BasicNft
│   └── DeployMoodNft.s.sol    # Deployment script for MoodNft
│
├── test/
│   ├── BasicNftTest.t.sol     # Unit tests for BasicNft
│   └── MoodNftTest.t.sol      # Unit tests for MoodNft
│
└── Img/
    ├── Happy.svg              # Happy SVG for MoodNft
    └── Sad.svg                # Sad SVG for MoodNft

🧠 Contracts Overview
BasicNft.sol

A simple ERC721 NFT where metadata (token URI) is stored on IPFS.
Each NFT represents a “Dogie”.

Key Functions:

mintNft(string memory tokenUri) — Mints a new NFT with a provided metadata URI

tokenURI(uint256 tokenId) — Returns the token URI

getTokenCounter() — Returns total NFTs minted

MoodNft.sol

A dynamic NFT that stores SVG images on-chain.
The owner can “flip” the mood of the NFT between Happy and Sad.

Key Functions:

mintNft() — Mints a new Mood NFT

flipMood(uint256 tokenId) — Toggles the mood (Happy ↔ Sad)

tokenURI(uint256 tokenId) — Returns on-chain metadata as a Base64 JSON

🧪 Testing

To run all tests:

forge test -vv


To run a specific test:

forge test --match-test testCanMintAndHaveABalance -vv

📦 Deployment

To deploy on a local Anvil network:

anvil


Then, in a new terminal:

forge script script/DeployBasicNft.s.sol --rpc-url http://127.0.0.1:8545 --broadcast


or for Mood NFT:

forge script script/DeployMoodNft.s.sol --rpc-url http://127.0.0.1:8545 --broadcast

🧰 Useful Commands
forge build           # Compile contracts
forge test            # Run tests
forge fmt             # Format Solidity code
anvil                 # Start local blockchain
cast call             # Read on-chain data

🧑‍💻 Author

Harsh Yadav
Solidity Developer | Blockchain Enthusiast

🪪 License

This project is licensed under the MIT License.
