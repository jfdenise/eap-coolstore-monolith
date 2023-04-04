# CoolStore Monolith

This repository has the complete coolstore monolith built as a Java EE 7 application. To deploy it on OpenShift follow the instructions below

## Pre requisite

* OpenShift 4.12 with cluster admin access
* OpenShift CLI, logged into cluster with cluster admin access

## Create project

`oc new-project eap`

## Deploy RH SSO operator

`oc apply -f sso-operator.yml`

## Deploy RH SSO instance

`oc apply -f sso-instance.yml`

## Configure RH SSO

`oc apply -f sso-config.yml`


Run `oc get route keycloak` and update KEYCLOAK_URL value is cm.yaml with correct route for SSO


## Deploy postgreSQL database

`oc apply -f psql.yml`

## Install Active MQ broker operator

`oc apply -f amq-broker-operator.yml`

## Create and configure Active MQ broker instance

`oc apply -f amq-deploy.yml`

`oc apply -f amq-topic.yml`

## Deploy application

Create config map from cm.yaml

`oc apply -f cm.yaml`

Deploy EA74 helm chart with helm.yml as config

