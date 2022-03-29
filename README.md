These are the files you need in a new directory, which should be named your project, when setting up a new project.

Copy these files there. Remember, the .env file has your username and password for Postgresql.

Then run:

`docker-compose run --no-deps web rails new . --force --database=postgresql`

This will set up your new Rails app.

If you are running Docker on Linux, the files rails new created are owned by root. This happens because the container runs as the root user. If this is the case, change the ownership of the new files. Not on Mac or Windows!

`sudo chown -R $USER:$USER .`

Correct your database.yml!

Then run:

`docker compose build`

`docker compose run --rm web bin/rails db:setup`

You'll probably need a db:migrate. To run you server just

`docker compose up`

In another window I run:

`docker compose exec web /bin/bash`

And I'm in the running app!

I needed to add libvips-dev for image processing and I kept getting not found. I fixed it by:

`apt-get update`

`apt-get install libvips-dev`