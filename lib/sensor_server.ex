defmodule SensorServer do
  @moduledoc """
  Documentation for `SensorServer`.
  """
  use GRPC.Server, service: SensorServer.Sensor.Service

  def store(request, _stream) do
    %{id: sensor_id, entries: entries} =
      SensorDB.add_sensor_entry(request.sensor_id, request.value)

    last_entry_value = List.first(entries)

    SensorServer.SensorInfo.new(%{
      id: sensor_id,
      last_entry_value: last_entry_value
    })
  end
end
