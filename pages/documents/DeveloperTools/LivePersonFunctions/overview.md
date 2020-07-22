---
pagename: Overview
keywords:
sitesection: Documents
categoryname: "Developer Tools"
documentname: LivePerson Functions
permalink: liveperson-functions-overview.html
indicator: both
redirect_from:
  - function-as-a-service-overview.html
---

<div class="important">LivePerson Functions is now enabled on your account. Log in at https://faas.liveperson.net or click on the Functions link from your Conversational Cloud Quick Launch menu</div>

[LivePerson Functions](https://faas.liveperson.net) is a Function as a Service (FaaS) platform which enables brands to develop custom behaviors within LivePerson’s conversational platform, to better tailor the system to their specific needs. By offering these capabilities, Functions enables developers to write a simple function, deploy it to LivePerson's infrastructure and make it available to their LivePerson account in minutes. This allows you to create custom logic inside our conversational platform.

<img src="img/faas-overview.png" alt="LivePerson Functions Overview" style="width:100%;"/>

This overview document will define the basic components of the Functions platform, as well as other key terminology. When using Functions, there are three main components that a developer should consider:

### Function

Functions (or `lambdas`) are code snippets that accomplish certain tasks. A developer can write custom code (e.g. in JavaScript) that will run upon being triggered by the invoker (essentially the source from which the function is triggered, see below for more information on invocations). A payload that is passed from the invoker into the function can also be used within it. Developers can use the data from the payload as part of the function logic, allowing them to react to dynamic information passed when the function is triggered.

### Invocation

Functions are triggered by services that have integrations with the Functions platform. Depending on the type of function, different triggers will be used. These triggers can be an internal LivePerson event, for example when a new conversation is started or a CSAT Post Survey is completed. As part of the invocation, the integrated invokers can pass a payload into the function. This payload is specific to the triggered event. This means that depending on the event, the function will have different data available as an input.

### Response / Action

Functions also have the ability to respond back to the invoker if needed. The invoker can then perform an action based on the response of the function. For example, if a function is triggered when a new conversation starts, then the function could tell the triggering service to send an auto-message back into the conversation.

Functions also have the ability to leverage both LivePerson APIs as well as external ones. This allows developers to extend the brand’s Conversational Cloud platform with custom integrations. Because Functions infrastructure resides inside the LivePerson cloud and adheres to the security, stability and scalability measures as offered by our cloud, these custom integrations will enjoy the same robustness as other Conversational Cloud services. For example, the platform self-monitors the activity and scales in a self-sufficient manner based on resource demand. This means that if a certain function is experiencing a high load during peak hours, the infrastructure scales automatically to provide it with more resources and to ensure optimal performance.


{: .notice}
The Functions platform is committed to providing a top notch developer experience. The platform can be a powerful tool to leverage the flexibility of your accounts. Click here to read our [Terms of Use](https://knowledge.liveperson.com/developer-tools-liveperson-functions-terms-of-use.html).
