// NoteAccessControl.sol

pragma solidity ^0.8.0;

contract NoteAccessControl {
  // Define roles and permissions
  address public owner;
  mapping(address => bool) public admins;
  mapping(address => bool) public editors;

  // Modifier to restrict access to only the owner
  modifier onlyOwner() {
    require(msg.sender == owner, "Access denied. Only owner can perform this action.");
    _;
  }

  // Modifier to restrict access to only admins
  modifier onlyAdmin() {
    require(admins[msg.sender], "Access denied. Only admins can perform this action.");
    _;
  }

  // Modifier to restrict access to only admins and editors
  modifier onlyAdminOrEditor() {
    require(admins[msg.sender] || editors[msg.sender], "Access denied. Only admins or editors can perform this action.");
    _;
  }

  // Constructor to set the contract owner
  constructor() {
    owner = msg.sender;
  }

  // Function to add an admin
  function addAdmin(address admin) public onlyOwner {
    admins[admin] = true;
  }

  // Function to remove an admin
  function removeAdmin(address admin) public onlyOwner {
    admins[admin] = false;
  }

  // Function to add an editor
  function addEditor(address editor) public onlyAdmin {
    editors[editor] = true;
  }

  // Function to remove an editor
  function removeEditor(address editor) public onlyAdmin {
    editors[editor] = false;
  }
}
