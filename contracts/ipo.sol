pragma solidity >=0.7.0 <0.8.0;



struct Purchase {
    address buyer;
    uint amount;
    uint exchange_rate;
    uint tokens;
}

contract IPOPurchase {
    address payable ipo_owner;
    uint total_tokens;
    uint exchange_rate = 5;
    
    uint public num_purchases = 0;
    mapping (uint => Purchase) public purchases;
    
    
    constructor(address payable _ipo_owner, uint32 _total_tokens){
        ipo_owner = _ipo_owner;
        total_tokens = _total_tokens;
    }
    
    function purchase() public payable {
        require(msg.value > 0);
        ipo_owner.transfer(msg.value);
        num_purchases ++;
        purchases[num_purchases] = Purchase({buyer: tx.origin, amount: msg.value, exchange_rate: exchange_rate, tokens: msg.value*exchange_rate});
    }
    
    function purchase_external() external payable{
        purchase();
    }
    
    
}
