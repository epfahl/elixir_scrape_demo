defmodule ElixirScrapeDemo.Parse do
  @rank_id "SalesRank"
  @rank_regex ~r/#(?<rank>[0-9]{1,3}(,[0-9]{3})*) (?<free>Paid|Free)/

  @doc """
  Given product page HTML, return a map that includes the rank and a boolean
  that indicates if the book is free or not.

  %{"rank" => 123, "free" => false}
  """
  def rank_info(html) do
    find_by_id(html, @rank_id)
    |> Floki.text(deep: false)
    |> String.trim()
    |> (&Regex.named_captures(@rank_regex, &1)).()
    |> Map.update!("rank", &string_to_integer(&1))
    |> Map.update!("free", &(&1 == "Free"))
  end

  defp find_by_id(html, id) do
    Floki.find(html, "##{id}")
  end

  defp string_to_integer(s) do
    s
    |> String.replace(",", "")
    |> String.to_integer()
  end
end
