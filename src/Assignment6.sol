// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Assignment6 {
    
    event FundsDeposited (address indexed sender,uint amount );
    // 1. Declare an event called `FundsDeposited` with parameters: `sender` and `amount`
    event FundsWithdrawn (address indexed receiver, uint amount);
    // 2. Declare an event called `FundsWithdrawn` with parameters: `receiver` and `amount`
   

    mapping (address=>uint)public balance ;
    mapping (address=>uint)public receiver;

    // 3. Create a public mapping called `receiver` to tracker users balances

    // Modifier to check if sender has enough balance
    modifier hasEnoughBalance( uint amount) {
        require (balance [msg.sender] >= amount);
        _;
    }

    // Function to deposit Ether
    // This function should:
    // - Be external and payable
    // - Emit the `FundsDeposited` event
    function deposit () external payable  {
        balance[msg.sender]+=msg.value;
        emit FundsDeposited (msg.sender,msg.value);


        // increment user balance in balances mapping 

        // emit suitable event
    }

    // Function to withdraw Ether
    // This function should:
    // - Be external
    // - Take one parameter: `amount`
    // - Use the `hasEnoughBalance` modifier
    // - Emit the `FundsWithdrawn` event

    function withdraw(uint amount) external hasEnoughBalance(1 ether) {
            balance [msg.sender]-=amount;
            payable(msg.sender).transfer(amount);
            emit FundsWithdrawn(msg.sender,amount);

        // decrement user balance from balances mapping 

        // send tokens to the caller

        // emit suitable event

    }

    // Function to check the contract balance
    // This function should:
    // - Be public and view
    // - Return the contract's balance
    function getContractBalance()public view returns(uint) {
        return address(this).balance;
        // return the balance of the contract

    }
}
