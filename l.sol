contract l is SuperOwned{
address c;
uint p;
uint perc;
uint peri;
uint end;
address temp;

function l(address con,uint pri,uint per,uint perce){
c=con;
p=pri;
peri=per;
perc=perce;
}

function setPrice(uint pri) onlyOwner{
p=pri;
}

function setPeriod(uint per) onlyOwner{
peri=per;
}

function setPerc(uint perce) onlyOwner{
perc=perce;
}

function buyl() payable{
if(msg.value<p)throw;
end=block.number+peri;
temp=msg.sender;
}

function claimC() onlyOwner returns (bool) payable{
if(block.number<end)throw;
if(msg.sender==owner){
if(msg.value>=p/100*(100+perc))if(!send(temp,msg.value))throw;
myContract m=myContract(c);
if(!c.setSuperOwner(owner))throw;
kill();
}
if(msg.sender==temp){
}
myContract m=myContract(c);
if(!c.transferOwnership(owner))throw;
kill();
}

function withdraw(){
if(msg.sender!=owner)throw;
if(!send(msg.sender,this.balance))throw;
}

function kill() private{
selfdestroy();
}

}


contract myContract{ function transferOwnership(address newOwner)returns (bool){} }
