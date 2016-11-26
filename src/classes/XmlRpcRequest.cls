public class XmlRpcRequest {
    
    public String methodName {get; set;}
    List<XmlRpcParameter> parametersList { get; private set; }
    
    public XmlRpcRequest(String methodName) {
        this.methodName = methodName;
        this.parametersList = new List<XmlRpcParameter>();
    }
    
    public XmlRpcRequest(String methodName,
                         List<XmlRpcParameter> parametersList)
    {
        this.methodName = methodName;
        this.parametersList = parametersList;
    }
    
    public void addParameter(XmlRpcParameter parameter) {
        parametersList.add(parameter);
    }
    
    public void addParameters(List<XmlRpcParameter> parametersList) {
        parametersList.addAll(parametersList);
    }
    
    public DOM.Document getRequestXml() {
        DOM.Document requestXml = new DOM.Document();
        DOM.XmlNode methodCall = requestXml.createRootElement('methodCall', null, null);
        methodCall.addChildElement('methodName', null, null)
        		  .addTextNode(this.methodName);
        Dom.XmlNode params = methodCall.addChildElement('params', null, null);
        for (XmlRpcParameter param_i : parametersList) {
            DOM.XmlNode paramNode = params.addChildElement('param', null, null);
            param_i.writeXmlNodeTree(paramNode);
        }
        return requestXml;
    }
    
}