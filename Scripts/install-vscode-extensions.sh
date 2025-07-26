#!/bin/bash

# Exit if any command fails
set -e

# List of extensions to install
extensions=(
  editorconfig.editorconfig
  cweijan.dbclient-jdbc
  cweijan.vscode-redis-client
  editorconfig.editorconfig
  github.copilot
  github.copilot-chat
  ms-azuretools.vscode-containers
  ms-dotnettools.csdevkit
  ms-dotnettools.csharp
  ms-dotnettools.vscode-dotnet-runtime
  ms-mssql.data-workspace-vscode
  ms-mssql.mssql
  ms-mssql.sql-bindings-vscode
  ms-mssql.sql-database-projects-vscode
  ms-vscode-remote.remote-containers
)

echo "Installing Visual Studio Code extensions..."

for extension in "${extensions[@]}"; do
  if code --list-extensions | grep -q "$extension"; then
    echo "✔ $extension is already installed"
  else
    echo "➕ Installing $extension..."
    code --install-extension "$extension"
  fi
done

echo "✅ All extensions processed."
