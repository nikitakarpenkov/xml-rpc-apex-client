public class XmlRpcStructParameter extends XmlRpcParameter {
    
    public XmlRpcStructParameter() {
        this.value = new Map<String, XmlRpcParameter>();
    }
    
    public Map<String, XmlRpcParameter> getParametersMap() {
        return (Map<String, XmlRpcParameter>)this.value;
    }
    
    public XmlRpcStructParameter(Map<String, XmlRpcParameter> parametersMap) {
        this.value = parametersMap;
    }
    
    public void addParameter(String name, XmlRpcParameter parameter) {
        ((Map<String, XmlRpcParameter>)this.value).put(name, parameter);
    }
    
    public void addParameters(Map<String, XmlRpcParameter> parametersMap) {
        ((Map<String, XmlRpcParameter>)this.value).putAll(parametersMap);
    }
    
    public override String getTypeNodeName() {
        if (this.value instanceof Map<String, XmlRpcParameter>) {
            return 'struct';
        } else {
            return super.getTypeNodeName();
        }
    }
    
}