# GRPC

## Go

### Installation

```
go get github.com/fatehan-navzy/strc
```

### Compile

```
protoc --go_out=. --go_opt=paths=source_relative \
 --go-grpc_out=. --go-grpc_opt=paths=source_relative -I ../strc \
 ../strc/{devices,packets,services}/*.proto
```

### Move to Kotlin
```
cp ../strc/{devices,packets,services}/*.proto /home/mehdi/apps/navzy-kotlin/app/src/main/proto/navzy
```

| Company   | Model | Series | Port Number |
| --------- | ----- | ------ | ----------- |
| Teltonika | FMB   | 920    | 10920       |
