./sqlite3 tracker_init.db ".read init.sql"

MSYS_NO_PATHCONV=1 docker run --rm \
  -v db_data:/data \
  -v "/$(pwd)/tracker_init.db:/src/tracker.db" \
  alpine cp /src/tracker.db /data/

rm -f tracker_init.db