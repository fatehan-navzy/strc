#!/bin/bash
set -e

printf "Updating...\n"

git pull

# Use modern idiomatic Go update
go get -u ./...
go mod tidy

# Install protoc plugins at specific versions, ensure $GOPATH/bin in PATH
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

printf "Updating Completed\n"
printf "Compiling\n"

protoc \
  --go_out=. --go_opt=paths=source_relative \
  --go-grpc_out=. --go-grpc_opt=paths=source_relative \
  --validate_out="lang=go,paths=source_relative,runtime=true:." \
  -I ../strc \
  -I third_party \
  ../strc/devices/*.proto \
  ../strc/packets/*.proto \
  ../strc/services/*.proto

find ../strc -type d -exec bash -c \
  'if compgen -G "$1/*.proto" > /dev/null; then \
    mkdir -p "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")"; \
    cp "$1"/*.proto "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")/"; \
  fi' _ {} \;
rm -rf /home/mehdi/navzy/Navzy/app/src/main/proto/validate

printf "Compiling Completed\n"

printf "Committing and Pushing\n"

git add .
if ! git diff --cached --quiet; then
  git commit -m "updated protocols and services"
  git push
else
  printf "No changes to commit.\n"
fi

printf "Committed and Pushed\n"

printf "Updating Services\n"

for dir in ../gnet ../gowo ../grpc; do
  if [ -d "$dir" ]; then
    cd "$dir"
    go get -u ./...
    GOPRIVATE=github.com/fatehan-navzy go get -u github.com/fatehan-navzy/strc@latest
    printf "$(basename "$dir") updated\n"
    cd - > /dev/null
  fi
done
