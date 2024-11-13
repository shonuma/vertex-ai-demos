import time
import os
import vertexai

from vertexai.batch_prediction import BatchPredictionJob


vertexai.init(project=os.environ['PROJECT_ID'], location="us-central1")

input_uri = \
     "gs://{}/prompt/prompt_for_batch_gemini_predict.jsonl".format(
        os.environ['GCS_BUCKET_NAME']
     )

output_uri_prefix = \
     "gs://{}/output/".format(
        os.environ['GCS_BUCKET_NAME']
     )

def batch_prediction(
    input_uri: str,
    output_uri_prefix: str,
):
    batch_prediction_job = BatchPredictionJob.submit(
        source_model="gemini-1.5-flash-002",
        input_dataset=input_uri,
        output_uri_prefix=output_uri_prefix,
    )

    print(f"Job resource name: {batch_prediction_job.resource_name}")
    print(f"Model resource name with the job: {batch_prediction_job.model_name}")
    print(f"Job state: {batch_prediction_job.state.name}")
    start_ = int(time.time())

    while not batch_prediction_job.has_ended:
        time.sleep(5)
        print("Job is running...")
        batch_prediction_job.refresh()

    end_ = int(time.time())
    print(f"Elapsed time: {str(end_ - start_)} sec")

    if batch_prediction_job.has_succeeded:
        print("Job succeeded!")
    else:
        print(f"Job failed: {batch_prediction_job.error}")
    # Check the location of the output
    print(f"Job output location: {batch_prediction_job.output_location}")

    return output_uri

batch_prediction(input_uri, output_uri_prefix)