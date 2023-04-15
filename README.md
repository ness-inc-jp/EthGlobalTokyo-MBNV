# MBNV(Most Beautiful NFT Viewer)

## What is MBNV?
What NFTs do you possess and how do you see them?
The real experience of owning an NFT is provided through the iOS app.


## How it's made?🤔

For this project, we created an iOS app using Swift to provide a better ownership experience.

The technology utilized this time was MetaMaskSDK to obtain the user's Wallet information, and based on the WalletAddress, Airstack's TokenBalancesAPI was used to obtain the NFT and related information held by the WalletAPI.
You can list the NFTs you own here.

We chose Airstack because it offers a larger number of schemers than conventional ones and because it is GraphQL, which allows us to retrieve complex data.
One particularly difficult point was the connection between Swift and GraphQL.
By clearing this area, we were able to smoothly express Graph information in swift.
However, GraphQL and Swift were not very compatible, and there were still some issues, such as the inability to reflect the type of NFT attributes.


## Tech used

- Swift
- Metamask SDK
- Airstack API
