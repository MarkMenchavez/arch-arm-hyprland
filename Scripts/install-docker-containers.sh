#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Please provide a password!"
  echo "$0 <password>"
  exit 1
fi

docker run -d -p 18888:18888 -p 4317:18889 --name aspire-dashboard mcr.microsoft.com/dotnet/aspire-dashboard

docker run -d -p 1080:1080 -p 1025:1025 --name mailcatcher sj26/mailcatcher

docker run -d -p 6379:6379 -p 8001:8001 -v redis-stack-data:/data -e "REDIS_ARGS=--requirepass $1" --name redis-stack redis/redis-stack:latest

docker run -d -p 5672:5672 -p 15672:15672 -v rabbitmq-data:/var/lib/rabbitmq --name rabbitmq arm64v8/rabbitmq:4.1.2-management

docker run -d -p 1433:1433 -v azure-sql-edge-extensibility:/var/opt/mssql-extensibility -v azure-sql-edge-data:/var/opt/mssql-extensibility/data -v azure-sql-edge-log:/var/opt/mssql-extensibility/log --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e "MSSQL_SA_PASSWORD=$1" --name azure-sql-edge mcr.microsoft.com/azure-sql-edge
