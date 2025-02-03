sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sravan/directreqapplication/test/integration/FirstJourney',
		'sravan/directreqapplication/test/integration/pages/Request_HeaderList',
		'sravan/directreqapplication/test/integration/pages/Request_HeaderObjectPage',
		'sravan/directreqapplication/test/integration/pages/Request_ItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, Request_HeaderList, Request_HeaderObjectPage, Request_ItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sravan/directreqapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRequest_HeaderList: Request_HeaderList,
					onTheRequest_HeaderObjectPage: Request_HeaderObjectPage,
					onTheRequest_ItemObjectPage: Request_ItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);