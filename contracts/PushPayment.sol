pragma solidity ^0.4.18;


// push 支付
contract PushContract{
    
    //出价最好的人
    address highestBidder;

    // 竞标价格
    uint highestBid;

/*
有出价更高的人出现,竞标者的信息需要更新,如果原有的竞标者在合约回退函数中注入恶意代码
使得send退款一直失败,就会导致始终无法竞标成功,可能使得自己,以低的价格竞标成功
*/
    function pay() payable{
        throw;
    }

    // 竞标函数
    function bid (){
   
       if(msg.value < highestBid) throw;
        
       if(highestBidder!=0){
           // 在这里注入恶意代码
           if(!highestBidder.send(highestBid)){
               throw;
           }
       }

       highestBidder=msg.sender;
       highestBid=msg.value;


    }
 
}

// pull 支付
// 在出现出现更高的竞标者之后,由用户来调用退款函数
contract PullContract{



}