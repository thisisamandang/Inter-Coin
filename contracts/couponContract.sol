// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

struct gift_card {
    string Name;
    uint256 Id;
    uint256 Cost;
    uint256 Time;
}

contract shop {
    string[] buyer;
    mapping(uint256 => string) itemlist;
    gift_card[] public gift_cards;
    address seller;
    mapping(uint256 => uint256) cost;

    constructor() {
        seller = msg.sender;
    }

    modifier onlyonwner() {
        require(seller == msg.sender, "You are not allowed to do this ");
        _;
    }

    function AllItem(
        string memory _Name,
        uint256 _Id,
        uint256 _Cost
    ) public onlyonwner {
        itemlist[_Id] = _Name;
        cost[_Id] = _Cost;
        gift_cards.push(gift_card(_Name, _Id, _Cost, block.timestamp));
    }

    function buy(uint256 _Id) public payable {
        uint256 n = cost[_Id];
        require(n == msg.value, "Less sufficent amount");
        buyer.push(itemlist[_Id]);
    }

    function view_item() public view returns (string[] memory) {
        return buyer;
    }
}
