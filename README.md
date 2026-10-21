# ssh-keygen4

One command to set up a dedicated SSH key + `~/.ssh/config` host alias for a
GitHub repo, then clone it. Ideal for per-repo deploy keys on private repos.

## Install

```bash
bash install.sh        # installs to ~/.local/bin/ssh-keygen4
```

Make sure `~/.local/bin` is on your `PATH`.

## Usage

```bash
ssh-keygen4 https://github.com/OWNER/REPO
ssh-keygen4 git@github.com:OWNER/REPO.git
```

## What it does

1. Parses the repo name out of the URL (handles HTTPS, SSH, trailing slashes, `.git`).
2. Generates an ed25519 key at `~/.ssh/<repo>` — counting up on duplicates
   (`<repo>-1`, `<repo>-2`, ...), so existing keys are never overwritten.
3. Appends a host alias to `~/.ssh/config`:

   ```
   Host <repo>-github.com
     HostName github.com
     IdentityFile ~/.ssh/<repo>
     User git
     IdentitiesOnly yes
   ```

4. Prints the public key — add it under **repo → Settings → Deploy keys**.
5. Asks `Have you added the key to your private repo? [y/N]` — on `y` it clones
   into `./<repo>` in the current directory (also counting up on collisions).

Afterwards, the repo's SSH URL is:

```bash
git@<repo>-github.com:OWNER/REPO.git
```
