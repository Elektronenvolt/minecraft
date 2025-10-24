# minecraft
Running a Minecraft Server on a Kubernetes cluster at home.

I use [Podman](https://podman.io/) to build images, setup instructions are [here](https://podman.io/docs/installation).
]
There are two image build files
- [x] Dockerfile: Build image to run a Vanilla Minecraft Server
- [x] Dockerfile-neoforge: If you want to have mod - use the Neoforge server setup and copy it into the image

### Build an image
```
 podman build -t my-registry.azurecr.io/minecraft-server-neo-jei-world-mushroom10-23:1.21.1 -f .\Dockerfile-neoforge-world .
 ```

### Run local
```
podman run --rm -p 25565:25565 my-registry.azurecr.io/minecraft-server:1.21.1
```

### push image to a container registry
I'm using a Azure Container Registry here. 
Login with:
```
az login
az acr login --name my-registry --expose-token --query accessToken -o tsv | podman login my-registry.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password-stdin  

push the image
 podman image push my-registry.azurecr.io/minecraft-server-neo-jei-world-10-23:1.21.1
 ```