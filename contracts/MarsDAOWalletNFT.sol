// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./lib/ERC721.sol";
import "./lib/Ownable.sol";

//https://bscscan.com/address/0x19FC54E8ba9Ee74c2319CAD0d53cd0e12F93cBF0#code
contract MarsDAOWalletNFT is Ownable, ERC721("MarsDAO Wallet NFT","MDAO") {

    uint256 private _tokenIds;
    
    
    constructor() public {
        _setBaseURI("https://ipfs.io/ipfs/QmdDjELUKEjCaQKL4LdF4bQ4xy3otuLfEkiEAknHs5k8my/");
    }

    function mint(address to) external onlyOwner returns (uint256){
        _tokenIds+=1;
        _safeMint(to, _tokenIds);
        _setTokenURI(_tokenIds, "1.json");
        return _tokenIds;
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) external onlyOwner{
        _setTokenURI(tokenId, _tokenURI);
    }

    function setBaseURI(string memory baseURI_) external onlyOwner {
         _setBaseURI(baseURI_);
    }

    function mintBatch(address[] memory _recipients)external onlyOwner returns (uint256){
        uint256 length = _recipients.length;
        uint256 id=_tokenIds;
        for (uint256 i = 0; i < length; ++i) {
            id+=1;
            _mint(_recipients[i], id);
            _setTokenURI(id, "1.json");
        }
        _tokenIds=id;
        return _tokenIds;
    }

}
