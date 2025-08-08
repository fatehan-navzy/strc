# GRPC

## Go

### Installation

```
GOPRIVATE=github.com/fatehan-navzy go get -u github.com/fatehan-navzy/strc@latest
```

### Compile

```
protoc --go_out=. --validate_out="lang=go:." --go_opt=paths=source_relative \
 --go-grpc_out=. --go-grpc_opt=paths=source_relative -I ../strc \
 ../strc/{devices,packets,services}/*.proto
```

### Move to Kotlin
```
find . -type d -exec sh -c 'if ls "$1"/*.proto 1> /dev/null 2>&1; then mkdir -p "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")"; cp "$1"/*.proto "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")/"; fi' _ {} \;

```

| Company   | Model | Series | Port Number |
| --------- | ----- | ------ | ----------- |
| Teltonika | FMB   | 920    | 10920       |
