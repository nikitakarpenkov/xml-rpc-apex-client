@isTest
public class XmlRpcRequestTest {

    @isTest
    public static void XmlRpcRequestTest() {
        
        XmlRpcRequest request = new XmlRpcRequest('testMethodName');
        request = new XmlRpcRequest('testMethodName', new List<XmlRpcParameter>());
        request.addParameter(new XmlRpcParameter('string'));
        request.addParameter(new XmlRpcParameter(true));
        request.addParameter(new XmlRpcParameter(1));
        Double pi = 3.14159265359;
        request.addParameter(new XmlRpcParameter(pi));
        request.addParameter(new XmlRpcParameter(DateTime.now()));
        String nullString = null;
        request.addParameter(new XmlRpcParameter(nullString));
        request.addParameters(new List<XmlRpcParameter>());
        request.getRequestXml();
        
    }
    
}