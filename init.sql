PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "parcel"
(
    number     integer
        constraint parcel_pk
            primary key autoincrement,
    client     integer      not null,
    status     VARCHAR(128) not null,
    address    VARCHAR(512) not null,
    created_at text         not null
);
INSERT INTO parcel VALUES(1,1,'sent','Саратов, д. Верхние Зори, ул. Козлова, д. 25','2024-02-14T16:39:24Z');
PRAGMA writable_schema=ON;
CREATE TABLE IF NOT EXISTS sqlite_sequence(name,seq);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('parcel',2);
PRAGMA writable_schema=OFF;
COMMIT;
