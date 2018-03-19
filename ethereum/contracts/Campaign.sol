pragma solidity ^0.4.17;

// Contract that deploys a new instance of the Campaign contract.
// Allow the user to create a new campaign and pay for the cost of deploying a 
// contract and also prevent the user to modify the Campaign contract
contract CampaignFactory {
    // List of all the Campaign contract deployed
    address[] public deployedCampaigns;
    
    function createCampaign(uint minimum) public {
        address newCampaign = new Campaign(minimum, msg.sender);
        deployedCampaigns.push(newCampaign);
    }
    
    function getDeployedCampaigns() public view returns (address[]) {
        return deployedCampaigns;
    }
}

// Campaign contract
contract Campaign {
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        // Number of people who voted
        uint approvalCount;
        // List of person who voted
        mapping(address => bool) approvals;
    }
    
    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    // Var of the number of people who contributed
    uint public approversCount;
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function Campaign(uint minimum, address creator) public {
        manager = creator;
        minimumContribution = minimum;
    }
    
    function contribute() public payable {
        require(msg.value > minimumContribution);
        // Add a new key to the approvers mapping
        approvers[msg.sender] = true;
        
        // Add 1 to the numbers of approvers (contributers)
        approversCount++;
    }
    
    function createRequest(string description, uint value, address recipient) public restricted {
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            complete: false,
            approvalCount: 0
        });
        
        requests.push(newRequest);
    }
    
    function approveRequest(uint index) public {
        // Create var request base on the Request struct at a determinated index
        Request storage request = requests[index];
        
        // CHeck if the person has donated
        require(approvers[msg.sender]);
        // Check if the person has not voted before
        require(!request.approvals[msg.sender]);
        // Add person to the approvals mapping (person who voted list)
        request.approvals[msg.sender] = true;
        // Add 1 to the total numbers of people who voted
        request.approvalCount++;
    }
    
    function finalizeRequest(uint index) public restricted {
        // Create var request base on the Request struct at a determinated index
        Request storage request = requests[index];
        
        // Check if more than 50% of the approvers (contributers) approved the request
        require(request.approvalCount > (approversCount / 2));
        // Check if request has not been approved already
        require(!request.complete);
        
        // Send the amount requested to the recipient
        request.recipient.transfer(request.value);
        // Update request as complete
        request.complete = true;
    }

    function getSummary() public view returns (
        uint, uint, uint, uint, address
    ) {
        return (
            minimumContribution,
            this.balance,
            requests.length,
            approversCount,
            manager
        );
    }

    function getRequestCount() public view returns (uint) {
        return requests.length;
    }
}