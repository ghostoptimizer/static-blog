# static-blog
 Source code for my static blog website










## Deployment Strategy

This site uses a safe and versioned deployment flow.

The `deploy.sh` script performs the following:

1. Builds the Hugo static site into the `public/` directory.
2. Creates a timestamped release folder on the remote server (`/var/www/releases/<timestamp>`).
3. Uploads the built site files to that release folder using `rsync`.
4. Atomically flips a symlink `/var/www/current` to point to the new release folder.

This enables fast rollback by simply switching the `current` symlink.
