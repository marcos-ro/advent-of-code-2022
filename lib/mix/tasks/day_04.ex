defmodule Mix.Tasks.Day04 do
  use Mix.Task

  def run(_) do
    {:ok, data} = File.read("resources/day_04/day_04.data")
    elf_cleanup_sections = Day04.parse_to_elf_cleanup_sections(data)
    answer_01 = Day04.count_overlaped_elf_cleanup_sections(elf_cleanup_sections)
    answer_02 = Day04.count_any_overlaped_elf_cleanup_sections(elf_cleanup_sections)

    IO.puts("**** Day 04 ****\n\nanswer_01(#{answer_01})\nanswer_02(#{answer_02})")
  end
end
