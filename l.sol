contract l is SuperOwned{
address c;
uint p;
uint perc;
uint peri;
uint end;
address temp;
bool public lock;

function l(){
owner=msg.sender;
}

function init(address con,uint pri,uint per,uint perce){
if(msg.sender!=owner)throw;
c=con;
p=pri;
peri=per;
end=0;
lock=false;
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
if(msg.sender==owner){
if(block.number>end)throw;
if(msg.value>=p/100*(100+perc))if(!send(temp,msg.value))throw;
myContract m=myContract(c);
if(!c.setSuperOwner(owner))throw;
kill();
}
if(msg.sender==temp){
if(block.number<end)throw;
myContract m=myContract(c);
if(!c.transferOwnership(owner))throw;
if(!c.setSuperOwner(owner))throw;
kill();
}
}

function lock(bool l) onlyOwner{
lock=l;
}

function close() onlyOwner{
if(block.number<end)throw;
if(!c.setSuperOwner(owner))throw;
kill();
}

function kill() private{
selfdestroy();
}

}


contract myContract{ function transferOwnership(address newOwner)returns (bool){} function setSuperOwner(address newSuperOwner)returns (bool){} }
