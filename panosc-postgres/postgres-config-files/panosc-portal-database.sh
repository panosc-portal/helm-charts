#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating users and databases"


$POSTGRES <<EOSQL
CREATE USER "cloud-provider-kubernetes" WITH CREATEDB PASSWORD '${CLOUD_PROVIDER_K8S_DATABASE_PASSWORD}';
CREATE USER "cloud-service" WITH CREATEDB PASSWORD '${CLOUD_SERVICE_DATABASE_PASSWORD}';
CREATE USER "desktop-service" WITH CREATEDB PASSWORD '${DESKTOP_SERVICE_DATABASE_PASSWORD}';
CREATE DATABASE "cloud-provider-kubernetes" OWNER "cloud-provider-kubernetes";
CREATE DATABASE "cloud-service" OWNER "cloud-service";
CREATE DATABASE "desktop-service" OWNER "desktop-service";
EOSQL

$POSTGRES -d cloud-provider-kubernetes -a -f /tmp/cloud-provider-kubernetes.sql;
$POSTGRES -d cloud-service -a -f /tmp/cloud-service.sql;
$POSTGRES -d desktop-service -a -f /tmp/desktop-service.sql;