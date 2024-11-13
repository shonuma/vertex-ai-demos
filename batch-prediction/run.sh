. .env
echo "# Create jsonl data..."
bash `pwd`/prompts/prompt_for_batch_gemini_predict.json.sh | jq -c > `pwd`/prompts/prompt_for_batch_gemini_predict.jsonl
echo "# Upload to Cloud Storage..."
gcloud storage cp `pwd`/prompts/prompt_for_batch_gemini_predict.jsonl gs://${GCS_BUCKET_NAME}/prompt/prompt_for_batch_gemini_predict.jsonl
echo "# Exec Batch Prediction..."
python main.py