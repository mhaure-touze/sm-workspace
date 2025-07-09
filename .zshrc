
#!/bin/zsh

# login code artifact (lca)
lca(){
    local token
    token="$(
        aws codeartifact get-authorization-token \
        --domain abstra \
        --domain-owner 058264397262 \
        --query authorizationToken \
        --output text \
        --region eu-west-1
    )"

    # index name "codeartifact"
    export UV_INDEX_CODEARTIFACT_USERNAME="aws"
    export UV_INDEX_CODEARTIFACT_PASSWORD="$token"

    # index name "owkin-pypi"
    export UUV_INDEX_OWKIN_USERNAME="aws"
    export UV_INDEX_OWKIN_PASSWORD="$token"
}

# direnv config
eval "$(direnv hook zsh)"

# zsh customizations
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# load uv, ...
. "$HOME/.local/bin/env"
