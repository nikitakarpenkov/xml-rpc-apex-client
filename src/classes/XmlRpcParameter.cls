public virtual class XmlRpcParameter {
    
    public Object value { get; protected set; }
    
    public virtual String getTypeNodeName() {
        if (this.value instanceof Boolean) {
            return 'boolean';
        } else if (this.value instanceof DateTime) {
            return 'dateTime.iso8601';
        } else if (this.value instanceof Double) {
            return 'double';
        } else if (this.value instanceof Integer) {
            return 'int';
        } else if (this.value instanceof String) {
            return 'string';
        } else {
            return null;
        }
    }
    
    public XmlRpcParameter(Boolean value) {
        this.value = value;
    }
    
    public XmlRpcParameter(Integer value) {
        this.value = value;
    }
    
    public XmlRpcParameter(Double value) {
        this.value = value;
    }
    
    public XmlRpcParameter(String value) {
        this.value = value;
    }
    
    public XmlRpcParameter(Datetime value) {
        this.value = value;
    }
    
    protected XmlRpcParameter() { }
    
    public String getValueString() {
        if (this.value instanceof Datetime) {
            return ((Datetime)this.value).formatGMT('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
        } else if (this.value instanceof Datetime ||
                   this.value instanceof Boolean ||
                   this.value instanceof Double ||
                   this.value instanceof Integer ||
                   this.value instanceof String)
        {
            return String.valueOf(this.value);               
        } else {
            return null;
        }
    }

    public virtual void writeXmlNodeTree(Dom.XmlNode paramNode) {
        Dom.XmlNode paramValue = paramNode.addChildElement('value', null, null);
        if (this.value != null) {
            paramValue.addChildElement(this.getTypeNodeName(), null, null)
                      .addTextNode(this.getValueString());
        } else {
        	paramValue.addChildElement('nil', null, null);
        }
    }
    
}