import Web3 from "web3";

let web3;

// We are in the browser and metamask is running
if (typeof window !== "undefined" && typeof window.web3 !== "undefined") {
  web3 = new Web3(window.web3.currentProvider);
} else {
  // We are on the server or the user is not running metamask
  const provider = new Web3.providers.HttpProvider(
    "[YOUR INFURA ACCESS (https://infura.io/)]"
  );
  web3 = new Web3(provider);
}

export default web3;
