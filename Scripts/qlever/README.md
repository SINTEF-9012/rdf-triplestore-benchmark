To configure the Memory for QLever, use these two enviroment variables: MEMORY_FOR_QUERIES, CACHE_MAX_SIZE_GB for `docker run`:

```
sudo docker run --name qlever -p 7001:7001 -v "/data/qlever/index:/index" -e INDEX_PREFIX=$DATASET_NAME -e MEMORY_FOR_QUERIES=200 -e CACHE_MAX_SIZE_GB=200  qlever
```