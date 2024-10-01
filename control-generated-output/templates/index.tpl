<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gemini Controlled generation サンプルアプリ</title>
</head>
<body>
    <h1>Gemini Controlled generation Sample App</h1>
    <p>
        Vertex AI の <a href="Controlled generation"> 機能のデモです。
        レスポンススキーマを定義すると、プロンプトの出力を制御することができます。
    </p>
    <form id="myForm" method="POST">
        <label>プロンプト</label><br>
        <textarea id="textarea" name="text" cols=36 rows=10>
カレーの材料の野菜を３つ教えて
        </textarea><br>
        <label>レスポンススキーマ</label><br>
        <textarea id="textarea" name="schema" cols=48 rows=16>{
    "type": "array",
    "items": {
        "type": "object",
        "properties": {
            "recipe_name": {
                "type": "string"
            }
        },
        "required": ["recipe_name"]
    }
}</textarea><br>
        <input type="submit" value="送信" id="submitBtn">

    </form>
    <div id="display"></div>

    <script>
        const form = document.getElementById('myForm');
        const submitBtn = document.getElementById('submitBtn');
        const display = document.getElementById('display');

        form.addEventListener('submit', async (event) => {
            event.preventDefault();

            // ボタンを無効化
            submitBtn.disabled = true;

            // display エリアをクリア
            display.innerHTML = '';

            try {
                display.innerHTML = '生成しています...';
                const response = await fetch('/api', {
                    method: 'POST',
                    body: new FormData(form)
                });

                const data = await response.text();

                // /api の戻り値を display エリアに表示
                console.log(data);
                display.innerHTML = data;
            } catch (error) {
                console.error('Error:', error);
                display.innerHTML = 'エラーが発生しました';
            } finally {
                // ボタンを有効化
                submitBtn.disabled = false;
            }
        });
    </script>
</body>
</html>