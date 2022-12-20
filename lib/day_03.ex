defmodule Day03 do
  def parse_to_elf_rucksacks(data) do
    data
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
  end

  def sum_priorities(elf_rucksacks) do
    elf_rucksacks
    |> Enum.map(&String.graphemes/1)
    |> share_ruckstack_compartment()
    |> Enum.map(&parse_to_priorities/1)
    |> Enum.sum()
  end

  def sum_priorities_by_groups(elf_rucksacks, group \\ 3) do
    elf_rucksacks
    |> Enum.map(&String.graphemes/1)
    |> Enum.chunk_every(group)
    |> share_ruckstack_groups()
    |> Enum.map(&parse_to_priorities/1)
    |> Enum.sum()
  end

  defp parse_to_priorities(item) do
    ascii_code = :binary.first(item)

    if ascii_code >= 97 do
      ascii_code - 96
    else
      ascii_code - 64 + 26
    end
  end

  defp share_ruckstack_compartment(elf_rucksacks, shared_ruckstack \\ [])
  defp share_ruckstack_compartment([], shared_ruckstack), do: shared_ruckstack

  defp share_ruckstack_compartment([elf_rucksack | elf_rucksacks], shared_ruckstack) do
    size = Enum.count(elf_rucksack)
    half = div(size, 2)
    compartment_1 = Enum.slice(elf_rucksack, 0..(half - 1))
    compartment_2 = Enum.slice(elf_rucksack, half..size)

    both_compartments =
      compartment_1
      |> Enum.uniq()
      |> Enum.filter(fn item ->
        item in compartment_2
      end)

    share_ruckstack_compartment(elf_rucksacks, Enum.concat(shared_ruckstack, both_compartments))
  end

  defp share_ruckstack_groups(groups, shared_ruckstack \\ [])
  defp share_ruckstack_groups([], shared_ruckstack), do: shared_ruckstack

  defp share_ruckstack_groups([[group_1, group_2, group_3] | groups], shared_ruckstack) do
    both_compartments =
      group_1
      |> Enum.uniq()
      |> Enum.filter(fn item ->
        item in group_2 && item in group_3
      end)

    share_ruckstack_groups(groups, Enum.concat(shared_ruckstack, both_compartments))
  end
end
