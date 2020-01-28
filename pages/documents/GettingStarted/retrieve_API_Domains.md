---
pagename: Domain API
redirect_from:
  - agent-domain-domain-api.html
  - retrieve-api-domains-using-the-domain-api.html
Keywords:
sitesection: Documents
categoryname: "Getting Started"
documentname: Common Resources
permalink: common-resources-domain-api.html
root-link: true
indicator:
---
<br>
A read-only API that returns the base domain of LivePerson and used in the LivePerson APIs.

### Domain Retrieval Tool

Instead of using the API below yourself, you can use a simple tool that we built to retrieve **all** service names and their respective base URIs. This is useful if you need those URIs for a static project or as a point of reference. You might still want to review the Domain API itself in order to incorporate retrieving your base URIs dynamically, as part of your code.

To use the tool, simply input your account number below and hit the button!

<input type="text" id="account" placeholder="Type your account number here">
<input type="button" id="csds-button" value="Get Base URIs">
<table id="csds-result">
</table>

{:.notice}
The different service names can be found in the relevant documentation for the API you're looking to use. They can be found in each document's Overview page. Service names are *case sensitive*. Please make sure to input serviceName as it is provided in each document's overview.

###  Request

The GET method used returns the base URI for the specified account ID and serviceName.

| Method | URL |
| :--- | :--- |
| GET | http://api.liveperson.net/api/account/{accountId}/service/{serviceName}/baseURI.json?version=1.0 |

**URL Parameters**

| Name | Description | Type / Value | Required |
| :--- | :--- | :--- | :--- |
| account | LivePerson account ID | string | Required |
| service | Service name according to the relevant API | string | Required |

###  Response

JSON Example:

```json
{
    "baseURIs": [
        {
            "service": "liveEngageUI",
            "account": "EXAMPLE123",
            "baseURI": "lo.le1.liveperson.net"
        },
        {
            "service": "visitorFeed",
            "account": "EXAMPLE123",
            "baseURI": "lo.v-feed.liveperson.net"
        },
        {
            "service": "etool",
            "account": "EXAMPLE123",
            "baseURI": "z2.etool.liveperson.net"
        },
```


**Optional Response Status Codes**

| Status | Description |
| :--- | :--- |
| 200 OK | Successfully retrieved the data. |
| 400 Bad Request | Problem with body or query parameters. |
| 401 Unauthorized | Bad Authentication (invalid site or agent). |
