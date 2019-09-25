# simpleserver

A very simple server indeed.


## Build locally
`docker build --build-arg PORT=${PORT} -t davekaufman:simpleserver https://github.com/davekaufman/simpleserver.git`

## Run
`docker run -p $PORT:$PORT -e PORT=$PORT -d davekaufman:simpleserver`


## Query
returns a `200` for `/health` along with a json body of

```json
{"status": "ok"}
```

`POST`s return a `403 Forbidden`
