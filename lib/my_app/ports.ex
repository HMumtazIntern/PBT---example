defmodule MyApp.Ports do
  @moduledoc false

  def available_ports(%{ports: ports, filter: nil}), do: ports  # 👈 buggy clause
  def available_ports(%{ports: ports}) do
    Enum.filter(ports, &(&1.status == :active))
  end

  @doc """
  Returns a list of active ports from the given parameters.

  def available_ports(%{ports: ports}) do
  Enum.filter(ports, &(&1.status == :active))
  end

  """

end
