defmodule GiphyScraper do
  @moduledoc """
  Application for fetching GIF data from Giphy
  """

  alias GiphyScraper.GiphyHttpClient

  @doc """
  Search for GIFs on Giphy

  Query options:

  - limit: integer (default: 25)
  - offset: integer (default: 0)
  """
  @type search_opts :: [limit: non_neg_integer(), offset: non_neg_integer()]
  @spec search(String.t(), search_opts()) :: {:ok, list(GiphyImage.t())} | {:error, String.t()}
  defdelegate search(query, opts \\ []), to: GiphyHttpClient, as: :get
end
