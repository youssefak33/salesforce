public class AnimalLocator {
    public static String getAnimalNameById(Integer Id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'hhttps://th-apex-http-callout.herokuapp.com/animals/';
        request.setEndpoint(endpoint + Id);
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        if (response.getStatusCode() != 200) {
            return 'Error: ' + response.getStatusCode();
        }
        else {
            Map <String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            Map<String, Object> result = (Map<String, Object>) results.get('animal');
            String name = (String)result.get('name');
            return name;
        }
    }
}