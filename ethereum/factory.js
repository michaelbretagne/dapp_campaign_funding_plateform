import web3 from "./web3";

import CampaignFactory from "./build/CampaignFactory.json";

const instance = new web3.eth.Contract(
  JSON.parse(CampaignFactory.interface),
  "0x74E662ca03247f46592637Aef4C47eFd24DeF9fE"
);

export default instance;
