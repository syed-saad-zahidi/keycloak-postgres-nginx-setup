#!/bin/bash
set -e

export KC_HOSTNAME_URL=https://keycloak-dev.abc.com
export POSTGRES_USER=keycloak
export POSTGRES_DB=keycloak
export POSTGRES_PASSWORD=Password123
export KEYCLOAK_ADMIN_PASSWORD=Password123
export KEYCLOAK_FRONTEND_URL=https://keycloak-dev.abc.com/auth
export KEYCLOAK_ADMIN=admin
export KEYCLOAK_HOSTNAME=keycloak-dev.abc.com

