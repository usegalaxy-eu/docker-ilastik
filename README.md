TODO: Badge usegalaxy.eu ilastik

# Docker image for Ilastik - constructed for the use as Galaxy IT

[Ilastik](https://www.ilastik.org/) is now available in [Galaxy](https://usegalaxy.eu/root?tool_id=interactive_tool_ilastik).

### Run the image

You can start the container outside of Galaxy with:

```bash
docker run -i -t --rm -v $PWD:$PWD:rw -e HOME=$PWD -p 5800:5800 TODO
```

This will display Ilastik and you will be able to read and write into your current folder.

More complex Ilastik options can be set by setting up an executable file at `/bin/ilastik_with_args`.

For example:
```bash
echo  "echo \"ilastik --new_project \$HOME/My_Proj.ilp --workflow PixelClassificationWorkflow\" > ilastik_with_args && chmod +x ./ilastik_with_args && cp ilastik_with_args /bin/&& /init" > script.sh

docker run -i -t --rm -v $PWD:$PWD:rw -e HOME=$PWD -w $PWD -p 5800:5800 TODO /bin/sh $PWD/script.sh 
```

### Galaxy integration

Galaxy can run arbitrary Virtual Research Environments (VREs). In Galaxy terms, such VRE's are called "Interactive Tools", as they are using the same subsystem then normal Galaxy tools.
The only requirement is that those tools needs to run in containers and expose a port(s) to which Galaxy can redirect users. The Docker image for Ilastik you can find in this repository.
The Galaxy tool defintion for the Ilastik Interactive tool can be found [here](TODO).
