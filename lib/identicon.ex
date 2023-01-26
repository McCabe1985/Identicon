defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
  end

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def build_pixel_map(%Identicon.Image{grid: grid} = image) do

  end


  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    Enum.filter grid, fn({code, _index}) ->
      rem(code, 2)
    end
    %Identicon.Image{image | grid: grid}
  end
  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
