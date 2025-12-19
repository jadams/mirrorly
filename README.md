# mirrorly
A parallel replacement for apt-mirror

## Steps
1. Collect repos from mirror.list
2. Download Packages.gz from mirror
3. Assemble list of sizes/urls/paths and md5sums
4. Check which files are already present on disk
5. Make a list of files that are not present on disk
6. Make a list of files that are not present in Packages.gz
7. Download needed files via curl+parallel
8. Download needed things in dist
9. Remove unneeded files on disk
