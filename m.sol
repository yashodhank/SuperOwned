pragma solidity 0.4.11;

//0x187a12A4440B11860E5e17aC3B1b6FE8a76d31C5


contract SuperOwned{

address public owner;
address public superowner;

    function SuperOwned() {
        owner = msg.sender;
    }

    modifier onlyOwner { //superowner is more important than owner
        if(superowner!=address(0)){
        if (msg.sender != superowner) throw;
        }else{
        if (msg.sender != owner) throw;
        }
        _;
    }

    //you can transfer ownership only if NO superowner is declared
    function transferOwnership(address newOwner)public onlyOwner returns(bool){
        owner = newOwner;
        return true;
    }
    
    //you can set a superowner only if NO superowner is already declared
    function setSuperOwner(address newSuperOwner)public  onlyOwner {
        superowner = newSuperOwner;    //can be an address or 0x0
    }
    

}

contract gen is SuperOwned{
mapping(address=>address)lastContract;
function gen(){
}
function createM(){
m M=new m();
if(!M.transferOwnership(msg.sender))throw;
}
function kill() onlyOwner{
selfdestruct(owner);
}
function lastModule(address a)constant returns(address b){return lastContract[a];}
}

contract m is SuperOwned{
address public assetAddress;
myContract public asset;
uint public endBorrow;
address public holder;


function m(){
}

function init(address con,uint endx,address temp) onlyOwner{
asset=myContract(con);
assetAddress=con;
endBorrow=block.number+endx;
holder=temp;
if(!asset.setSuperOwner(temp))throw;
}

function createPeriod(uint endx) onlyOwner{
if(block.number<endBorrow)throw;
endBorrow=block.number+endx;
}

function extend(uint more) onlyOwner{
if(block.number>endBorrow)throw;
endBorrow+=more;
}


function close(){
if((msg.sender!=owner)&&(msg.sender!=temp))throw;
if(block.number<endBorrow)throw;
if(!asset.transferOwnership(owner))throw;
if(!asset.setSuperOwner(address(0)))throw;
kill();
}

function kill() private{
selfdestruct(owner);
}

}


contract myContract{address a; function transferOwnership(address newOwner)returns (bool){ a=newOwner; return true;} function setSuperOwner(address newSuperOwner)returns (bool){ a=newSuperOwner; return true;} }
