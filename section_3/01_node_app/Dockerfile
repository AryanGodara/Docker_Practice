FROM node:14
    #? Use node: 14 as the base image

ARG DEFAULT_PORT = 80
    #? Unlike ENV, the above variable is only available inside the Dockerfile and can't
    #? be used anywhere else, like server.js
    #! You can't use it indie CMD [] either, as that's a runtime command, not a part of
    #! the image building process, but we can use it for all other commands.

    #* These are used when building the 'image', unlike environment variables, which are 
    #* used when running a 'container'. To use these, we type :-
    # docker build -t feedback-node:dev --build-arge DEFAULT_PORT=8000 .

    #! Be careful where you write these things, as these lines add 'layers' to your image
    #! and if you make any changes here, all subsequent commands are re-executed, which
    #! causes wastage of time and resources. (so, you may want to place these near the 
    #! bottom of the Dockerfile)


WORKDIR /app/
    #? Set the ./app/ directory as the working directory

COPY package.json ./
    #* We could also copy TO: ./app, but that is already understood

RUN npm install
    #? Run this command first

COPY ./ ./
    #? Copy all the data from the current directory to the container's working directory

ENV PORT 80
    #? Defined an environment variable, and provided it with a default value
#* docker run -p 3000:8000 -d --env PORT=8000 --name feedback-app --rm -v feedback:/app/feedback -v "C:/Users/Administrator/Desktop/Docker_Related/section_3/01_node_app:/app:ro" -v /app/node_modules feedback-node:volumes
    # Added --env PORT=8000         ; -e KEY1=value1 -e KEY2=value2 (To add multiple)
    #? We've changed the port that the application listens to from 80 to 3000
    #? This way, we don't need to rebuild our image everytime we want to change the port

    #? If instead, we use the .env file to define ENV variables, we can type :-
    # --env-file ./.env         (Add the relative path to the file)


EXPOSE $DEFAULT_PORT
# EXPOSE PORT
    #?This application listens on port 80 (Last line of server.js)
    # Syntax for adding environment variable :  $var_name

# VOLUME [ "/app/node_modules" ]
    # VOLUME [ "/app/feedback" ]
    #! This was an example of anonymous volumes, we could only specify the directory inside
    #! the container, but we don't know where the data is being stored on our host machine.
    #* Now, we'd like to work with 'named' volumes, by we can't define them inside Dockerfile
    #TODO: Instead, we have to create a named volume, when we run a container :-
    #? docker run -p 3000:80 -d --name feedback-app --rm -v feedback:/app/feedback feedback-node:volumes
    # Notice that we've added an extra '-v' option, followed by directory1:directory2
    # directory1 is where we want to store data on our host machine
    # directory2 is inside the container that we're about to create and start (run)


    #? A 'Bind Mount' can't be attached from inside a Dockerfile, because it's specific to a
    #? container you run, not to the image. So, it doesn't affect the image, it just affects
    #? the container.
    #* So, we have to set up the bind mount from inside the terminal when we run container

    #? docker run -p 3000:80 -d --name feedback-app --rm -v feedback:/app/feedback -v "C:\Users\Administrator\Desktop\Docker_Related\section_\01_node_app:/app" feedback-node:volumes
    #* You'll notice that we've added a 'second' -v option after our 'named volume'
    # Now, unlike the case for named volume, this time directory1 is the path to the folder
    # on our host machine where I have all the code, and all the content, that should go into
    # the mapped folder (directory2).
    #! This path should be absolute, not relative
    #* In this case, we've added the absolute path of the 'parent folder' of the project
    #? Now, we can also bind individual files to this path, if we don't want to share all
    #! Make sure to write the "directory1:directory2" in quotes to avoid errors


    # CMD [ "node", "server.js" ]
    #? The command we want to execute when the container is started
    
CMD [ "npm", "start" ]
    #? We use this 'script' instead, which watches for real-time changes in the server.js


#TODO: After this is done, go to the '01_node_app' directory inside any terminal (outside or
#TODO: the one below in vscode), and type the following command :
#? 1. docker build -t feedback-node .
    # feedback-node is the name we have chosen for this particular image, to make it easier
    # to identify and use this image, instead of copying its ID everytime

#TODO: Then, we have to run this image, using a container, for that, type :
#? 2. docker run -p 3000:80 -d --name feedback-app --rm feedback-node
#? OR docker run -p 3000:80 -d --name feedback-app --rm feedback-node:volumes
    # -p 3000:80 to expose the port 80 of container, and attach it to port 3000 of the host
    # machine, so that we can connect to the localhost:3000
    
    # -d option is used to open the container in detached mode, so that we can continue to
    # interact with our terminal, even when the container is running
    #? docker start: default mode is detached
    #? docker run: default mode is attached

    # --name feedback-app : this option (--name) is used to give a name to our container,
    # which makes it easier to remember and use the container again.

    # --rm : this option will remove/delete this container, once we stop it. This helps in
    # reducing clutter and confusion which can arise from having a lot of containers lying
    # around, and not knowing what to do with them.

#? 3. After this, if you remove --rm, then you can stop and start the container whenever
#?    you want, and it will not be deleted automatically.
#* Just use: docker start feedback-app , and docker stop feedback-app




#? The Final command for running the container, when using volumes and bind mounts :-
# docker run -p 3000:80 -d --name feedback-app --rm -v feedback:/app/feedback -v "C:\Users\Administrator\Desktop\Docker_Related\section_3\01_node_app:/app" -v app/node_modules feedback-node:volumes
    #? The -v /app/node_modules is an anonymous volume, and the third and final volume that
    #? we add to the run statement.

    #TODO: Since this is anonymous, we could also, instead write here in the Dockerfile:
    # Volume ["/app/node_moodules"]
        #* But this way, we'd have to rebuild the image, so we went with the above option


# docker run -p 3000:80 -d --name feedback-app --rm -v feedback:/app/feedback -v "C:/Users/Administrator/Desktop/Docker_Related/section_3/01_node_app:/app:ro" -v /app/node_modules feedback-node:volumes
    #? To make volume, read only (container, can't make changes to files on host system)