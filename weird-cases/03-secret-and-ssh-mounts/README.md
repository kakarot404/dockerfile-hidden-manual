# BuildKit Secrets & SSH

Why: Show secure use of credentials during builds without baking them in layers.

- BuildKit `--secret` mounts a file temporarily during RUN and it is not persisted in layers.
- `--mount=type=ssh` allows ssh-agent forwarding for git clone of private repos.
- Example build commands:

# Provide a secret file
DOCKER_BUILDKIT=1 docker build --secret id=pip_conf,src=./pip.conf -t wc-secrets .

# Use ssh (requires ssh agent running and keys loaded)
DOCKER_BUILDKIT=1 docker build --ssh default -t wc-ssh .

__Pitfalls :__ 
- Must enable BuildKit; the secret file path must exist on builder machine; secrets are ephemeral — perfect for CI.

__Interview callout :__  
- Always prefer --secret (or CI secret-manager integration) over embedding credentials with ARG/ENV.
