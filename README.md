# nftstorage-proofofconcept

> This script is a proof of concept. The goal is to build a script to be able to upload a file to
> nft.storage and get the CID back. 

### Goals
* script upload to nft.storage
* verify local hash of file matches the hash of the file after being uploaded
* output the CID returned from nft.storage
* ouput the local file hash
* ouput the remote file hash (by downloading the remote file and then hashing)

### Preparing to run
You will need to edit the script and add in your file name.
You will also need an API key from nft.storage. You can create an account here: [Create NFT Storage Account](https://nft.storage/docs/#create-an-account)

### Running the script

```
bash poc.sh
```



**References**
[NFT.Storage HTTP API](https://nft.storage/api-docs/)

