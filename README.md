# SensorServer

This project is a sample of gRPC usage with Elixir.

## Requirements
- Docker
- Make
- [grpcurl](https://github.com/fullstorydev/grpcurl#installation) (Opcional)

## Installation
```bash
# Build a image of server
make build

# Run server in 50051 port
make up
```

## Test
```bash
# Use a gRPCurl or another gRPC client to call a gRPC service
grpcurl -plaintext -proto sensor.proto -d '{"sensor_id": "temper@xpto", "value": "30"}' localhost:50051 sensor_server.Sensor.Store
```

## Usage
The storage service store a sensor_id in memory and a list of values stored with same sensor_id and return last stored value. eg.:

```bash
grpcurl -plaintext -proto sensor.proto -d '{"sensor_id": "temper@xpto", "value": "30"}' localhost:50051 sensor_server.Sensor.Store

{
  "id": "temper@xpto",
  "lastEntryValue": "30"
}

grpcurl -plaintext -proto sensor.proto -d '{"sensor_id": "temper@xpto", "value": "20"}' localhost:50051 sensor_server.Sensor.Store

{
  "id": "temper@xpto",
  "lastEntryValue": "20"
}

```