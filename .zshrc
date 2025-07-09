
#!/bin/zsh

# load uv, ..
source "$HOME/.local/bin/env"

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
