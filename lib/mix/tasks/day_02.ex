defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    {:ok, data} = File.read("resources/day_02/day_02.data")
    elf_strategy_guide = Day02.parse_to_elf_strategy_guide(data)
    answer_01 = Day02.simulate_elf_strategy(elf_strategy_guide)
    answer_02 = Day02.simulate_elf_strategy(elf_strategy_guide, :v2)

    IO.puts("**** Day 02 ****\n\nanswer_01(#{answer_01})\nanswer_02(#{answer_02})")
  end
end
