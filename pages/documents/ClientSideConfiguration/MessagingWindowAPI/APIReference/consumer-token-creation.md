---
pagename: Consumer Token Creation
redirect_from:
  - common-consumer-token-creation.html
sitesection: Documents
categoryname: "Client Side Configuration"
documentname: Messaging Window API
subfoldername: API Reference
permalink: messaging-window-api-api-reference-consumer-token-creation.html
order: 210
indicator: messaging
---

### Unauthenticated Consumer Token

```sh
LP_JWT=`curl -X POST http://$LP_IDP/api/account/$LP_ACCOUNT/signup | jq -r .jwt`
```

### Authenticated Consumer Token

```sh
LP_AUTH_JWT=`curl -X POST -H "Content-Type: application/json" -d '{"authCode" : "'$LP_EXT_JWT'"}' http://$LP_IDP/api/account/$LP_ACCOUNT/authenticate | jq -r .jwt`
```

Where `LP_EXT_JWT` is a JWT (in case of implicit flow) or code (in case of code flow) issued by the customer services.

### Brand Consumer Backend Token

TBD