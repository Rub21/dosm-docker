# dosm-docker

Download OSM files according to polygon fearture.

Dependency!

- https://github.com/Rub21/dosm


### Buildings de container

`docker build -t dosm .`


### Download OSM data

Make sure the `ayac.geojson` file is in the same directory where you are running the comand.

```
docker run --rm -v ${PWD}:/app dosm dosm -d ayac.geojson  --api=xapi --zoom=18
```

### Clip the osm file

- Creating a poly file
![geojson -> poly using qgis]https://cloud.githubusercontent.com/assets/1152236/7383718/e99548fc-ede9-11e4-8cd4-e57bc6c62124.png


- Clip the file `output.osm` file

```
docker run --rm -v ${PWD}:/app dosm osmconvert output.osm -B=ayac.poly --complete-ways -o=cliped.osm
```