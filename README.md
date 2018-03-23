# ElixirScrapeDemo

**Demo of using HTTPoison and Floki to scrape Amazon book ranks.**

## Usage

Go to Amazon and grab a book ASIN from the URL.  If you navigate to a book page, the URL will look something like

```
https://www.amazon.com/Harry-Potter-Chamber-Secrets-Rowling-ebook/dp/B0192CTMW8/...
```

The ASIN is the string right after `dp`.  In this case, the ASIN is `B0192CTMW8`.

Now install the project dependencies and compile:

```
mix do deps.get, compile
```

Open an iex session (`iex -S mix`) and run

```
ElixirScrapeDemo.rank_info(asin)
```

For your selected ASIN.  The result is a map that contains the seller rank and a boolean that indicates whether or not the book is free:

```
%{"free" => false, "rank" => "198"}
```
