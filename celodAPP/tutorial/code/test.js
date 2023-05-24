// test.js

const { encrypt, decrypt } = require('./encryption');

// Test case for encryption
const originalData = 'Hello, world!';
const encryptionKey = 'encryption_key';

const encryptedData = encrypt(originalData, encryptionKey);
console.log('Encrypted Data:', encryptedData);

// Test case for decryption
const decryptedData = decrypt(encryptedData, encryptionKey);
console.log('Decrypted Data:', decryptedData);

// Additional test cases can be added as needed