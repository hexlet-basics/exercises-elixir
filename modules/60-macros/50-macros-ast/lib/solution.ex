defmodule Solution do
  # BEGIN
  def to_ast(string) do
    {_, result} = Code.string_to_quoted(string)
    result
  end

  def collect_fn_and_arity({op, _, args} = ast, acc) when op in [:def, :defp] do
    {fn_name, fn_args} = get_fn_name_and_args(args)
    arity = length(fn_args)

    {ast, [%{name: fn_name, arity: arity} | acc]}
  end

  def collect_fn_and_arity(ast, acc) do
    {ast, acc}
  end

  defp get_fn_name_and_args(def_args) do
    case def_args do
      [{:when, _, args} | _] -> get_fn_name_and_args(args)
      [{name, _, args} | _] when is_list(args) -> {name, args}
      [{name, _, args} | _] when is_atom(args) -> {name, []}
    end
  end

  def collect_module_stats(string) do
    {_, acc} =
      string
      |> to_ast()
      |> Macro.prewalk([], &collect_fn_and_arity/2)

    acc
  end

  # END
end
