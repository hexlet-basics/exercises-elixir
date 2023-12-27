
Реализуйте парсер, который читает текст (расширение `.txt`) и построчно читает его (разделитель `\n`). Если текст пустой, верните ошибку:

```elixir
TextParser.extensions()
# => [".txt"]

text = "hello\nworld!"
TextParser.parse(text)
# => {:ok, ["hello", "world!"]}

text = ""
TextParser.parse(text)
# => {:error, :no_text}
```
