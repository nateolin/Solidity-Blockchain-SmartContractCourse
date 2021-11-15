pragma solidity ^0.6.0;

contract SimpleStorage {
    
    // this will get initialized to 0!
    //view function by default
    uint256 favoriteNumber;
    bool favoriteBool;
    
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    //view, pure
    // read some state off the blockchain - no state chain with no transaction
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    //not a transaction as it doesn't change the state of the blockchain
    function retrieve1(uint256 favoriteNumber) public pure returns(uint256) {
        return favoriteNumber + favoriteNumber;
    }
    
    //memory vs storage
    //memory is only stored during execution of the contract call
    //storage persists after the contract call
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber,_name));
    }
    
    
}