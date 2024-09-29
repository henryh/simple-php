# Simple PHP server in Docker

The simple PHP server in Docker with Composer.
It's a basic server for static files or PHP projects. You can use it for testing or development purposes. The server is based on the official PHP image. You can add your files to the `app` directory or create a symbolic link to your project directory.
Entrypoint is a `public` dir with the `index.php` file.

To work with the server, you need [Docker](https://docs.docker.com/get-started/get-docker/) installed.

### Commands

- `make install` - initial setup
- `make up` - start server
- `make down` - stop server
- `make restart` - reboot server with new config or a files link
- `make watch` - start the server and show realtime logs
- `make exec` - go to the server console
- `make logs` - view server logs

### Get started

1. Run `make install`. The command uses the `.env.example` file as a template (don't change it) and creates a new `.env` file where you can specify your free port number.
2. Copy your files. Add your files to the `app` directory or create a symbolic link to your project directory. Create a symbolic link: `ln -s {project-directory} app`, use your own path instead of `{project-directory}`. Then restart the server `make restart`.
3. For the next, you can run `make up` to start and `make down` to stop the server.