contract Lotto {
    uint constant ticketPrice = 10 ether;
    uint lastBlock;
    uint balance;
    address[] tickets;
    function Lotto(){ //Runs only at creation
        lastBlock = block.number;
    }
    
    function random() private {
        if (tickets.length < 256){
            for (uint i = 0; i < 32; i++){
                if (block.blockhash(block.number-12)[i] < tickets.length){
                    return block.blockhash(block.number-12)[i];
                }
            }
        }
    }
    
    function payoutReady() constant returns (bool ready){
        ready = (block.number - lastBlock) > 40 ; //Payout every 10 minutes
    }
    
    function buyTicket(){
        for(uint32 i=0; i < msg.value % ticketPrice; i++ ){
            tickets[tickets.length] = msg.sender; //append one copy of sender address
        }
        balance += msg.value;
    }
    
    function payout(){
        if (payoutReady()){
            
        }
    }
}


