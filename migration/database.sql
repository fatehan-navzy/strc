CREATE DATABASE `navzy`;

USE `navzy`;

CREATE TABLE IF NOT EXISTS devices (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    client CHAR(36) DEFAULT(UUID()),
    imei BIGINT UNSIGNED NOT NULL,
    space CHAR(36) DEFAULT(UUID()),
    name VARCHAR(256) NOT NULL,
    protocol INTEGER UNSIGNED NOT NULL,
    timezone INTEGER UNSIGNED DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX idx_devices_unique_client ON devices (client);

CREATE UNIQUE INDEX idx_devices_unique_imei ON devices (imei);

CREATE TABLE IF NOT EXISTS packets (
    device_id CHAR(36) NOT NULL,
    packet BLOB NOT NULL,
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_pool_device_received ON packets (device_id, received_at desc);