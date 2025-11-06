//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    //Errors
    error MoodNft__CantFlipMoodIfNotOwner();

    uint256 private s_TokenCounter;
    string private s_SadSvgUri;
    string private s_HappySvgUri;
    enum NFTState {
        HAPPY,
        SAD
    }
    mapping(uint256 => NFTState) private s_tokenIdToState;

    constructor(string memory SadSvgUri, string memory HappySvgUri) ERC721("Moodie", "MD") {
        s_TokenCounter = 0;
        s_SadSvgUri = SadSvgUri;
        s_HappySvgUri = HappySvgUri;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function mintNft() public {
        uint256 tokenCounter = s_TokenCounter;
        _safeMint(msg.sender, tokenCounter);
        s_TokenCounter = s_TokenCounter + 1;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        string memory imageURI = s_HappySvgUri;

        if (s_tokenIdToState[tokenId] == NFTState.SAD) {
            imageURI = s_SadSvgUri;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes( // bytes casting actually unnecessary as 'abi.encodePacked()' returns a bytes
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }

    function flipMood(uint256 tokenId) public {
        if (getApproved(tokenId) != msg.sender && ownerOf(tokenId) != msg.sender) {
            revert MoodNft__CantFlipMoodIfNotOwner();
        }

        if (s_tokenIdToState[tokenId] == NFTState.HAPPY) {
            s_tokenIdToState[tokenId] = NFTState.SAD;
        } else {
            s_tokenIdToState[tokenId] = NFTState.HAPPY;
        }
    }
}
