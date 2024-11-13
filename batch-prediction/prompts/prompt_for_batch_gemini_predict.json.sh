cat << EOF
{
  "request": {
    "contents": [
      {
        "role": "user",
        "parts": [
          {
            "text": "What is the relation between the following images?"
          },
          {
            "fileData": {
              "fileUri": "gs://${GCS_BUCKET_NAME}/images/bird_demo.jpg",
              "mimeType": "image/jpeg"
            }
          },
          {
            "fileData": {
              "fileUri": "gs://${GCS_BUCKET_NAME}/images/dog_demo.jpg",
              "mimeType": "image/jpeg"
            }
          },
          {
            "fileData": {
              "fileUri": "gs://${GCS_BUCKET_NAME}/images/monkey_demo.jpg",
              "mimeType": "image/jpeg"
            }
          }
        ]
      }
    ]
  }
}
EOF