defmodule Day04Test do
  use ExUnit.Case

  test "test parse_to_elf_cleanup_sections" do
    {:ok, sample_data} = File.read("resources/day_04/day_04.sample")

    sample_elf_cleanup_sections = [
      [[2, 4], [6, 8]],
      [[2, 3], [4, 5]],
      [[5, 7], [7, 9]],
      [[2, 8], [3, 7]],
      [[6, 6], [4, 6]],
      [[2, 6], [4, 8]]
    ]

    assert sample_elf_cleanup_sections == Day04.parse_to_elf_cleanup_sections(sample_data)
  end

  test "test count_overlaped_elf_cleanup_sections" do
    {:ok, sample_data} = File.read("resources/day_04/day_04.sample")
    sample_elf_cleanup_sections = Day04.parse_to_elf_cleanup_sections(sample_data)
    sample_count_overlaped_elf_cleanup_sections = 2

    assert sample_count_overlaped_elf_cleanup_sections ==
             Day04.count_overlaped_elf_cleanup_sections(sample_elf_cleanup_sections)
  end

  test "test count_any_overlaped_elf_cleanup_sections" do
    {:ok, sample_data} = File.read("resources/day_04/day_04.sample")
    sample_elf_cleanup_sections = Day04.parse_to_elf_cleanup_sections(sample_data)
    sample_count_any_overlaped_elf_cleanup_sections = 4

    assert sample_count_any_overlaped_elf_cleanup_sections ==
             Day04.count_any_overlaped_elf_cleanup_sections(sample_elf_cleanup_sections)
  end
end
