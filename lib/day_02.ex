defmodule Day02 do
  def parse_to_elf_strategy_guide(data) do
    data
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.filter(&(&1 != [""]))
  end

  def simulate_elf_strategy(elf_strategy_guide, parse_policy_version \\ :v1) do
    cond do
      parse_policy_version == :v1 ->
        processing_strategy_guide(elf_strategy_guide, &parse_policy_1/1)

      parse_policy_version == :v2 ->
        processing_strategy_guide(elf_strategy_guide, &parse_policy_2/1)
    end
  end

  defp processing_strategy_guide(elf_strategy_guide, parse_policy) do
    elf_strategy_guide
    |> Enum.map(parse_policy)
    |> Enum.map(&processing_choises/1)
    |> Enum.sum()
  end

  defp parse_policy_1(choises) do
    parse_to_choise = fn choise ->
      case choise do
        "A" -> :rock
        "B" -> :paper
        "C" -> :scissors
        "X" -> {:rock, 1}
        "Y" -> {:paper, 2}
        "Z" -> {:scissors, 3}
      end
    end

    Enum.map(choises, parse_to_choise)
  end

  defp parse_policy_2(choises) do
    case choises do
      ["A", "X"] -> [:rock, {:scissors, 3}]
      ["A", "Y"] -> [:rock, {:rock, 1}]
      ["A", "Z"] -> [:rock, {:paper, 2}]
      ["B", "X"] -> [:paper, {:rock, 1}]
      ["B", "Y"] -> [:paper, {:paper, 2}]
      ["B", "Z"] -> [:paper, {:scissors, 3}]
      ["C", "X"] -> [:scissors, {:paper, 2}]
      ["C", "Y"] -> [:scissors, {:scissors, 3}]
      ["C", "Z"] -> [:scissors, {:rock, 1}]
    end
  end

  defp processing_choises(choises) do
    case choises do
      [:rock, {:paper, score}] -> score + 6
      [:paper, {:scissors, score}] -> score + 6
      [:scissors, {:rock, score}] -> score + 6
      [:rock, {:scissors, score}] -> score
      [:paper, {:rock, score}] -> score
      [:scissors, {:paper, score}] -> score
      [_, {_, score}] -> score + 3
    end
  end
end
