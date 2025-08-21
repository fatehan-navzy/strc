# GRPC

## Go

### Installation

```
GOPRIVATE=github.com/fatehan-navzy go get -u github.com/fatehan-navzy/strc@latest
```

### Compile

```
protoc \
  --go_out=. --go_opt=paths=source_relative \
  --go-grpc_out=. --go-grpc_opt=paths=source_relative \
  --validate_out="lang=go,paths=source_relative,runtime=true:." \
  -I ../strc \
  -I third_party \
  ../strc/{devices,packets,services}/*.proto
```

### Move to Kotlin

```
find . -type d -exec sh -c 'if ls "$1"/*.proto 1> /dev/null 2>&1; then mkdir -p "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")"; cp "$1"/*.proto "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")/"; fi' _ {} \;

```

| Company   | Model | Series | Port Number |
|-----------|-------|--------|-------------|
| Teltonika | FMB   | 920    | 10920       |
| Teltonika | FMB   | 920    | 10921       |
