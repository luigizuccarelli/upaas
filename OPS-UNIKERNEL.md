# Overview

## What is a unikernel

## What is ops

## Usage

### Compile and build your microservice ELF binary

```
make build
```

### Build a unikernel image

```
ops build -c config.json build/microservice -i message-producer 
```

### List the unikernel images

```
ops images list
```

### Create an instance of this image

```
ops instance create -i producer message-producer -p 9000 
```

### List instances

```
ops instance list
```

### Create redis instance

```
ops instance create -i redis-q redis-server -p 6379
```
