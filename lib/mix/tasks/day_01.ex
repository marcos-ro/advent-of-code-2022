defmodule Mix.Tasks.Day01 do
  use Mix.Task

  def run(_) do
    {:ok, data} = File.read("resources/day_01/day_01.data")
    elf_calories = Day01.parse_to_elf_calories(data)
    answer_01 = Day01.total_elf_calories(elf_calories)
    answer_02 = Day01.top_sum_elf_calories(elf_calories)

    IO.puts("**** Day 01 ****\n\nanswer_01(#{answer_01})\nanswer_02(#{answer_02})")
  end
end
