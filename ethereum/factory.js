import web3 from "./web3";

import CampaignFactory from "./build/CampaignFactory.json";

const instance = new web3.eth.Contract(
  JSON.parse(CampaignFactory.interface),
  "0x75bB7AbBb00eAc198E6d4564728F1A33e1593147"
);

export default instance;
