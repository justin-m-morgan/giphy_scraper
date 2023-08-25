# GiphyScraper

## Assignment Description

Create an elixir project using `mix new` named "GiphyScraper" and write a simple project that allows you to call `GiphyScraper.search(query)` and returns 25 results in the following format:

```elixir
[
  %GiphyScraper.GiphyImage{
    id: "some_id", 
    url: "url_to_gif", 
    username: "username of creator", 
    title: "SomeGif"
  },

  %GiphyScraper.GiphyImage{
    id: "some_other_id", 
    url: "url_to_gif_2", 
    username: "username of creator", 
    title: "MyGif"
  }
]
```

I recommend using the Finch module to make the requests and you can find [the Giphy endpoint here](https://developers.giphy.com/docs/api/endpoint/#search). 

In order to use Finch, you'll want to generate your project using the `--sup` flag



Note: the naming of `GiphyScraper` and `GiphyImage` are up to you to determine. 



**Make sure you delete the _build and deps folder, and zip up your project in a ".zip" or ".tar.gz" before uploading, please also name your project project_my_name for example my_app_mika that way I can identify it easier.**



Estimated Turnaround Time: 1 Business Day

Please message Mika on slack if you're waiting longer than this, sometimes the emails don't make it through

Submit your assignment
You may only submit one file with maximum 3 MB in size

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `giphy_scraper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:giphy_scraper, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/giphy_scraper>.

