defmodule Day01 do
  def parse_to_elf_calories(data) do
    data
    |> String.split("\n\n")
    |> Enum.map(&parse_to_calories/1)
  end

  def total_elf_calories(elf_calories) do
    elf_calories
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  def top_sum_elf_calories(elf_calories, top \\ 3) do
    elf_calories
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(top)
    |> Enum.sum()
  end

  defp parse_to_calories(data) do
    data
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(fn string ->
      case Integer.parse(string) do
        {calorie, _} -> calorie
        :error -> {:error, :non_number}
      end
    end)
  end
end
