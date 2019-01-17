# docker-steam

A Docker container for running Steam. This container links the container's X socket located at /tmp/.X11-unix to the host's X socket, allowing the Steam GUI to work.


## Building

```
docker build -t steam .
```

## Running

To run it, execute the steam script under this folder. 
