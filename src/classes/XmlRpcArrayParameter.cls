public class XmlRpcArrayParameter extends XmlRpcParameter {
    
    public XmlRpcArrayParameter() {
        this.value = new List<XmlRpcParameter>();
    }
    
    public XmlRpcArrayParameter(List<XmlRpcParameter> parametersList) {
        this.value = parametersList;
    }
    
    public List<XmlRpcParameter> getParametersList() {
        return (List<XmlRpcParameter>)this.value;
    }
    
    public void addParameter(XmlRpcParameter parameter) {
        ((List<XmlRpcParameter>)this.value).add(parameter);
    }
    
    public void addParameters(List<XmlRpcParameter> parametersList) {
        ((List<XmlRpcParameter>)this.value).addAll(parametersList);
    }
    
    public override String getTypeNodeName() {
        if (this.value instanceof List<XmlRpcParameter>) {
            return 'array';
        } else {
            return super.getTypeNodeName();
        }
    }
    
    public override void writeXmlNodeTree(Dom.XmlNode paramNode) {
        Dom.XmlNode paramValue = paramNode.addChildElement('value', null, null);
        if (this.value != null) {
            paramValue.addChildElement(this.getTypeNodeName(), null, null)
                      .addTextNode(this.getValueString());
        } else {
        	paramValue.addChildElement('nil', null, null);
        }
    }
    
}