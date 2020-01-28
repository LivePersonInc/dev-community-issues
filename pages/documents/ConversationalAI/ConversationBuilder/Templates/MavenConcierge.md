---
pagename: Maven Concierge
redirect_from:
Keywords:
sitesection: Documents
categoryname: "Conversational AI"
documentname: Conversation Builder
subfoldername: Templates
permalink: conversation-builder-templates-maven-concierge.html
indicator: both
---

The Maven Concierge Bot template in a Bot template in Conversation builder that comes pre-wired with integration to Maven AI Powered Routing and Context warehouse enabling you to setup and build personalized consumer journeys easily. 

The following example flow can happen with this template:

- The conversation starts with a Welcome intent, for example “hi”
- The bot then asks the customer for a phone number
- The phone number is stored in Maven Context Session Store
- Maven evaluates policies based on the phone number (whether phone number is in a VIP list or a Regular Customer List)
- Bot transfers the conversation to a skill or agent based on the policy outcome 


### Included Items

#### Dialogs 

- Basic Welcome Dialog

- A Question that asks basic customer information (e.g. a phone number)

<img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_0.png">

#### Integrations

- Maven [Context Session Store](maven-ai-context-warehouse-context-session-store.html) integration

- [AskMaven API](maven-ai-askmaven-overview.html) integration that allows a bot to consult Maven on routing decisions

  <img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_1.png">

  - Pre built code for Transfer to skill and Transfer to agent: Routing decisions provided by Maven are then dispatched to an agent, bot, or a skill using these integrations. 

  <img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_2.png">

  <img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_3.png">

### Configuration Needed

The important environment related variables are stored in the Global Functions, and for most cases this is the only file you will likely edit. 

<img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_4.png">

Open the bot. On the top navigation click on Global Functions and edit the following fields:

1. `deploymentZone`: Z1-Americas, Z2-EMEA, Z3-APAC

2. `accountId`: Your LiveEngage account ID

3. `mavenNamespace`: Please enter the Namespace you have defined in your [Context Warehouse Session Store](https://developers.liveperson.com/maven-ai-context-warehouse-context-session-store.html) for storing and retrieving session variables. 

4. `mavenApiKey`: copy and paste the Developer Key from Maven Workspace

5. `fallbackSkillName`: Please enter the skill name for the fall back skill. This skill is used by the bot if no policies are executed by Maven

6. `fallbackSkillId`: Please enter the skill ID for the fall back skill. This skill is used by the bot if no policies are executed by Maven

7. `fallbackMessage`: Please enter a message to send to customer when the fallback route 

8. `CB_API_KEY`: On the top right click on the Key Icon, and then copy and paste the key in "Your API Access Key"

   <img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_5.png">

9. Click save

10. Configure LiveEngage and Deploy the bot. 

### Using the Context Session Store 

The [Maven Context Session Store](https://developers.liveperson.com/maven-ai-context-warehouse-context-session-store.html) can be used inside Conversation Builder using [Scripting Functions](https://developers.liveperson.com/conversation-builder-scripting-functions-manage-the-context-session-store.html) to store and retrieve session attributes. These attributes can be carried through in a conversation or can then be used in defining routing policy. The template provides an example where a phone number retrieved from the Welcome dialog is stored in the session variable. To view: 

1. Open the dialog in template called - "Start Here - Welcome"

2. Click on the interaction - AskMaven, and then on the right inside Interaction details, **Code**

   <img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_6.png">

3. The following code stores the phoneNumber in the Context Session Store. Similarly other attributes for example, NLU intent can also be stored in the session store.  

   <img class="fancyimage" style="width:750px" src="img/maven/mave_bot_template_image_7.png">

4. The phoneNumber can then be used to determine customer attributes for example if the customer is a VIP or not and then route them to a specific skill or agent defined inside Maven Policy editor. To run an end to end example of such a feature, please refer to the [AI Powered Routing Tutorial](https://developers.liveperson.com/maven-ai-ai-powered-routing-tutorial.html#using-a-policy-with-conversation-builder) 

