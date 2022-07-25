#!/bin/bash

# upload image to nft.storage

fname="YOUR_FILE_NAME"
apikey="YOUR_API_KEY_FROM_NFT_STORAGE"

# Content-Type          list of Content-Type possibilies here: https://stackoverflow.com/questions/23714383/what-are-all-the-possible-values-for-http-content-type-header
#   image/*             for image file
#   text/markdown       for markdown text file (*.md)
#   application/pdf     for PDF file
#   application/json    for JSON metadata file
content_type="image/*"

cid=""
remote_hash=""
local_hash=""

upload_file() {

   fname=$1
   response=`curl -s -X 'POST' "https://api.nft.storage/upload" \
     -H "accept: application/json" \
     -H "Content-Type: $content_type" \
     -H "Authorization: Bearer $apikey" \
     --data-binary "@$fname"`

   cid=`echo $response | jq -r '.value.cid'`

   remote_hash=`curl -s "https://$cid.ipfs.nftstorage.link" | sha256sum | cut -c 1-64`
   local_hash=`sha256sum $fname | cut -c 1-64`

   if [ "$remote_hash" == "$local_hash" ]; then
      return 0
   else
      return 1
   fi
}

upload_image $fname
echo "CID        : $cid"
echo "Remote URI : https://$cid.ipfs.nftstorage.link"
echo "Remote hash: $remote_hash"
echo "Local hash : $local_hash"
