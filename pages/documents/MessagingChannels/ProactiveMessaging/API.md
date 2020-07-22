---
pagename: API
redirect_from:
  - ProactiveMessaging.html
Keywords:
sitesection: Documents
categoryname: "Messaging Channels"
documentname: Proactive Messaging
permalink: proactive-messaging-api.html
indicator: messaging
---

### Introduction

Proactive Messaging allows brands to send outbound messages to consumers and route the responses from consumers into LiveEngage; creating  two-way messaging conversations. Proactive Messaging v2.0 API is the latest API with a lot of improvements from the older 1.0 API version. Proactive v2.0 API comes with rate limiting, support for scheduling guardrails, high send rate and integrates with LE campaign and engagement for conversation routing. Proactive Messaging v2.0 API is currently available to customers for SMS and WhatApp. 
Note: Proactive Messaging can be leveraged using Proactive 2.0 API or [Web Tool](https://knowledge.liveperson.com/messaging-channels-proactive-messaging-proactive-messaging-overview.html).

### Getting Started

1. Onboarding to [Proactive Web Tool](https://knowledge.liveperson.com/messaging-channels-proactive-messaging-proactive-messaging-overview.html) is mandatory before onboarding to Proactive 2.0 API. For Proactive Web Tool, fill out this [request](https://forms.gle/tUqhtE7kjAJpmo9L8) to get on-boarded. 
2. To onboard on Proactive 2.0 API,
- Create 2 new bot users in Conversational Cloud. Customer Success Managers can do this on behalf of the brand using elevated LivePerson credentials. Important points:
    * Please make sure the bot users have Campaign Manager roles & privileges. If this is not done, API calls to create Proactive campaigns will not be successful. 
    * It is critical that these two bot users are not used by other services. For example, these two bots should not be shared with Conversational Builder. 
    * Provide LivePerson Proactive team with the bot user api key and secret of the 2 bots created in step #2. Please email Proactive team for a secured method that you can share this information. 
    * LivePerson will provide brands the client ID and secrets which will be used to create an app jwt for authentication. Click here to learn how to use [APP JWT](https://developers.liveperson.com/connector-api-send-api-authorization-and-authentication.html#get-appjwt).

### API Specifications
## API Domain
* Proactive messaging is deployed in three regions. **North America**, **EMEA**(Europe, Middle East and Africa), **APAC**(Asia Pacific). Use the domain api to identify the zone of proactive api which is to be used for an account.

| Method | URI  |
| :--- | :--- |
| GET | http://api.liveperson.net/api/account/{ACCOUNT_ID}/service/agentVep/baseURI.json?version=1.0|

```json
{
    "service": "agentVep",
    "account": "ACCOUNT_ID",
    "baseURI": "va.agentvep.liveperson.net"
}
```

| If Sentinel **baseURI** then | Proactive Region | Proactive **API domain** | API Documentation |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| **va**.agentvep.liveperson.net  | NA | proactive-messaging.**z1**.fs.liveperson.com | Click [here](https://proactive-messaging.z1.fs.liveperson.com/api/api-docs/?api=outbound) for API spec
| **lo**.agentvep.liveperson.net  | EMEA | proactive-messaging.**z2**.fs.liveperson.com | Click [here](https://proactive-messaging.z2.fs.liveperson.com/api/api-docs/?api=outbound) for API spec
| **sy**.agentvep.liveperson.net  | APAC | proactive-messaging.**z3**.fs.liveperson.com | Click [here](https://proactive-messaging.z3.fs.liveperson.com/api/api-docs/?api=outbound) for API spec

## Campaign API: Example Request and Response
* Click [**Campaign**](https://proactive-messaging.z1.fs.liveperson.com/api/api-docs/?api=outbound#/Campaign/campaign) to go through API spec and use example here to get started.

| Method | URI  |
| :--- | :--- |
| POST | https://{domain}/api/v2/account/{ACCOUNT_ID}/campaign|

**Path Parameters**

| Name  | Description | Value/Example |
| :--- | :--- | :--- |
| domain   | see [API Domain](#api-domain-and-documentation) | proactive-messaging.**z1**.fs.liveperson.com or proactive-messaging.**z2**.fs.liveperson.com or proactive-messaging.**z3**.fs.liveperson.com |
| ACCOUNT_ID | LivePerson site ID | 34567231 |

**Request Headers**

| Header | Description | Value/Example |
| :--- | :--- | :--- |
| Content-Type | Used to indicate the media type of the resource | application/json |
| Authorization | Extract the access_token value from the response retrieved by the [Get AppJWT](https://developers.liveperson.com/connector-api-send-api-authorization-and-authentication.html#get-appjwt) | Bearer <<APP_JWT>> |

**Request Body Example - JSON Payload**

```json
{
    "campaignName": "TestProactiveAPI",
    "skill": "sales",
    "templateId": "943679028015322",
    "consent": true,
    "outboundNumber": "12025166656",
    "consumers": [
        {
            "consumerCountryCode": "1",
            "consumerPhoneNumber": "1012959736",
            "variables": {
            	"1": "Test outbound api"
            }
        }
    ]
}
```
**Response Example**

```json
{
   "proactiveCampaignId": "08TwCku2h",
   "leCampaignId": "1887624732",
   "leEngagementId": "1966477634",
   "requestTraceId": "705ffabe-14bb-4217-9eb7-8c12ff43a5d6",
   "failedConsumers": [],
   "acceptedConsumers": [
       {
           "id": "tjlaY5FJfv",
           "phoneNumber": "+11012959736"
       }
   ]
}
```

## Conversations API: Example Request and Response
* click [**Conversations**](https://proactive-messaging.z1.fs.liveperson.com/api/api-docs/?api=outbound#/Campaign/conversations) to go through API spec and use example here to get started.


| Method | URI  |
| :--- | :--- |
| GET | https://{domain}/api/v2/account/{ACCOUNT_ID}/campaign/{PROACTIVE_CAMPAIGN_ID/conversations|

**Path Parameters**

| Name  | Description | Value/Example |
| :--- | :--- | :--- |
| domain   | see [API Domain](#api-domain-and-documentation)| proactive-messaging.**z1**.fs.liveperson.com or proactive-messaging.**z2**.fs.liveperson.com or proactive-messaging.**z3**.fs.liveperson.com |
| ACCOUNT_ID | LivePerson site ID | 34567231 |
| PROACTIVE_CAMPAIGN_ID | Proactive campaign ID found in campaign response | 08TwCku2h |

**Request Headers**

| Header | Description | Value/Example |
| :--- | :--- | :--- |
| Content-Type | Used to indicate the media type of the resource | application/json |
| Authorization | Extract the access_token value from the response retrieved by the [Get AppJWT](https://developers.liveperson.com/connector-api-send-api-authorization-and-authentication.html#get-appjwt) | Bearer <<APP_JWT>> |

**Response Example**

```json
{
    "campaignStatus": "FINISHED",
    "conversations": [
        {
            "id": "tjlaY5FJfv",
            "status": "DELIVERED",
            "conversationId": null,
            "errorMessage": null
        }
    ]
}
```

### Proactive 2.0 API: Frequently Asked Questions

<strong>Can we share the bot users for proactive 2.0 api with other systems?</strong>
The bot users should only be used for proactive 2.0 api. The bot users are needed since we need to send messages on behalf of agent to consumers. The bot users session in proactive 2.0 api can break if these bot users are logged in some where else in some other services.

<strong>What is the rate limit for the API?</strong>
The current rate limit is 10 TPS/second/brand per api.

<strong>What is the daily limit when sending outbound messages?</strong>
It depends on the channel. Messaging Channel providers like WhatsApp have certain limitations on how many messages can be sent per day. Considering these limitations Proactive Messaging will limit to 100K recipients/message/day/channel/account. For example, if account X creates Y campaigns on 04/28/2020 with total recipients R for SMS channel cumulative. If 100K - R is 100 then creating a new campaign on 04/28/2020 for SMS channel with more than 100 recipients will fail.

<strong>Which channels are supported as of now?</strong>
- Proactive messaging supports SMS and WA channels only. The channel is decided based on templateId in campaigns api request.
- Choose templateId="1234567890" for SMS messages and WA templateId for sending WA messages.

<strong>Does Proactive Messaging provide a way to send SMS messages within a certain time window (TCPA compliance)?</strong>
 Proactive Messaging ensures that recipients only receive messages within the time window brands specifies. This time window is calculated based on the recipient phone number. This helps brands adhere to one of the legal requirements for sending SMS texts i.e. SMS can only be sent between 8 am and 9 pm to avoid spamming consumers after business hours.

<strong>Once a campaign is submitted, how soon will these recipients receive the messages?</strong>
Messages are sent at a rate upto 10 messages per second per channel per account. For example, a campaign is created for an SMS channel using the default receiving window for 100 recipients. Some of these recipients have phone numbers from regions belonging to PST, CST, EST time zones. Once a campaign is submitted/published, based on the phone number, a zone is computed (number with +1 - (201) is found to be in EST). Using the specified receiving window, a decision is made to send a message to the phone number if current time in that zone is within the window. If the recipient receiving window is closed then a message will be sent on the next opening of the window.

<strong>How will batching capability work?</strong>
A single campaign can have more than 1 recipient and not more than 1000 recipients. It is recommended to batch recipients in a campaign.

<strong>What are the error codes for invalid recipients information in the campaign?</strong>
Consider an example response of campaigns API:
```json
{
    "proactiveCampaignId": "t86nfq57S",
    "leCampaignId": "1156064532",
    "leEngagementId": "1190093132",
    "requestTraceId": "221cc131-056a-4c19-a259-8e6ec8e57101",
    "failedConsumers": [
        {
            "phone": "+11012539745",
            "errorMessage": "<<ERROR_MESSAGE>>",
            "variables": {
                "1": "Testing Outbound Api WA"
            }
        }
    ],
    "acceptedConsumers": []
}
```

| <<ERROR_MESSAGE>> | Description |
|-------------------------------------------|------------------------------------------------------------------------------------|
| 'INVALID_NUMBER'                  		| The associated recipient/consumer country code or phone number or both is invalid. |
| 'DUPLICATE_NUMBER'                		| More than one recipient in a given campaign has the same phone number. |
| 'TOO_MANY_VARIABLES'              		| The template expects less variables for creating the message to the recipient. |
| 'INSUFFICIENT_VARIABLES'              	| The template expects more variables for creating the message to the recipient. |
| 'MISSING_VARIABLE=<<VARIABLE_NAME>>'  	| The recipient has a missing variable identified by VARIABLE_NAME. |
| 'VARIABLE_NOT_STRING=<<VARIABLE_NAME>>'   | The recipient has a variable which is not a string identified by VARIABLE_NAME. |

<strong>What kind of security, encryption, parameter, failures?</strong>
The API uses App Jwt Oauth 2.0 authentication.

<strong>Does the API have status call backs? How do we get the status of the message?</strong>
Proactive Messaging does not have call backs to inform the status. Proactive Messaging provides status of messages through [conversations](https://proactive-messaging.fs.liveperson.com/api/api-docs/v2/outbound/#/Campaign/conversations) API.

<strong>Does LivePerson return some sort of error response when the user already opted out? For example if we try to send to a number that's blocked?</strong>
- Proactive guarantees opt-out from SMS only. If a consumer opts out from twilio SMS, we guarantee that no future Proactive messages will be sent to the consumer until they re-opt-in again. For messages that are sent to consumer who opted out, the state of recipient will be marked 'SKIPPED' in conversations api.
- Proactive messaging does not have the ability to capture opt-out from WA channels.

<strong>Is there a throughput limitation for the data that gets passed from Twilio to LP? For example, if brand sends 100 Twilio msgs/sec (their max throughput), then can the data flow through to LP at the same rate?</strong>
- Proactive Messaging does not have any limitations on the message size while sending messages to twilio or other channels. However a large message may translate to more than one message when the recipient receives it.
- Example: A message of more than 140 characters will be divided into two messages and sent to recipients.
 
<strong>What reporting metrics do I get? What metrics are available now?</strong>
- Proactive Messaging provides the status of messages delivered to recipients through [conversations](#conversations-api-example-request-and-response) api. [conversations](#conversations-api-example-request-and-response) api provides the necessary information to compute the success and failure of messages being sent to connectors. Below are status of recipients that provides the information like

| <<MESSAGE_STATUS>> | Description |
|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| 'DELIVERED'         | Message was delivered successfully to our downstream service. |
| 'DRAFT'             | When recipients are added to a campaign and not yet published. For users of 2.0 API, this can happen 	when recipients are added to the campaign and publishing fails abnormally. |
| 'TOO_MANY_VARIABLES'| More variables are provided for the message than expected |
| 'FAILED'            | Messages is not delivered to recipient because of an error indicated by error message |
| 'NOT_SENT'  		  | Not sent state happens when campaign is in published mode and recipients are yet to schedule. |
| 'SKIPPED'   		  | Usually happens when the user has Opted Out from receiving any message from the Brand. |
| 'SCHEDULED'   	  | Message that is not delivered and is scheduled to be delivered at a later moment during the next business hour. |

<strong>What is the lifespan of the app JWT? When we do need to get a new JWT, do we have to first make the call to LivePerson Domain API in order to get the sentinel service domain, or is that domain consistent enough that we can hard code that in?</strong>
- An APP JWT expiration time is 1 hour from the time it is created. To get an app JWT from sentinel API, a call to domain api has to be made to get the sentinel api domain. This domain can be cached for some duration. We expect the domain to change in very rare cases. It’s still recommended that cache duration should not be more than 1 day.

- When using app JWT to call Proactive api, a response below indicates the jwt is expired and new app jwt to be obtained from sentinel api.
	```json
	{
		"code": 0,
		"message": "jwt expired"
	}
	```

<strong>Do we need any other JWT other than APP JWT e.g. Consumer JWT?</strong>
Proactive Messaging service does not create or consume consumer JWT or other JWT except APP JWT. Proactive Messaging api only consumes AppJwt created from provided clientId and Secret for authentication.

<strong>What should the authentication header look like, is the bearer token the only thing required even in production usage? Do we need to include our ConsumerKey/Secret or our AccessToken/Secret that we use in the 1.0 API at all, or any other information?</strong>
App Jwt will be consumed as Bearer Token. No other key, secret or token will be consumed by Proactive Messaging api.

<strong>How does proactive 2.0 api provide status of message e.g. success/failure of delivery ?</strong>
The Proactive 2.0 campaign api is asynchronous meaning that the success and failure of a message to a recipient is noted only when the recipient is picked from the proactive internal queue and a message is sent as per pre configured message rate. The [conversations](#conversations-api-example-request-and-response) api will provide the status of recipients tied to the campaign created.

<strong>Of the error cases described above, which of those errors should we consider "retry-able"? For example, a bad request due to a missing field is not retry-able because it will just always fail, but a case where one of the downstream services was temporarily unavailable could warrant a retry. Which error cases that we could get back from the /campaigns endpoint are retryable and how should we handle a retry to avoid sending duplicate messages to a customer?</strong>
Proactive Messaging service has retry mechanism internally on dependent services to reduce failures due to transient errors.

<strong>What’s the lookback period?</strong>
- Lookback period is how long will LP services maintain context (like campaign info, skill etc) for a reply of a message that is sent to the recipient/consumer using a campaign. Current lookback period is 30 days from when messages are sent using Proactive api. 
- Example: When a message is sent to consumer using Proactive Messaging api and if consumer replies within 30 days from when message was sent, the response will be redirected to LE agent according to specified skill in Proactive Campaign. A response after 30 days will be be treated as any inbound message and routed to a default skill in Conversational Cloud (this is configured by brand). Please note, if a consumer has an existing active conversation with a brand in any channel, the outbound message won’t be delivered.

