defmodule SensorServer.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Logger.Server
  run SensorServer
end
