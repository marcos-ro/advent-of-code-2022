defmodule Day02Test do
  use ExUnit.Case

  test "test parse_to_elf_strategy_guide" do
    {:ok, sample_data} = File.read("resources/day_02/day_02.sample")
    sample_elf_strategy_guide = [["A", "Y"], ["B", "X"], ["C", "Z"]]

    assert sample_elf_strategy_guide == Day02.parse_to_elf_strategy_guide(sample_data)
  end

  test "test simulate_elf_strategy with v1 policies" do
    {:ok, sample_data} = File.read("resources/day_02/day_02.sample")
    sample_elf_strategy_guide = Day02.parse_to_elf_strategy_guide(sample_data)
    sample_score = 15

    assert sample_score == Day02.simulate_elf_strategy(sample_elf_strategy_guide)
  end

  test "test simulate_elf_strategy with v2 policies" do
    {:ok, sample_data} = File.read("resources/day_02/day_02.sample")
    sample_elf_strategy_guide = Day02.parse_to_elf_strategy_guide(sample_data)
    sample_score = 12

    assert sample_score == Day02.simulate_elf_strategy(sample_elf_strategy_guide, :v2)
  end
end
