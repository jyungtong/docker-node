Version
======
- 5.4.1, latest [(Dockerfile)](https://github.com/tuxtong/docker-node/blob/master/Dockerfile)

How To Use
=========
```
docker run --rm --name your-node-app -v /your/node/source/app:/opt/app tuxtong/node
```
OR
```
docker run --rm --name your-node-app -v /your/node/source/app:/opt/app tuxtong/node node index.js
```

Note
====
1. The entry default starting:
```
npm start
```
2. The default working directory:
```
/opt/app
```
