#!/bin/bash

printf "Updating...\n"

git pull
go get -u all
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
  ../strc/{devices,packets,services}/*.proto

find . -type d -exec sh -c 'if ls "$1"/*.proto 1> /dev/null 2>&1; then mkdir -p "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")"; cp "$1"/*.proto "/home/mehdi/navzy/Navzy/app/src/main/proto/$(basename "$1")/"; fi' _ {} \;
rm -rf /home/mehdi/navzy/Navzy/app/src/main/proto/validate

printf "Compiling Completed\n"

printf "Commiting and Pushing\n"

git add .
git commit -m "updated protocols and services"
git push orging main

printf "Commited and Pushed\n"

printf "Updating Services"

cd ../gnet || exit
GOPRIVATE=github.com/fatehan-navzy go get -u github.com/fatehan-navzy/strc@latest
printf "GNET updated\n"

cd ../gowo || exit
GOPRIVATE=github.com/fatehan-navzy go get -u github.com/fatehan-navzy/strc@latest
printf "GOWO updated\n"

cd ../grpc || exit
GOPRIVATE=github.com/fatehan-navzy go get -u github.com/fatehan-navzy/strc@latest
printf "GRPC updated\n"