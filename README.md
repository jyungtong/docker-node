Version
======
- 5.4.1, latest [(Dockerfile)](https://github.com/tuxtong/tuxtong-node/blob/ee41826017f9c85a78de2b35c7d427d9724353ee/Dockerfile)

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
