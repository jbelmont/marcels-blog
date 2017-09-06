+++
date = 2017-09-06T14:41:25-04:00
draft = false
tags = ["SSO", "SAML", "Oauth", "JWT"]
title = "Single Sign-On concepts explained through Oauth, Saml and Json Web Tokens"
math = true
summary = """

"""

+++

# Authentication, Authorization, Oauth, SAML

* [Basic Authentication with HTTP](#basic-authentication-with-http)
* [Digest Schemes](#digest-schemes)
* [Single Sign-On with Oauth and SAML](#single-sign\-on-with-oauth-and-saml)
* [Oauth](#oauth)
* [Security Assertion Markup Language](#security-assertion-markup-language)
* [Repo Details](#repo-details)

## Basic Authentication with HTTP

> "HTTP/1.0", includes the specification for a Basic Access
Authentication scheme. This scheme is not considered to be a secure
method of user authentication (unless used in conjunction with some
external secure system such as SSL [5]), as the user name and
password are passed over the network as cleartext.

[Basic Authentication RFC2617](https://tools.ietf.org/html/rfc2617)

If an HTTP receives an anonymous request for a protected resource it can force the use of Basic authentication by rejecting the request with a 401 (Access Denied) status code and setting the WWW-Authenticate response header as shown below:

```HTTP
HTTP/1.1 401 Access Denied
WWW-Authenticate: Basic realm="My Server"
Content-Length: 0
```

### Basic Authentication - The client sends the user name and password as unencrypted base64 encoded text.
**Basic Authenthication should only be used with HTTPS, as the password can be easily captured and reused over HTTP.**

#### Example of Basic Auth using CURL with neither Authorization header set nor username and password set in url

```HTTP
curl -k -X GET "https://localhost:3000/api/v1/basicAuth"
```

returns the header
```HTTP
WWW-Authenticate →Basic realm="need login credendtials"
```
The HTTP Status Code of `401` meaning unauthorized

Using Basic Auth in url with Curl Command
```HTTP
curl -k -X GET "https://rambo:soldier@localhost:3000/api/v1/basicAuth"
```

returns following response
```json
{
  "credentials": {
    "username": "rambo",
    "password": "soldier"
  }
}
```

##### Providing the following username and password credentials
Username: `rambo`
Password: `soldier`

Using Chrome Developer Tools JavaScript Console:

 `window.btoa("rambo" + ":" + "soldier")` returns base64 encoded string `cmFtYm86c29sZGllcg==`

 Using Node.js Buffer toString Method in node repl

```node
new Buffer('rambo' + ':' + 'soldier').toString('base64')
```

return base64 encode string `cmFtYm86c29sZGllcg==`

Using Basic Auth with Authorization Header set
```HTTP
curl -k -X GET -H "Authorization: Basic cmFtYm86c29sZGllcg==" "https://localhost:3000/api/v1/basicAuth"
```

returns following response
```json
{
  "credentials": {
    "username": "rambo",
    "password": "soldier"
  }
}
```

In order to parse The Authorization Header in Chrome and return an object
```js
atob('basic cmFtYm86c29sZGllcg=='
  .split(' ')[1])
  .split(':')
  .reduce((prev, curr, idx, arr) =>  {
    prev[curr] = curr;
    return prev;
  }, {});
```

In order to parse the Authorization Header in Nodejs and return an object
```node
const authorization = 'basic cmFtYm86c29sZGllcg=='.split(' ');
const parseString = new Buffer(authorization[1], 'base64').toString();
return parseString.split(':')
  .reduce((prev, curr, idx, arr) =>  {
    prev[curr] = curr;
    return prev;
  }, {});
```

## Digest Schemes
> the Digest scheme is based on a
simple challenge-response paradigm. The Digest scheme challenges
using a nonce value. A valid response contains a checksum (by
default, the MD5 checksum) of the username, the password, the given
nonce value, the HTTP method, and the requested URI. In this way, the
password is never sent in the clear. Just as with the Basic scheme,
the username and password must be prearranged in some fashion not
addressed by this document.

[Digest Schemes RFC2617](https://tools.ietf.org/html/rfc2617)

> The Digest Access Authentication scheme is not intended to be a
complete answer to the need for security in the World Wide Web. This
scheme provides no encryption of message content. The intent is
simply to create an access authentication method that avoids the most
serious flaws of Basic authentication.

[Digest Access Authentication](https://tools.ietf.org/html/rfc2617#page-6)

#### Digest Authentication

> The Digest scheme is based on a simple challenge-response paradigm.
The Digest scheme challenges using a nonce value and might indicate
that username hashing is supported.  A valid response contains an
unkeyed digest of the username, the password, the given nonce value,
the HTTP method, and the requested URI.

Digest access authentication was originally specified by RFC 2069 (An Extension to HTTP: Digest Access Authentication).
RFC 2069 specifies roughly a traditional digest authentication scheme with security maintained by a server-generated noncevalue.
The authentication response is formed as follows (where HA1 and HA2 are names of string variables):

[MD5 Algorithm](https://en.wikipedia.org/wiki/MD5)
**MD5 is an algorithm that produces a hash**

`ha1 = md5(username:realm:password)`
`ha2 = md5(HTTPMethod:digestURI)`
`response = md5(ha1:nonce:ha2)`

```javascript
function md5({ str, encoding = 'hex' }) {
  return crypto
    .createHash('md5')
    .update(str)
    .digest(encoding);
}
```

A custom md5 function that uses `nodejs` crypto library.

Test usage for md5 to compute `ha1`
```javascript
test('mdf5 should compute challenge when given ha2, nonce, cnonce, and qop', assert => {
  const md5 = require('../../utils/md5').md5;
  const ha2 = md5({
    str: 'GET:/api/v1/digestScheme'
  });
  const actual = md5({
    str: `${ha2}:${process.env.NONCE}:${process.env.NONCE}:auth`
  });
  const expected = 'adc91a91ffaa68815d5a5d8e4ed8d9e9';
  assert.is(actual, expected, `should return ${expected}`);
});
```

## The WWW-Authenticate Response Header Field
Set HTTP header like so
```javascript
res.setHeader(
  'WWW-Authenticate',
  `Digest realm="https://localhost:3000/api/v1/digestScheme",
  qop="auth, auth-int", algorithm=MD5,
  nonce="${process.env.NONCE}",
  opaque="${process.env.OPAQUE}"`
);
```

Server Challenge computed as follows
```javascript
function serverResponse({ ha2, nonce, cnonce, qop }) {
  return md5({
    str: `${ha2}:${nonce}:${cnonce}:${qop}`
  });
}
```

Checking client response with server response and if they match return authenticated property
```javascript
if (clientChallenge !== serverChallenge) {
    res.setHeader(
      'WWW-Authenticate',
      `Digest realm="https://localhost:3000/api/v1/digestScheme",
      qop="auth, auth-int", algorithm=MD5,
      nonce="${process.env.NONCE}",
      opaque="${process.env.OPAQUE}"`
    );
    res.send(responseCodes['unauthorized']);
} else {
  res.send(responseCodes['ok'], {
    authenticated: true
  });
}
```

## Single Sign-On with Oauth and SAML

### SSO

SSO (Single Sign On) occurs when a user logs in to one Client and is then signed in to other Clients automatically, regardless of the platform, technology, or domain the user is using.

Single sign-on (SSO) is a session and user authentication service that permits a user to use one set of login credentials (e.g., name and password) to access multiple applications.
The service authenticates the end user for all the applications the user has been given rights to and eliminates further prompts when the user switches applications during the same session.

[SSO](https://www.sitepoint.com/single-sign-on-explained/)
**A good example of the use of SSO is in Google’s services. You need only be signed in to one primary Google account to access different services like YouTube, Gmail, Google+, Google Analytics, and more.**

## Oauth

> OAuth is an open standard for authorization, commonly used as a way for Internet users to authorize websites or applications to access their information on other websites but without giving them the passwords.

### RFC 6749 OAuth 2.0 Authorization Framework

[OAuth](https://tools.ietf.org/html/rfc6749)

### Roles

1. The Third-Party Application: "Client"
    1. The client is the application that is attempting to get access to the user's account. It needs to get permission from the user before it can do so.
2. The API: "Resource Server"
    1. The resource server is the API server used to access the user's information.
3. The Authorization Server
    1. This is the server that presents the interface where the user approves or denies the request. In smaller implementations, this may be the same server as the API server, but larger scale deployments will often build this as a separate component.
4. The User: "Resource Owner"
    1. The resource owner is the person who is giving access to some portion of their account.

### Creating an application for OAuth

When registering a new app, you usually register basic information such as application name, website, a logo, etc.
In addition, you must register a redirect URI to be used for redirecting users to for web server, browser-based, or mobile apps.

#### Redirect URIs

Any HTTP redirect URIs must be protected with TLS security, so the service will only redirect to URIs beginning with "https".
This prevents tokens from being intercepted during the authorization process.

*Remember that HTTP is a clear text protocol*
*Someone can easily sniff packets with tools like Wireshark and see passwords, etc.*

#### Client ID and Secret

Upon registering your app, you will receive a client id and secret

1. The client ID is considered public information, and is used to build login URLs, or included in Javascript source code on a page.
2. The client secret must be kept confidential.
    1. If a deployed app cannot keep the secret confidential, such as single-page Javascript apps or native apps, then the secret is not used, and ideally the service shouldn't issue a secret to these types of apps in the first place.

### Authorization

OAuth 2 provides several "grant types" for different use cases. The grant types defined are:

1. Authorization Code for apps running on a web server, browser-based and mobile apps.
2. Password for logging in with a username and password
3. Client credentials for application access
4. Implicit was previously recommended for clients without a secret, but has been superceded by using the Authorization Code grant with no secret.

### Token Exchange

Client Request

`https://oauth2server.com/auth?response_type=code&client_id=CLIENT_ID&redirect_uri=REDIRECT_URI&scope=photos&state=1234zyx`

```http
POST https://api.oauth2server.com/token
  grant_type=authorization_code
  &code=AUTH_CODE_HERE
  &redirect_uri=REDIRECT_URI
  &client_id=CLIENT_ID
  &client_secret=CLIENT_SECRET
```

*Remember the ampersand (&) is a query string separator which are appended to urls*

Break down of the query

1. `grant_type=authorization_code` - The grant type for this flow is authorization_code
2. `code=AUTH_CODE_HERE` - This is the code you received in the query string
3. `redirect_uri=REDIRECT_URI` - Must be identical to the redirect URI provided in the original link
4. `client_id=CLIENT_ID` - The client ID you received when you first created the application
5. `client_secret=CLIENT_SECRET` - Since this request is made from server-side code, the secret is included

Server responds with this possible 200 response

```json
{
  "access_token": "RsT5OjbzRn430zqMLgV3Ia",
  "expires_in": 3600
}
```

Or this possible 500 level HTTP Error response

```json
{
  "error": "invalid_request"
}
```

#### Single-Page Apps

GET request from client `https://oauth2server.com/auth?response_type=code&client_id=CLIENT_ID&redirect_uri=REDIRECT_URI&scope=photos&state=1234zyx`

Newer query string parameters

1. scope - One or more scope values indicating which parts of the user's account you wish to access
2. state - A random string generated by your application, which you'll verify later

## Other Grant Types

OAuth 2 also provides a "password" grant type which can be used to exchange a username and password for an access token directly.
Since this obviously requires the application to collect the user's password, it must only be used by apps created by the service itself.

```http
POST https://api.oauth2server.com/token
  grant_type=password&
  username=USERNAME&
  password=PASSWORD&
  client_id=CLIENT_ID
```

1. `grant_type=password` - The grant type for this flow is password
2. `username=USERNAME` - The user's username as collected by the application
3. `password=PASSWORD` - The user's password as collected by the application
4. `client_id=CLIENT_ID` - The client ID you received when you first created the application

Sample Curl Request with bearer token
```bash
curl -H "Authorization: Bearer RsT5OjbzRn430zqMLgV3Ia" \
https://api.oauth2server.com/1/me
```

## Security Assertion Markup Language
> Security Assertion Markup Language (SAML, pronounced sam-el) is an XML-based,
open-standard data format for exchanging authentication and authorization data between parties,
in particular, between an identity provider and a service provider.

[SAML](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language)

SAML is an XML-based framework that allows identity and security information to be shared across security domains.

The Assertion, an XML security token, is a fundamental construct of SAML that is often adopted for use in other protocols and specifications.

#### SAML

[RFC 7522](https://tools.ietf.org/html/rfc7522)

* SAML is a standard for logging users into applications based on their sessions in another context.
* This single sign-on (SSO) login standard has significant advantages over logging in using a username/password:
  1. No need to type in credentials
  2. No need to remember and renew passwords
  3. No weak passwords

* SAML SSO works by transferring the user’s identity from one place (the identity provider) to another (the service provider)
* This is done through an exchange of digitally signed XML documents.

Here is an example that contains contains an authorization request.
An Authorization Request is sent by the Service Provider to the Identity Provider.

```xml
<samlp:AuthnRequest xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol" xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion" ID="pfx41d8ef22-e612-8c50-9960-1b16f15741b3" Version="2.0" ProviderName="SP test" IssueInstant="2014-07-16T23:52:45Z" Destination="http://idp.example.com/SSOService.php" ProtocolBinding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST" AssertionConsumerServiceURL="http://sp.example.com/demo1/index.php?acs">
  <saml:Issuer>http://sp.example.com/demo1/metadata.php</saml:Issuer>
  <ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
    <ds:SignedInfo>
      <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
      <ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
      <ds:Reference URI="#pfx41d8ef22-e612-8c50-9960-1b16f15741b3">
        <ds:Transforms>
          <ds:Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
          <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
        </ds:Transforms>
        <ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
        <ds:DigestValue>yJN6cXUwQxTmMEsPesBP2NkqYFI=</ds:DigestValue>
      </ds:Reference>
    </ds:SignedInfo>
    <ds:SignatureValue>g5eM9yPnKsmmE/Kh2qS7nfK8HoF6yHrAdNQxh70kh8pRI4KaNbYNOL9sF8F57Yd+jO6iNga8nnbwhbATKGXIZOJJSugXGAMRyZsj/rqngwTJk5KmujbqouR1SLFsbo7Iuwze933EgefBbAE4JRI7V2aD9YgmB3socPqAi2Qf97E=</ds:SignatureValue>
    <ds:KeyInfo>
      <ds:X509Data>
        <ds:X509Certificate>MIICajCCAdOgAwIBAgIBADANBgkqhkiG9w0BAQQFADBSMQswCQYDVQQGEwJ1czETMBEGA1UECAwKQ2FsaWZvcm5pYTEVMBMGA1UECgwMT25lbG9naW4gSW5jMRcwFQYDVQQDDA5zcC5leGFtcGxlLmNvbTAeFw0xNDA3MTcwMDI5MjdaFw0xNTA3MTcwMDI5MjdaMFIxCzAJBgNVBAYTAnVzMRMwEQYDVQQIDApDYWxpZm9ybmlhMRUwEwYDVQQKDAxPbmVsb2dpbiBJbmMxFzAVBgNVBAMMDnNwLmV4YW1wbGUuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC7vU/6R/OBA6BKsZH4L2bIQ2cqBO7/aMfPjUPJPSn59d/f0aRqSC58YYrPuQODydUABiCknOn9yV0fEYm4bNvfjroTEd8bDlqo5oAXAUAI8XHPppJNz7pxbhZW0u35q45PJzGM9nCv9bglDQYJLby1ZUdHsSiDIpMbGgf/ZrxqawIDAQABo1AwTjAdBgNVHQ4EFgQU3s2NEpYx7wH6bq7xJFKa46jBDf4wHwYDVR0jBBgwFoAU3s2NEpYx7wH6bq7xJFKa46jBDf4wDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQQFAAOBgQCPsNO2FG+zmk5miXEswAs30E14rBJpe/64FBpM1rPzOleexvMgZlr0/smF3P5TWb7H8Fy5kEiByxMjaQmml/nQx6qgVVzdhaTANpIE1ywEzVJlhdvw4hmRuEKYqTaFMLez0sRL79LUeDxPWw7Mj9FkpRYT+kAGiFomHop1nErV6Q==</ds:X509Certificate>
      </ds:X509Data>
    </ds:KeyInfo>
  </ds:Signature>
  <samlp:NameIDPolicy Format="urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress" AllowCreate="true"/>
  <samlp:RequestedAuthnContext Comparison="exact">
    <saml:AuthnContextClassRef>urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport</saml:AuthnContextClassRef>
  </samlp:RequestedAuthnContext>
</samlp:AuthnRequest>
```

Response
```xml
<samlp:Response xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol" xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion" ID="_8e8dc5f69a98cc4c1ff3427e5ce34606fd672f91e6" Version="2.0" IssueInstant="2014-07-17T01:01:48Z" Destination="http://sp.example.com/demo1/index.php?acs" InResponseTo="ONELOGIN_4fee3b046395c4e751011e97f8900b5273d56685">
  <saml:Issuer>http://idp.example.com/metadata.php</saml:Issuer>
  <samlp:Status>
    <samlp:StatusCode Value="urn:oasis:names:tc:SAML:2.0:status:Success"/>
  </samlp:Status>
  <saml:Assertion xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" ID="_d71a3a8e9fcc45c9e9d248ef7049393fc8f04e5f75" Version="2.0" IssueInstant="2014-07-17T01:01:48Z">
    <saml:Issuer>http://idp.example.com/metadata.php</saml:Issuer>
    <saml:Subject>
      <saml:NameID SPNameQualifier="http://sp.example.com/demo1/metadata.php" Format="urn:oasis:names:tc:SAML:2.0:nameid-format:transient">_ce3d2948b4cf20146dee0a0b3dd6f69b6cf86f62d7</saml:NameID>
      <saml:SubjectConfirmation Method="urn:oasis:names:tc:SAML:2.0:cm:bearer">
        <saml:SubjectConfirmationData NotOnOrAfter="2024-01-18T06:21:48Z" Recipient="http://sp.example.com/demo1/index.php?acs" InResponseTo="ONELOGIN_4fee3b046395c4e751011e97f8900b5273d56685"/>
      </saml:SubjectConfirmation>
    </saml:Subject>
    <saml:Conditions NotBefore="2014-07-17T01:01:18Z" NotOnOrAfter="2024-01-18T06:21:48Z">
      <saml:AudienceRestriction>
        <saml:Audience>http://sp.example.com/demo1/metadata.php</saml:Audience>
      </saml:AudienceRestriction>
    </saml:Conditions>
    <saml:AuthnStatement AuthnInstant="2014-07-17T01:01:48Z" SessionNotOnOrAfter="2024-07-17T09:01:48Z" SessionIndex="_be9967abd904ddcae3c0eb4189adbe3f71e327cf93">
      <saml:AuthnContext>
        <saml:AuthnContextClassRef>urn:oasis:names:tc:SAML:2.0:ac:classes:Password</saml:AuthnContextClassRef>
      </saml:AuthnContext>
    </saml:AuthnStatement>
    <saml:AttributeStatement>
      <saml:Attribute Name="uid" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:basic">
        <saml:AttributeValue xsi:type="xs:string">test</saml:AttributeValue>
      </saml:Attribute>
      <saml:Attribute Name="mail" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:basic">
        <saml:AttributeValue xsi:type="xs:string">test@example.com</saml:AttributeValue>
      </saml:Attribute>
      <saml:Attribute Name="eduPersonAffiliation" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:basic">
        <saml:AttributeValue xsi:type="xs:string">users</saml:AttributeValue>
        <saml:AttributeValue xsi:type="xs:string">examplerole1</saml:AttributeValue>
      </saml:Attribute>
    </saml:AttributeStatement>
  </saml:Assertion>
</samlp:Response>
```

There are some libraries that passport-saml uses such as xmlbuilder xmldom, xml-crypto and more to work with saml requests and responses

Essentially the HTTP Request will be like This with a bearer token

```http
GET https://localhost:3000/api/v1/saml

Authorization: 'Bearer {ACCESS_TOKEN}'
```


This is a curl request with a content-type header of application/x-www-form-urlencoded and a grant type in Oauth languagee with client credentials
```bash
curl https://localhost:3000/api/v1/saml
  -d 'grant_type=client_credentials&client_id=TestClient&client_secret=TestSecret'
  -H 'Content-Type: application/x-www-form-urlencoded'
```

## JSON Web Token (JWT)

[JWT](https://tools.ietf.org/html/rfc7519)

**Read the docs at [JWT](https://jwt.io/introduction/) there is a great explanation of JWTs**

Essentially with JWTs there is 3 parts:

* Header
* Body
* Signature

Check out [JWT Debugger](https://jwt.io/#debugger)

* I wrote some small utilities in the [SSO with oAuth and Saml Repo](https://github.com/jbelmont/sso-with-oauth-and-saml) in the utils folder

```js
'use strict';

function base64(str) {
  return new Buffer(JSON.stringify(str))
    .toString('base64')
    .replace(/=/g,'')
    .replace(/\+/g,'-')
    .replace(/\//g,'_');
}

function b64(str) {
  return new Buffer(JSON.stringify(str))
    .toString('base64');
}

exports.base64 = base64;
exports.b64 = b64;
```

This small function does Base 64 encoding

```js
'use strict';

function decodeUnsignedJWT(jwt) {
  const [
    headerB64,
    payloadB64
   ] = jwt.split('.');
  const headerStr = new Buffer(headerB64, 'base64').toString();
  const payloadStr = new Buffer(payloadB64, 'base64').toString();
  return {
    header: JSON.parse(headerStr),
    payload: JSON.parse(payloadStr)
  };
}

function decodeBasicAuth(str) {
  const usernameAndPassword = str.split(' ')[1];
  const parseString = new Buffer(usernameAndPassword, 'base64').toString();
  const [
    username,
    password
  ] = parseString.split(':');
  return {
    username,
    password
  };
}

exports.decodeUnsignedJWT = decodeUnsignedJWT;
exports.decodeBasicAuth = decodeBasicAuth;
```

* `decodeUnsignedJWT` can split a jwt by header and payload
* `decodeBasicAuth` can split a Basic Authorization request

## Repo Details

Please star [SSO with oauth and saml](https://github.com/jbelmont/sso-with-oauth-and-saml) and follow me at [jbelmont](https://github.com/jbelmont) on Github