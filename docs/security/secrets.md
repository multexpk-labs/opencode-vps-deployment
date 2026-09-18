# Secrets Management

## Rule

Secrets belong outside Git.

Use placeholders in examples:

    CHANGE_ME
    YOUR_API_KEY
    YOUR_VPS_IP

Never replace these placeholders with production values before committing.

## Recommended locations

For Linux services, a restricted environment file is often sufficient for a small deployment:

    /etc/opencode/server.env

Set restrictive permissions:

    umask 077
    chmod 600 /etc/opencode/server.env

## Environment variables

Example:

    OPENROUTER_API_KEY=CHANGE_ME
    OPENCODE_SERVER_PASSWORD=CHANGE_ME

Do not print secrets during troubleshooting.

Avoid commands such as env, printenv or cat of a production environment file when their output may be copied into a ticket, terminal recording or chat.

## If a secret is exposed

1. Stop using the exposed credential.
2. Revoke or rotate it at the provider.
3. Replace the secret on the server.
4. Restart the affected service.
5. Search Git history if it was committed.
6. Check logs for unauthorized use.

Removing a secret from the latest commit is not enough if it was previously committed. Rotate the credential first.

## Git protection

Review:

    git status
    git diff --cached

before every public push.

Use .gitignore for local environment files and generated credentials, but remember that .gitignore does not remove an already-tracked secret.
