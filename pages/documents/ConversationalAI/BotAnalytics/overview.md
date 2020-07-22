---
pagename: Overview
redirect_from:
    - conversation-builder-analytics.html
Keywords:
sitesection: Documents
categoryname: "Conversational AI"
documentname: Bot Analytics
permalink: bot-analytics-overview.html
indicator: both
---

The Bot Analytics application is intended to show you *real time* data on your bots. As such, you can use it to query for and download data for any 60-day time period in the last 13 months. If you need to download at one time the data for a longer time period, use [Analytics Builder](https://knowledge.liveperson.com/data-reporting-report-builder-report-builder-overview.html).

### Access Bot Analytics

**To access the Bot Analytics application**

1. On the left sidebar in Conversational Cloud, click the <img style="width:30px" src="img/ConvoBuilder/icon_cb.png"> icon.
2. In the Conversational AI dashboard, click **Bot Analytics**.

    The first screen that appears is a list of all your bots. Search or scroll through the list and select the bot for which you want to see data.

    <img style="width:900px" src="img/ConvoBuilder/analytics_dashboard.png">

### Views

After clicking on a bot, you will be brought to the Overview. Clicking on "Overview" in the upper-left will show all of the available views.

In any view for a bot, you will be able to change the date range and timezone in the upper-right.

In any view **other than the Overview**, you are able to download the results to a CSV file via the download button under the date filter.

<!--
#### Intents View

Info about how to improve bots, what certain things mean to performance.

#### Custom Events View

What are custom events? [Here](conversation-builder-conversation-builder-scripting-functions.html#log-custom-event)
-->
### Metrics

| Name | Description |
| --- | --- |
| Users | Number of unique users connected to bot |
| Conversations | Number of Conversational Cloud Conversations in which the bot is a participant |
| Automation Sessions (Deprecated) | Number of times a bot connects to a conversation |
| Average Session Length (Deprecated) | Average of the time lapse between bot connection/disconnection to a conversation |
| Escalations | Number of times a bot transfers a user to a different skill/agent |
| Conversation Escalation Rate | Percentage of conversations that are transferred to a different skill/agent |
| Messages | The number of messages sent by the consumer and received by the bot. For details on this, see the Messages section in the application. |
| Questions Asked | The number of intentful messages received by the bot. These are dialog starters and other intentful responses to which patterns and intents were matched. | 
| Matched Intents | Number of questions asked that are matched with intents or Knowledge Base articles |
| Unmatched Phrases | Number of questions asked that are not matched with intents or Knowledge Base articles |
| Intent Matched Rate | Percentage of questions asked that were matched | 
