public with sharing class RestCallouts {
    public static HttpResponse getAquote() {
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://api.kanye.rest/');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200) {
            System.debug(response.getStatus());
            System.debug(response.getBody());

            Map<String,Object> quotemap=(Map<String,Object> )JSON.deserializeUntyped(response.getBody());
            System.debug('quote.get(quote):'+quotemap.get('quote'));
            List<Object> quotes=quotemap.get('quote');
            for (Object obj : quotes) {
                System.debug(obj);
            }

        }
        return response;
    }
}