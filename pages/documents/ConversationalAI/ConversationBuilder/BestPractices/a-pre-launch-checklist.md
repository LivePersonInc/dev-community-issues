---
pagename: A Pre-Launch Checklist
redirect_from:
Keywords:
sitesection: Documents
categoryname: "Conversational AI"
documentname: Conversation Builder
subfoldername: Best Practices
permalink: conversation-builder-best-practices-a-pre-launch-checklist.html
indicator: both
---

### Test the "unhappy" paths

Try and break the flows you have built. Be as disruptive as possible. 
From within each dialog, enter gibberish messages to see how fallback occurs.
Test whether you are catching unexpected answers to questions, and, if needed, use the * pattern to [keep the consumer in the current dialog](conversation-builder-advanced-use-cases.html#keep-the-consumer-in-the-current-dialog).

### Avoid mismatched intents for unhandled use cases

If there are known phrases or patterns for sensitive consumer intents that you aren't handling in the bot on launch day, it's recommended that you create "placeholder" dialogs that catch these specific patterns and immediately transfer to a human agent (i.e., an [Agent Transfer interaction](conversation-builder-interactions-integrations.html#agent-transfer-interactions)).  Doing this prevents the fallback response or a mismatched intent tied to another dialog.

For example, "my partner has passed away" relates to bereavement, and in this case the consumer should be transferred to a live agent immediately. For this, create a dialog with a Dialog Starter interaction that listens for the pattern `*passed away*` and other variations, and have this immediately transfer to a human agent.

### Prepare your incident mitigation strategy

Consider adding one or more dialogs that refer to incidents or your brand's outages that might occur while the bot is live. Hook these up to common phrases that consumers might ask at these times.

If an incident occurs, you can quickly enable these dialogs on-the-fly to help deflect/contain the consumers who flood the channel during these times.

This can be built before launch day and tested based on the knowledge you have about how you communicate about these types of situations when consumers reach agents in these moments.