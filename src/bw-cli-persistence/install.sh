#!/bin/bash
set -e

echo "Activating feature 'bitwarden-cli-persistence'"
echo "User: ${_REMOTE_USER}     User home: ${_REMOTE_USER_HOME}"

if [  -z "$_REMOTE_USER" ] || [ -z "$_REMOTE_USER_HOME" ]; then
  echo "***********************************************************************************"
  echo "*** Require _REMOTE_USER and _REMOTE_USER_HOME to be set (by dev container CLI) ***"
  echo "***********************************************************************************"
  exit 1
fi

if [ -e "$_REMOTE_USER_HOME/.config/Bitwarden CLI" ]; then
  echo "Moving existing .config/Bitwarden CLI folder to .config/Bitwarden CLI-old"
  mv "$_REMOTE_USER_HOME/.config/Bitwarden CLI" "$_REMOTE_USER_HOME/.config/Bitwarden CLI-old"
fi

ln -s -p /dc/bw/ "$_REMOTE_USER_HOME/.config/Bitwarden CLI"
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "$_REMOTE_USER_HOME/.config/Bitwarden CLI"

# chown mount (only attached on startup)
cat << EOF >> "$_REMOTE_USER_HOME/.bashrc"
sudo chown -R "${_REMOTE_USER}:${_REMOTE_USER}" /dc/bw
EOF
chown -R $_REMOTE_USER $_REMOTE_USER_HOME/.bashrc