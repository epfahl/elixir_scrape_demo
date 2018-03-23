defmodule ElixirScrapeDemo.Html do
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
    "https://www.amazon.com/dp/#{asin}"
  end
end
