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
 ../strc/devices/*.proto \
 ../strc/packets/*.proto \
 ../strc/services/*.proto
```

| Company   | Model | Series | Port Number |
| --------- | ----- | ------ | ----------- |
| Teltonika | FMB   | 920    | 10920       |
