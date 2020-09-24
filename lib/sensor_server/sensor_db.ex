defmodule SensorDB do
  use Agent

  def start_link(_) do
    Agent.start_link(
      fn ->
        %{}
      end,
      name: __MODULE__
    )
  end

  def add_sensor_entry(sensor_id, value) do
    Agent.get_and_update(__MODULE__, fn sensors_map ->
      case Map.fetch(sensors_map, sensor_id) do
        :error ->
          {%{id: sensor_id, entries: [value]}, Map.put(sensors_map, sensor_id, [value])}
        {:ok, entries} ->
          updated_entries = [value | entries]
          {%{id: sensor_id, entries: updated_entries}, Map.put(sensors_map, sensor_id, updated_entries)}
      end
    end)
  end
end
