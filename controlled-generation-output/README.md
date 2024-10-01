# Controlled Generation Output
https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/control-generated-output

# Memo
1. Enable Google Cloud APIs related Vertex AI

2. [run local] Set Environment value
Create .env file and set above environment value
```
export PROJECT_ID=<google cloud project ID>
```

3. [run Docker] 
Change <%PROJECT_ID%> to your Google Cloud Project ID.
```
# Google Cloud プロジェクトのID
ENV PROJECT_ID <%PROJECT_ID%>
```

Alternatively, you can use this command to rewrite Dockerfile. you should change `<google cloud project ID>`.
```
sed -i s/\<%PROJECT_ID%\>/<google cloud project ID>/ Dockerfile
```
