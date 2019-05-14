<%@include file="/libs/foundation/global.jsp"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simplex Theme by templatemo</title>
    <meta name="description" content="Simplex theme is free template based on Bootstrap version 3.0.0 and it can be used for any purpose.">
    <meta name="author" content="">
    <link href="/etc/designs/StateBankofHyderabad/css/SBH_Css.css" rel="stylesheet">
    <cq:include script="logo.jsp"/>
    <cq:include path="userinfo" resourceType="SBH/components/topnav"/>
    <cq:include script="/libs/wcm/core/components/init/init.jsp"/>


    <!-- 

		This is the code to disable and Enable the Items in the Sidekick 

		(like page,components,information,versioning,workflows)

 	-->


    <script type="text/javascript">

        window.MyComponent = window.MyComponent || {};
        MyComponent.HideComponentsPanel = {
            IN_ID : '',     
            disableFn: function(){
                try{
                    var sk = CQ.WCM.getSidekick();

                    if(!sk){
                        return;
                    }

                    var compTab = sk.panels["PAGE"];

                    if (compTab) {
                        compTab.setDisabled(false);
                        clearInterval(MyComponent.HideComponentsPanel.IN_ID);
                    }
                }catch(err){
                    console.log("Error:--" + err);
                }
            }
        }

        CQ.Ext.onReady(function(){
            var h = MyComponent.HideComponentsPanel;
            h.IN_ID = setInterval(h.disableFn, 500);
        });

   </script>
</head>
  