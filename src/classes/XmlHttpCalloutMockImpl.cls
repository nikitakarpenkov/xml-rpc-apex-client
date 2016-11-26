@isTest
global class XmlHttpCalloutMockImpl implements HttpCalloutMock {
    
    public Dom.Document bodyDocument { get; set; }
    
    public XmlHttpCalloutMockImpl(Dom.Document bodyDocument) {
        this.bodyDocument = bodyDocument;
    }
    
    global HttpResponse respond(HttpRequest req) {
    	system.debug(this.bodyDocument.toXmlString());
		HttpResponse response = new HttpResponse();
		response.setBody(this.bodyDocument.toXmlString());
		response.setHeader('Contect-Type', 'text/xml');
        response.setStatusCode(200);
        return response;
        
    }

}