<%
String json = "{ \"realm\": \"eap\", \"auth-server-url\": " + System.getenv("KEYCLOAK_URL") + ",\"resource\": \"eap-app\"}";
response.getWriter().write(json);
response.getWriter().flush();
response.getWriter().close();
%>