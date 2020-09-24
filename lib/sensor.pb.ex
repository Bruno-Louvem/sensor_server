defmodule SensorServer.SensorInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          last_entry_value: String.t()
        }
  defstruct [:id, :last_entry_value]

  field :id, 1, type: :string
  field :last_entry_value, 2, type: :string
end

defmodule SensorServer.StoreEntryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sensor_id: String.t(),
          value: String.t()
        }
  defstruct [:sensor_id, :value]

  field :sensor_id, 1, type: :string
  field :value, 2, type: :string
end

defmodule SensorServer.Sensor.Service do
  @moduledoc false
  use GRPC.Service, name: "sensor_server.Sensor"

  rpc :Store, SensorServer.StoreEntryRequest, SensorServer.SensorInfo
end

defmodule SensorServer.Sensor.Stub do
  @moduledoc false
  use GRPC.Stub, service: SensorServer.Sensor.Service
end
