#!/bin/bash
set -e

echo "**Update**";
sudo apt update && sudo apt upgrade -y

echo "Clean docker";
{
  docker system prune -a -f --volumes
} || {
  "Fail"
}

echo "Yarn clean";
yarn cache clean