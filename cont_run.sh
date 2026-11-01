MSYS_NO_PATHCONV=1 docker run \
  --name parcel-service \
  --mount source=db_data,target=/app/tracker.db,volume-subpath=tracker.db \
  anders768/parcel-service-repo:v1