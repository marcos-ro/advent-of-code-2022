defmodule Mix.Tasks.Day03 do
  use Mix.Task

  def run(_) do
    {:ok, data} = File.read("resources/day_03/day_03.data")
    elf_rucksacks = Day03.parse_to_elf_rucksacks(data)
    answer_01 = Day03.sum_priorities(elf_rucksacks)
    answer_02 = Day03.sum_priorities_by_groups(elf_rucksacks)

    IO.puts("**** Day 03 ****\n\nanswer_01(#{answer_01})\nanswer_02(#{answer_02})")
  end
end
