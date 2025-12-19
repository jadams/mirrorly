# mirrorly
A parallel replacement for apt-mirror

## Running with Docker
### Building

```
docker build -t mirrorly .
```

### Running with default values
```
mkdir </path/to/mirror>
docker run --rm -v </path/to/mirror>:/mirror mirrorly
```

### Running with custom mirrorly.conf and mirror.list
```
mkdir </path/to/mirror>
docker run --rm -v </path/to/mirror>:/mirror -v </path/to/mirrorly.conf>:/etc/mirrorly.conf -v </path/to/mirror.list>:/etc/apt/mirror.list mirrorly
```

## Running
1. Copy mirrorly.conf to `/etc`
2. Copy mirror.list to `/etc/apt`
3. Run `mirrorly`

## Steps mirrorly runs
### Phase 0
1. Collect repos from mirror.list
### Phase 1
2. Download Packages.gz from mirror
3. Assemble list of sizes/urls/paths and md5sums
4. Check which files are already present on disk
5. Make a list of files that are not present on disk
6. Download needed files via curl+parallel
### Phase 2
7. Download needed things in dist
8. Make a list of files that are not present in Packages.gz
9. Remove unneeded files on disk
