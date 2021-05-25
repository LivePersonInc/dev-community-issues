---
pagename: Using Intents with KBs
redirect_from:
    - conversation-builder-knowledge-base.html
Keywords:
sitesection: Documents
categoryname: "Conversational AI"
documentname: Knowledge Base
permalink: knowledge-base-using-intents-with-kbs.html
indicator: both
---

### Introduction

If your knowledge base is an [external knowledge base with LivePerson AI](knowledge-base-external-knowledge-bases-external-kbs-with-liveperson-ai.html) or an [internal knowledge base](knowledge-base-internal-knowledge-bases-introduction.html) (which also uses LivePerson AI), it makes use of Natural Language Understanding or NLU to evaluate the articles against the consumer's utterance (the intent) in order to return the highest scoring article.

To set this up, you create a domain with the necessary intents in [Intent Builder](intent-builder-overview.html), where the domain specifies the [NLU engine](intent-builder-natural-language-understanding.html) to use. Then, within the Knowledge Base application, you 1) associate the domain with the knowledge base, 2) associate the domain's intents with the articles, and 3) train the knowledge base to use the intents to return the articles.

{: .important}
Intent Builder offers a set of [pre-built domains](intent-builder-overview.html#prebuilt-domains). These are designed to get you up and running quickly with intents.

### Associate a domain with a knowledge base

You associate a domain with an external knowledge base when you [add the knowledge base](knowledge-base-external-knowledge-bases-external-kbs-with-liveperson-ai.html#add-an-external-kb-with-liveperson-ai):

<img style="width:700px" src="img/ConvoBuilder/kb_add_ext.png">

And you likewise associate a domain with an internal knowledge base when you [add the knowledge base](knowledge-base-internal-knowledge-bases-knowledge-bases.html#add-an-internal-knowledge-base): 

<img style="width:700px" src="img/ConvoBuilder/kb_add_int.png">

Associating the domain gives you access to the domain's intents, so you can associate them with the articles. This is the next step in connecting your content to intents.

{: .important}
When you are adding the knowledge base, take care when selecting the domain. You can't change the domain after adding the knowledge base.

### Associate intents with articles

After you've added a knowledge base that is associated to a domain, configure the articles so that each is linked to the appropriate intent.

<img style="width:600px" src="img/ConvoBuilder/kb_associate_article.png">

### Tune a knowledge base

After you've added your content and linked it to intents, tune the knowledge base. Tuning involves:

1. Performing a search using a consumer utterance.
2. Reviewing the results.
3. Adding or removing training phrases in the intents as needed.

**To tune a knowledge base**

1. Open the knowledge base.
2. In the **Question Tester** on the right, specify the following:

    <img class="fancyimage" style="width:400px" src="img/ConvoBuilder/kb_test1.png">

    * **Question**: Enter the consumer utterance for which you want to find matching articles.
    * **Search Mode**: Select the type of search to perform. For explanations of each search mode, see *Search modes* farther below in this topic.
    * **Confidence**: Select the NLU confidence threshold that an article must meet for it to be returned as a result. For more on thresholds, see *Scoring and thresholds* farther below in this topic.
    * **# of Results**: Select how many results to return.
    * **Article Status**: Select the status of the artice, either Active, Inactive, or All. This option is only available for internal knowledge bases.

3. Click **Find Answer**.
4. Review the results under **Matched Answers**.

    <img class="fancyimage" style="width:400px" src="img/ConvoBuilder/kb_test2.png">

5. You can click on an article title to see the article, and toggle between this and its JSON.

    <img class="fancyimage" style="width:400px" src="img/ConvoBuilder/kb_test3.png">
    <img class="fancyimage" style="width:400px" src="img/ConvoBuilder/kb_test4.png">
    <img class="fancyimage" style="width:400px" src="img/ConvoBuilder/kb_test5.png">

6. Based on the results, adjust the training phrases for the intents in the associated domain if needed.

### Search modes

A knowledge base search is performed using a specified "search mode." The search mode determines the type of search. Possible modes include:

* Intents
* Intents Only
* Text

#### Intents mode

When the Intents mode is used, an exact match, text-to-text search is performed first. If a match isn't found by the first search, Knowledge Base next uses Natural Language Understanding (NLU) algorithms to match the consumer input to articles. And if a match isn't found by the NLU search, a final, text-to-text search is performed as a fallback.

<img style="width:750px" src="img/ConvoBuilder/kb_search_modes_ext.png">
<img style="width:750px" src="img/ConvoBuilder/kb_search_modes_int.png">

#### Intents Only mode

The Intents Only mode is like the Intents mode (above) except that the final, text-to-text search isn't performed as a fallback.

#### Text mode

When the Text mode is used, a text-to-text search is performed:

* With an [external knowledge base with LivePerson AI](knowledge-base-external-knowledge-bases-external-kbs-with-liveperson-ai.html), the search algorithm checks the consumer's input against the title and tags.
* With an [internal knowledge base](knowledge-base-internal-knowledge-bases-introduction.html), the search algorithm checks the consumer's input against the title, summary, detail, [Knowledge Base intents](knowledge-base-internal-knowledge-bases-introduction.html#domain-intents-versus-knowledge-base-intents) (intent qualifiers), and tags.

### Scoring and thresholds

When the Knowledge Base uses Natural Language Understanding (NLU) algorithms to evaluate a consumer's input against a knowledge base, it scores the articles based on the confidence level of the match: VERY GOOD, GOOD, FAIR PLUS, FAIR or POOR. 

| If the knowledge base is... | Then... |
| --- | --- |
| an external knowledge base with LivePerson AI | the scoring breakdown for the NLU engine used by the associated domain is used |
| an internal knowledge base with Domain intents | the scoring breakdown for the NLU engine used by the associated domain is used |
| an internal knowledge base with Knowledge Base intents (intent qualifiers) | the scoring breakdown for LivePerson (Legacy) is used |

For these confidence score breakdowns, see [here](intent-builder-intents.html#what-is-the-intent-scorethreshold).

When you implement a knowledge base search within a bot via a [Knowledge AI interaction](conversation-builder-interactions-integrations.html#knowledge-ai-interactions), you specify the minimum score that a result must have in order to be returned. You can select from VERY GOOD, GOOD or FAIR PLUS. The default value is GOOD. If you downgrade the threshold to FAIR PLUS, be sure to test whether the quality of the results meets your expectations. It's generally recommended to keep the quality above FAIR PLUS.
