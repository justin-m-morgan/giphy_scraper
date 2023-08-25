defmodule GiphyScraper.GiphyHttpClient do
  alias GiphyScraper.GiphyImage

  @endpoint_giffy_url "https://api.giphy.com/v1/gifs/search"

  @spec get(String.t(), keyword()) :: {:ok, list(GiphyImage.t())} | {:error, String.t()}
  def get(query, opts) do
    response =
      query
      |> query_string_builder(opts)
      |> then(&Finch.build(:get, &1))
      |> Finch.request(MyFinch)
      |> parse_response()

    case response do
      {:error, msg} -> {:error, msg}
      data -> {:ok, Enum.map(data, &json_result_to_giphy_image/1)}
    end
  end

  defp query_string_builder(query, opts) do
    api_key = Application.fetch_env!(:giphy_scraper, :giphy_api_key)
    limit = opts[:limit] || 25
    offset = opts[:offset] || 0

    @endpoint_giffy_url
    |> URI.parse()
    |> URI.append_query("api_key=#{api_key}")
    |> URI.append_query("limit=#{limit}")
    |> URI.append_query("offset=#{offset}")
    |> URI.append_query("q=#{query}")
  end

  defp parse_response({:ok, %Finch.Response{} = response}) do
    response.body
    |> Jason.decode!()
    |> Map.get("data", {:error, "Error: Response shape incorrect"})
  end

  defp parse_response({:error, %Finch.Error{}}) do
    {:error, "Error: Connection Error"}
  end

  defp parse_response(_) do
    {:error, "Error: Unknown Error"}
  end

  defp json_result_to_giphy_image(result) do
    %GiphyImage{
      id: result["id"],
      url: result["url"],
      username: result["username"],
      title: result["title"]
    }
  end
end
