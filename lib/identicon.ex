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
  end

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk_every(3)
    |> mirror_row
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
