CREATE TABLE func (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    name       VARCHAR(255) NOT NULL,
    UNIQUE(name)
);
CREATE TABLE job (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    func_id         INTEGER UNSIGNED NOT NULL,
    arg             MEDIUMBLOB,
    uniqkey         VARCHAR(255) NULL,
    enqueue_time    INTEGER UNSIGNED,
    grabbed_until   INTEGER UNSIGNED NOT NULL,
    run_after       INTEGER UNSIGNED NOT NULL DEFAULT 0,
    retry_cnt       INTEGER UNSIGNED NOT NULL DEFAULT 0,
    priority        INTEGER UNSIGNED NOT NULL DEFAULT 0,
    UNIQUE(func_id,uniqkey)
);
CREATE TABLE exception_log (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    func_id         INTEGER UNSIGNED NOT NULL DEFAULT 0,
    exception_time  INTEGER UNSIGNED NOT NULL,
    message         MEDIUMBLOB NOT NULL,
    uniqkey         VARCHAR(255) NULL,
    arg             MEDIUMBLOB,
    retried         TINYINT(1) NOT NULL DEFAULT 0
);
CREATE TABLE job_status (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    func_id         INTEGER UNSIGNED NOT NULL DEFAULT 0,
    arg             MEDIUMBLOB,
    uniqkey         VARCHAR(255) NULL,
    status          VARCHAR(10),
    job_start_time  INTEGER UNSIGNED NOT NULL,
    job_end_time    INTEGER UNSIGNED NOT NULL
);

