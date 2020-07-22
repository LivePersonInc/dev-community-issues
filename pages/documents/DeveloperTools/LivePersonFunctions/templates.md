---
pagename: Templates
keywords:
sitesection: Documents
categoryname: "Developer Tools"
documentname: LivePerson Functions
permalink: liveperson-functions-templates.html
indicator: both
redirect_from:
  - function-as-a-service-templates.html
---

[Conditioned-Based Email Transcript via Conversational Cloud Chat](function-as-a-service-use-cases-post-conversation-survey-with-functions.html)

This integration lets you trigger functions following the submission of a Post Chat Survey. The contents of the chat survey are passed into the `lambda` as a payload. You can then create conditions and send a response back to the LivePerson server with a command to send a transcript of the chat to an email configured in the `lambda`.

[Messaging Conversations with Functions](function-as-a-service-use-cases-messaging-conversations-with-functions.html)

Functions can be invoked using a set of standard Messaging conversational state change events. A state change analyzer listens to these conversation events and invokes functions that are subscribed to them. This allows for custom logic to be created around the state of the conversation, such as when an agent or a consumer leave the conversation, when a conversation is started, etc.
