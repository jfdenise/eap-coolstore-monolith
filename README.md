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

Wait for RH Operator to be deployed.

`oc apply -f sso-instance.yml`

## Configure RH SSO

`oc apply -f sso-config.yml`


Run `oc get route keycloak` and update KEYCLOAK_URL value in cm.yaml with correct route for SSO, may take a few attempts for route to be created.


## Deploy postgreSQL database

`oc apply -f psql.yml`

## Install Active MQ broker operator

`oc apply -f amq-broker-operator.yml`

## Create and configure Active MQ broker instance

Wait for AMQ operator to be running.

`oc apply -f amq-deploy.yml`

`oc apply -f amq-topic.yml`

## Deploy application

Create config map from cm.yaml

`oc apply -f cm.yaml`

From the developer UI, click on "+Add", then "Helm Chart", and select the "Eap74" Helm chart.


Paste the contents of "helm.yml" as the config.

## Testing the application

Once the application is running you should be able to access it via the external route. From the application, click on "Sign in" link at the top right hand corner.  You should be brought to the RH SSO login, login as user1/pass

You should now be able to add products to your cart and complete the checkout process.

