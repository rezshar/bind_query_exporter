#!/bin/bash -e

echo "Building testing binary and running tests..."
#Get into the right directory
cd $(dirname $0)

export GOOS=""
export GOARCH=""

#Add this directory to PATH
export PATH="$PATH:`pwd`"

go build -o "bind_query_exporter" ../

echo "Running tests..."
cd ../

touch queries.log
BIND_QUERY_EXPORTER_LOG="queries.log" go test
rm queries.log
