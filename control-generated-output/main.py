import json
import os
import vertexai

from flask import Flask, render_template, request
from vertexai.generative_models import GenerationConfig, GenerativeModel


vertexai.init(project=os.environ['PROJECT_ID'], location="us-central1")

def generate_content(prompt: str, schema: str):    

    print(schema)

    if schema:
        response_schema = json.loads(schema)
    else:
        response_schema = {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "recipe_name": {
                        "type": "string",
                    },
                },
                "required": ["recipe_name"],
            },
        }

    model = GenerativeModel("gemini-1.5-pro-001")

    response = model.generate_content(
        prompt,
        # "List a few popular cookie recipes",
        generation_config=GenerationConfig(
            response_mime_type="application/json", response_schema=response_schema
        ),
    )
    print(response.text)
    return response.text


app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.tpl')


@app.route('/api', methods=['POST'])
def api():
    text = request.form['text']
    schema = request.form['schema']

    response = generate_content(text, schema)
    return response


if __name__ == '__main__':
    app.run(debug=True, port=8080)