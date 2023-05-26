# OAuth 2.0 Code Flow Request Analysis
This page is a quick analysis of the Spring implementation of OAuth 2.0 code flow (RFC6749 Section 4.1) with the minimum application code. The setup consists of the demo-server, the demo-resource, and the demo-client.

The flow starts when a user opens http://localhost:8080/

![alt text](https://github.com/liangdf14/OAuth2Demo/blob/main/images/img.png?raw=true)


# Requests Analysis until login page


### Request
```
Get http://localhost:8080/
```

### Response
```
HTTP/1.1 302 
Set-Cookie: JSESSIONID=3C147383305A6CCA6B39C113FC5D2A12; Path=/; HttpOnly
X-Content-Type-Options: nosniff
X-XSS-Protection: 0
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Pragma: no-cache
Expires: 0
X-Frame-Options: DENY
Location: http://localhost:8080/oauth2/authorization/messaging-client-oidc
Content-Length: 0
```
Why the request is redirected to http://localhost:8080/oauth2/authorization/messaging-client-oidc is because we configure it in SecurityConfig class.
![alt text](https://github.com/liangdf14/OAuth2Demo/blob/main/images/config_redirect.png?raw=true)

### Request
```
Get http://localhost:8080/oauth2/authorization/messaging-client-oidc
```

### Response
```

HTTP/1.1 302 
Set-Cookie: JSESSIONID=3484B5DE964862E7BC2396C5F2CCB1C2; Path=/; HttpOnly
X-Content-Type-Options: nosniff
X-XSS-Protection: 0
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Pragma: no-cache
Expires: 0
X-Frame-Options: DENY
Location: http://localhost:9000/oauth2/authorize?response_type=code&client_id=messaging-client&scope=openid%20profile&state=u3GNYQk48L9hN9JKEsKEZYjOMjf-t5kQkna6cyhUhNQ%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc&nonce=W7JAULSXiHHKSXhm-TMDxQTK2k9rlBBUeZryFDmP5e4
Content-Length: 0
```

The reason why the request is redirected to http://localhost:9000/ is because we configure it in application.yml file.
![alt text](https://github.com/liangdf14/OAuth2Demo/blob/main/images/issuer-uri.png?raw=true)


### Request
```
Get 'http://localhost:9000/oauth2/authorize?response_type=code&client_id=messaging-client&scope=openid%20profile&state=u3GNYQk48L9hN9JKEsKEZYjOMjf-t5kQkna6cyhUhNQ%3D&redirect_uri=http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc&nonce=W7JAULSXiHHKSXhm-TMDxQTK2k9rlBBUeZryFDmP5e4'
```

### Response
```
HTTP/1.1 302 
Set-Cookie: JSESSIONID=A0CC5465900D6688473DABA94E7E1D5F; Path=/; HttpOnly
X-Content-Type-Options: nosniff
X-XSS-Protection: 0
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Pragma: no-cache
Expires: 0
X-Frame-Options: DENY
Location: http://localhost:9000/login
Content-Length: 0
```

As the request of http://localhost:9000/oauth2/authorize is protected in the demo-server, it will show the http://localhost:9000/login the login page.

![alt text](https://github.com/liangdf14/OAuth2Demo/blob/main/images/login.png?raw=true)
Enter username and password: demo / password, and "Sign in".










# References:
https://datatracker.ietf.org/doc/html/rfc6749#section-4.1

https://docs.spring.io/spring-security/site/docs/5.0.x/reference/html/security-filter-chain.html

https://blog.ndpar.com/2016/12/24/spring-oauth2/

https://docs.spring.io/spring-security/reference/servlet/architecture.html

https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#web.security.oauth2
