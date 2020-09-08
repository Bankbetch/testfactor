eval $(ssh-agent -s)
ssh-add <(echo "${_SSH_PRIVATE_KEY}")
echo "${_SSH_PRIVATE_KEY}" | tr -d '\r' | ssh-add - >/dev/null
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan ${_PROD_SERVER} >>~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts
'[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
