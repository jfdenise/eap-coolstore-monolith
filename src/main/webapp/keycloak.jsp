%>
String json = "{ \"realm\": \"eap\", \"auth-server-url\": \"https://keycloak-eap.apps.cluster-jzljn.jzljn.sandbox622.opentlc.com/auth/\",\"resource\": \"eap-app\"}";
response.getWriter().write(json);
response.getWriter().flush();
response.getWriter().close();
%>