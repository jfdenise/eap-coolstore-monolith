# CoolStore Monolith

This repository has the complete coolstore monolith built as a Java EE 7 application. To deploy it on OpenShift follow the instructions below

## Pre requisite

* OpenShift 4.12 with cluster admin access

## Deploy RH SSO

Install RH SSO operator and deploy RH SSO instance with sso-instance.yml, then sso-realm.yml, sso-client.yml, and sso-user.yml

Update keycloak.json

## Deploy postgreSQL database

Deploy postgres with following fields

DATABASE: "postgresDB"
NAME: "postgresql"
USERNAME: "postgresDB"
PASSWORD: "postgresPW"

## Active MQ broker

Install "Red Hat Integration - AMQ Broker for RHEL 8"

Creake Broker instance using amq-deploy.yml

## Deploy application

Create config map from cm.yaml

Deploy EA74 helm chart with helm.yml

cat /opt/eap/standalone/configuration/standalone-openshift.xml