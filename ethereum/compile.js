const path = require("path");
const solc = require("solc");
const fs = require("fs-extra");

// Get folder
const buildPath = path.resolve(__dirname, "build");
// Remove build folder files
fs.removeSync(buildPath);

// Get file
const campaignPath = path.resolve(__dirname, "contracts", "Campaign.sol");
// Read file
const source = fs.readFileSync(campaignPath, "utf8");
// Get solidity compiled output (Object of Campaign contract and CampaignFactory contract)
const output = solc.compile(source, 1).contracts;

// Create build folder
fs.ensureDirSync(buildPath);

for (let contract in output) {
  fs.outputJsonSync(
    path.resolve(buildPath, contract.replace(":", "") + ".json"),
    output[contract]
  );
}
