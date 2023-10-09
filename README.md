TODO: Badge usegalaxy.eu ilastik

# Docker image for Ilastik - constructed for the use as Galaxy IT

[Ilastik](https://www.ilastik.org/) is now available in [Galaxy](https://usegalaxy.eu/root?tool_id=interactive_tool_ilastik).

### Run the image

You can start the container outside of Galaxy with:

```bash
docker run -i -t --rm -v input_dir:/config/input_dir -p 5800:5800 TODO bash
```

Once you are in the container you can start the application with:

```bash
ilastik
```

### Galaxy integration

Galaxy can run arbitrary Virtual Research Environments (VREs). In Galaxy terms, such VRE's are called "Interactive Tools", as they are using the same subsystem then normal Galaxy tools.
The only requirement is that those tools needs to run in containers and expose a port(s) to which Galaxy can redirect users. The Docker image for Ilastik you can find in this repository.
The Galaxy tool defintion for the Ilastik Interactive tool can be found [here](TODO).
