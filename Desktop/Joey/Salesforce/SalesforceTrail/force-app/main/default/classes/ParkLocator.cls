public class ParkLocator {
    public static String[] country(String CountryName) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(CountryName);
    }
}