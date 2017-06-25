---
title: Start Agent Session
Keywords:
level1: Documents
level2: Agent Interactions
level3: Chat Agent API
level4: Methods

order: 10
permalink: agent-start-agent-session.html

indicator: chat
---

### Request

| Method | URL |
| :---- | :----- |
| POST | https://{domain}/api/account/{accountid}/agentSession?v=1&NC=true |

**Request Headers**

| Header | Description |
| :--- | :--- |
| Authorization| Bearer {bearer-from-login} |
| Content-Type | application/json |
| Accept | application/json |

**Request Body**

Request example for JSON: 

 {"loginData": {
            
        }
 }

**Formats**

The body media type must have one of the following formats:

- XML
- JSON

**Body**

For backwards compatibility purposes, you must include the following request body:

```json
{
  "loginData": ""
}
```

### Response

**Elements in the response**

| Name | Description | Type/Value | Notes |
| :---- | :----- | :---- | :--- |
| agentSessionId | The ID of the agent session | string | Found in the @href element|

**Response Codes**

| Code | Response |
| :--- | :--- |
| 200 | OK |

Response example for JSON:

    {
     "agentSessionLocation": {
       "link": {
         "@href": "https://{domain}/api/account/{accountId}/agentSession/{agentSession Id}",
         "@rel": "location"
       }
     }
    }  
