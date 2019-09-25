# simpleserver

A very simple server indeed.


## Build
`docker build --build-arg PORT=${PORT} -t simpleserver .`

## Run
`docker run -p $PORT:$PORT -e PORT=$PORT -d simpleserver`


## Query
returns a 200 for `/health` along with a json response of 

```json
{"status": "ok"}
```

Everything else returns a 403 Forbidden
