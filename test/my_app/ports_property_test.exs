defmodule MyApp.PortsPropertyTest do
  use ExUnit.Case
  use ExUnitProperties

  import StreamData
  alias MyApp.Ports

  def port_params_generator do
    ports_generator =
      list_of(
        fixed_map(%{
          status: one_of([constant(:active), constant(:inactive), constant(nil)])
        }),
        min_length: 0,
        max_length: 10
      )

    filter_generator =
      one_of([constant(nil), constant(:some_filter)])

    fixed_map(%{
      ports: ports_generator,
      filter: filter_generator
    })
  end

  property "available_ports/1 only returns active ports" do
    check all params <- port_params_generator() do
      ports = Ports.available_ports(params)
      assert Enum.all?(ports, &(&1.status == :active))
    end
  end
end
