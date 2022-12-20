defmodule Day03Test do
  use ExUnit.Case

  test "test parse_to_elf_rucksacks" do
    {:ok, sample_data} = File.read("resources/day_03/day_03.sample")

    sample_elf_rucksacks = [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw"
    ]

    assert sample_elf_rucksacks == Day03.parse_to_elf_rucksacks(sample_data)
  end

  test "test sum_elf_items_priorities" do
    {:ok, sample_data} = File.read("resources/day_03/day_03.sample")
    sample_elf_rucksacks = Day03.parse_to_elf_rucksacks(sample_data)
    sample_sum_priorities = 157

    assert sample_sum_priorities == Day03.sum_priorities(sample_elf_rucksacks)
  end

  test "test sum_priorities_by_groups" do
    {:ok, sample_data} = File.read("resources/day_03/day_03.sample")
    sample_elf_rucksacks = Day03.parse_to_elf_rucksacks(sample_data)
    sample_sum_priorities = 70

    assert sample_sum_priorities == Day03.sum_priorities_by_groups(sample_elf_rucksacks)
  end
end
