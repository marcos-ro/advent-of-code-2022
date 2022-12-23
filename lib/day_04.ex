defmodule Day04 do
  def parse_to_elf_cleanup_sections(data) do
    data
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(&parse_to_ranges/1)
  end

  defp parse_to_ranges(data) do
    parse_to_integer = fn string ->
      string
      |> String.split("-")
      |> Enum.map(fn string_range ->
        case Integer.parse(string_range) do
          {range, _} -> range
          :error -> {:error, :non_number}
        end
      end)
    end

    Enum.map(data, parse_to_integer)
  end

  def count_overlaped_elf_cleanup_sections(elf_cleanup_sections) do
    elf_cleanup_sections
    |> Enum.filter(&is_overlaped/1)
    |> Enum.count()
  end

  def count_any_overlaped_elf_cleanup_sections(elf_cleanup_sections) do
    elf_cleanup_sections
    |> Enum.filter(&is_any_overlaped/1)
    |> Enum.count()
  end

  defp is_overlaped([range_01, range_02]) do
    [lower_01, upper_01] = range_01
    [lower_02, upper_02] = range_02
    otherwise = true

    cond do
      lower_01 <= lower_02 && upper_01 >= upper_02 ->
        Enum.all?(lower_02..upper_02, fn item ->
          item in lower_01..upper_01
        end)

      lower_02 <= lower_01 && upper_02 >= upper_01 ->
        Enum.all?(lower_01..upper_01, fn item ->
          item in lower_02..upper_02
        end)

      otherwise ->
        false
    end
  end

  defp is_any_overlaped([range_01, range_02]) do
    [lower_01, upper_01] = range_01
    [lower_02, upper_02] = range_02
    otherwise = true

    cond do
      lower_01 <= lower_02 || upper_01 >= upper_02 ->
        Enum.any?(lower_02..upper_02, fn item ->
          item in lower_01..upper_01
        end)

      lower_02 <= lower_01 || upper_02 >= upper_01 ->
        Enum.any?(lower_01..upper_01, fn item ->
          item in lower_02..upper_02
        end)

      otherwise ->
        false
    end
  end
end
