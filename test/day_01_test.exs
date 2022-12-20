defmodule Day01Test do
  use ExUnit.Case

  test "test parse_to_elf_calories" do
    {:ok, sample_data} = File.read("resources/day_01/day_01.sample")

    sample_elf_calories = [
      [1000, 2000, 3000],
      [4000],
      [5000, 6000],
      [7000, 8000, 9000],
      [10000]
    ]

    assert sample_elf_calories == Day01.parse_to_elf_calories(sample_data)
  end

  test "test total_elf_calories" do
    {:ok, sample_data} = File.read("resources/day_01/day_01.sample")
    sample_elf_calories = Day01.parse_to_elf_calories(sample_data)
    sample_total_elf_calories = 24000

    assert sample_total_elf_calories == Day01.total_elf_calories(sample_elf_calories)
  end

  test "test top_sum_elf_calories" do
    {:ok, sample_data} = File.read("resources/day_01/day_01.sample")
    sample_elf_calories = Day01.parse_to_elf_calories(sample_data)
    sample_top_sum_elf_calories = 45000

    assert sample_top_sum_elf_calories == Day01.top_sum_elf_calories(sample_elf_calories)
  end
end
