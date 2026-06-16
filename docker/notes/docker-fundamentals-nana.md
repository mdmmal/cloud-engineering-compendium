# Guided Notes: Docker Tutorial for Beginners (TechWorld with Nana)

Source: https://www.youtube.com/watch?v=3c-iBn73dDE  |  Phase: Week 1, Docker fundamentals + Wize backend  |  Date: 2026-06-15

Watched the concepts, commands, and Dockerfile sections. Skipped registry, cloud, Compose, and volumes (later weeks). Did a follow-along lab on Nana's demo app in a throwaway folder.

## What to watch for (guiding questions)

**Containers vs VMs: what does a container share with the host that a VM does not, and why does that make it lighter and faster?**
Containers share the host OS kernel. Docker virtualizes only the application layer, not a whole operating system, so it uses less storage and starts faster. You only download the application image, not a full OS. It is the difference between MB and GB.

**Image vs container (gate question):**
An image is a static version of everything an application needs to run. The process of that image actually running the application is called a container.

**Core command set:**
- `pull` - downloads the image locally
- `run` - runs the image as a container
- `ps` - lists the containers currently running
- `stop` - stops the container
- `logs` - troubleshooting, shows all the logs that container produced as it ran
- `exec` - executes a command inside the container, makes it interactable

**Port binding: what does `-p 8080:3000` mean? Which is host, which is container?**
The host is the first number (8080), the container port is the second (3000).
>> FIX (you): your second sentence said "whenever 8080 is used the container will listen for that port at 3000." That is backwards. The app inside is ALWAYS listening on 3000. `-p` just wires the host's 8080 door to that already-open container door. Reword it to say which port the app actually listens on vs which one is the outside doorknob.

**Dockerfile instructions:**
- `FROM` - the base image
- `WORKDIR` - sets the working directory
- `COPY` - copy the package list first
- `RUN` - install dependencies
- `COPY` - then copy the actual app code
- `EXPOSE` - document the port to listen on
- `CMD` - start the app

**FROM and base images: what is actually inside node:20? Only Node, or an OS underneath?**
>> TODO (you): you answered this with your own eyes tonight. You ran `docker run -it my-app:1.0 sh`, got a shell, and `ls`'d a full Linux filesystem. So write the real answer: a base image is not "just Node," it is a minimal Linux (Alpine here) with Node installed on top. That is why sh, ls, and npm all worked inside it.

**RUN vs CMD: which runs at build, which at container start?**
`RUN` runs while the image is being built. `CMD` runs when the container starts.

**Layers and caching: why does instruction order change rebuild speed?**
Because the image is built in layers. You want the dependencies established before the code. You are setting up the environment before you hand out a canvas to draw on.
>> TODO (you): good intuition, but add the actual mechanism you SAW tonight. Your first build took 9.7s. The rebuild with no changes took 1.4s and every step said `CACHED`. Write why: Docker caches each layer and reuses it when that layer's inputs have not changed, so it skips the work. That is the real reason order matters.

## Core concepts

- A way to package an application with everything it needs inside the package. Portable, easily shared and moved around, makes development more efficient.
- Setting up a new environment used to be tedious. Containers solve that. You do not install services directly on your OS.
- A container is packaged with all needed configurations. One command to start the app, and starting the container is universally the same across machines.
>> FIX (you): in your raw notes you wrote a container "is its own operating system isolated." That contradicts your VM-vs-container answer above, where you correctly said containers SHARE the host kernel. A container is NOT a full OS. Delete or reword that line so your notes do not contradict themselves.
- Application deployment: developers and operations work together to package the app. No environment configuration needed on the server except the Docker runtime.
- A container image is layers stacked up. The base is mostly Linux, with the application image on top.
- Container storage lives in a container repository (registry).
- Image = the static, moveable artifact. Container = the image actually started and running.
- Docker virtualizes the application layer, makes it portable, and uses the kernel of the host.
- A container has a port bound to it. Multiple containers can run on one host machine. You get a conflict when two map to the same host port. Example: localhost:3001

## Commands / syntax
- `docker ps` - see all running containers
- `docker run` - start a new container with a command
- `docker stop` - stop a container
- `docker start` - start a stopped container
- `docker ps -a` - list running and stopped containers
- `docker pull` - download an image
- `docker run` - pulls the image and starts the container (two commands in one)
- `docker run -p <host>:<container>` - port mapping
- `docker run -d` - run detached
- `docker images` - all images stored locally
- `docker rm $(docker ps -aq)` - remove all containers at once

Troubleshooting:
- `docker logs <id>` - read what the app printed; first move when a container misbehaves
- `docker run -d -p <host>:<container> --name <name> <image>` - run detached, mapped, and named
- `docker exec -it <id> sh` - open an interactive shell inside a RUNNING container. Like SSH-ing into a remote server to look around and debug from the inside.

## The gotcha(s)
>> TODO (you): this is your strongest material from tonight and it is blank. You hit four real walls. Write one line on each, what broke and the one move that found it:
- The empty 153-byte build context:
- The frozen image (editing files did nothing without a rebuild):
- The missing `npm install` (package.json is a shopping list, nobody went shopping):
- The connection reset on curl (container healthy per logs, app reaches for a Mongo that is not there):

## How this applies to Wize
>> TODO (you):
- Your base image has to satisfy:
- The instructions your backend Dockerfile will likely need, in order:
- One thing you can already see will be different for Wize than for Nana's tiny demo app:

## Explain-it-back (self-check, no notes)
Q: What is a Docker image, what is a container, and what is the relationship?
A: A Docker image is a static artifact that includes everything an app needs to run: config files, dependencies, code, the whole application layer. A container is the running process of an image, your application actually running.

## The Dockerfile I wrote (Nana's demo app)
- `FROM node:13-alpine` - declares the base image (Node on Alpine Linux)
- `ENV` - set MONGO_DB_USERNAME=admin and MONGO_DB_PWD=password
- `WORKDIR /home/app` - sets the working directory inside the container
- `COPY . /home/app` - copy the build-context files into the container
- `RUN npm install` - reads package.json and installs dependencies (express, etc.)
- `CMD ["node", "/home/app/server.js"]` - the entry-point command that runs the server

Notes to self:
- `COPY` only copies what is in the build context. An empty folder builds an empty image.
- The image is frozen at build time. Edit files -> `docker build` -> `docker run`, every time.
- `npm install` needs package.json present first, so COPY has to come before RUN install.
- You can have multiple `RUN` commands but only one `CMD`.
- Node is preinstalled because of the base image, so `node` works without installing it.

## Commit + post
- Commit: `devops: notes — docker fundamentals (Nana)` at `devops/notes/docker-fundamentals-nana.md`
- Post seed (the one insight worth saying out loud):
>> TODO (you): one line. The honest version: you set out to containerize a simple app and got beaten by an empty build context, a frozen image, and a missing npm install before it ran. No em dashes, no Oxford commas, lead with the struggle.
