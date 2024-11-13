# Batch Prediction
https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/batch-prediction-gemini

# Memo
1. Install gcloud CLI
- https://cloud.google.com/sdk/docs/install?hl=ja

2. Enable Google Cloud APIs related Vertex AI

3. Login and set project

```
gcloud auth login
gcloud config set project <PROJECT_ID>
```

4. Create cloud storage bucket (if you do not have appropriate gcs bucket)

```
gcloud storage buckets create gs://<GCS_BUCKET_NAME> --location=<LOCATION> --project=<PROJECT>
gcloud storage buckets ls gs://<GCS_BUCKET_NAME>
```

5. Prepare files

```
Using ImageFX

[dog_demo.jpg]
seed: 927363
Prompt: Cute dog, shiba
Square style

[bird_demo.jpg]
seed: 927363
Prompt: Cute bird, pheasant
Square style

[monkey_demo.jpg]
seed: 927363
Prompt: Cute monkey
Square style
```

6. Upload files

```
gcloud storage cp -r images/ gs://<GCS_BUCKET_NAME>/
```

