sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'sravan.directreqapplication',
            componentId: 'Request_HeaderList',
            contextPath: '/Request_Header'
        },
        CustomPageDefinitions
    );
});