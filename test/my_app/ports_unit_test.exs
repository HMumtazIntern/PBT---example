defmodule MyApp.PortsUnitTest do
  use ExUnit.Case
  alias MyApp.Ports

  test "available_ports returns only active ports" do
    IO.puts("✅ Running test: available_ports returns only active ports")
    ports = [%{status: :active}, %{status: :inactive}]
    result = Ports.available_ports(%{ports: ports})
    assert Enum.all?(result, &(&1.status == :active))
  end
end
