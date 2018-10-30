public class RecentItems {
    
    private Http httpProtocol{get; set;}
    private HttpRequest request{get; set;}
    private HttpResponse response{get; set;}
    private String jsonInput{get; set;}
    
    public RecentItems(){
        httpProtocol = new Http();
        request = new HttpRequest();
    }
    
    public String makeRequest(){
        
        request.setHeader('Authorization', 'OAuth '+UserInfo.getSessionId());
        request.setEndPoint('https://na53.salesforce.com/services/data/v43.0/recent');
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);
        jsonInput = response.getBody();
        system.debug('===>'+jsonInput);
        
        return jsonInput;
    }
    
}