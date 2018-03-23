defmodule ElixirScrapeDemo.Html do
  @url_base ~S("https://www.amazon.com/dp/#{asin}")

  def get_html_by_asin(asin) do
    asin
    |> get_url_by_asin()
    |> get_html()
  end

  defp get_html(url) do
    {:ok, %{body: html}} = HTTPoison.get(url)
    html
  end

  defp get_url_by_asin(asin) do
    asin
    |> (&Code.eval_string(@url_base, asin: &1)).()
    |> elem(0)
  end
end
