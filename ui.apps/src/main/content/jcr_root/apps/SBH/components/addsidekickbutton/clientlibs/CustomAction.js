// Set up a namespace to contain our code

CQ.Ext.namespace("sample", "sample.button");

// Sidekick action to fire the custom action
sample.button.CustomAction = {
    "text": "Custom Created Action",
    "context": CQ.wcm.Sidekick.PAGE,
    "handler": function() {
        alert("Custom action called!");
    }
};

// add this action to the default list
CQ.wcm.Sidekick.DEFAULT_ACTIONS.push(sample.button.CustomAction);
