defmodule ElixirScrapeDemo do
  alias ElixirScrapeDemo.{Html, Parse}

  @doc """
  Given product ASIN, return a map that includes the rank and a boolean
  that indicates if the book is free or not.

  %{"rank" => 123, "free" => false}
  """
  def rank_info(asin) do
    asin
    |> Html.get_html_by_asin()
    |> Parse.rank_info()
  end
end
