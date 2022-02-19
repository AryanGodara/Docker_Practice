FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY ./ ./

CMD [ "node", "app.js" ]







#? Building the image :-
# docker build -t favorites-node .
#? Running the container :-
# docker run -d -p 3000:3000 --name favorites --rm favorites-node:latest
    #! This closes as soon as it starts
    #* If we run it without -d (detached mode), we can see the error that caused the crash
    #? It was: MongoNetworkError: failed to connect to server [localhost:27017] on first connect
    # This is because, the MongoDB is running on the host machine, which can't be directly
    # accessed by the container (We'll need to change the syntax first)
    #* We fixed this by changing localhost to host.docker.internal

    #! For the above code to work, we'll need to have MongoDB installed on our computer,
    #* So, to fix that, we'll create another separate container, for MongoDB

#! The MongoDB database is not a part of the container that we've built.
#* It may be a part of the code in app.js, but we haven't added any commands to add it
#* to this container.

#? To build another container for mongoDB, we don't need to write another dockerfile,
#? instead, just follow the steps on 'dockerHub: mongoDB'. Or, follow the following :-

# 1. docker run -d --name mongodb mongo    (-d so that it doesn't jam the terminal)
# 2. Now, we'll alter our nodeJS application code such that we can now connect to the
#    recently created mongo db database
# 3. docker container inspect mongodb       // Here we find the IP address
#    use this IP address, to change the mongoose.connect 's first statement to :-
#? 'mongodb://172.17.0.2:27017/swfavorites',

#? But this is a very tedious way of connecting containers, not to mention that we'll 
#? manually need to update the IP address in our source code if we rerun the mongodb container

#! Unlike volumes, docker doesn't automatically create a new volume, when we use -v option
#* We have to create networks on our own

# 1. docker network create favorites-net   (docker network create network_name)
# 2. docker run -d --name mongodb --network favorites-net mongo (run the container like this)
# 3. 'mongodb://mongodb:27017/swfavorites',   (change to this line in app.js)
# 4. Build the image again, as the code was updated lol
# 5. docker run --name favorites --network favorites-net -d --rm -p 3000:3000 favorites-node

# 6. You can now use POSTMAN to test out the API