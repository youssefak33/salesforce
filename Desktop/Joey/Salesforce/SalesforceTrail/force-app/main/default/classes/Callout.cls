public with sharing class Callout {
    @future(callout=true)
    public static void MakeCallout() {
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://api.hubapi.com/crm/v3/objects/contacts?limit=10&properties=email,firstname,lastname';
        String token = 'pat-na1-243f87fc-432f-4148-ad4c-ffb8505ad7d1';

        request.setEndPoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + token);

        HttpResponse response = new HTTP().send(request);
        System.debug(response);
        System.debug('Status Code: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());
    }
}