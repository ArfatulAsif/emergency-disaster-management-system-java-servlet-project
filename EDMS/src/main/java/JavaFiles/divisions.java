
package JavaFiles;

import java.util.HashMap;
import java.util.Map;

public class divisions {
public Map<String , Pair> divisionCoordinates = new HashMap<>();
    
    public void make()
    {
        divisionCoordinates.put("Dhaka", new Pair(23.8103, 90.4125));
        divisionCoordinates.put("Chittagong", new Pair(22.3475, 91.8123));
        divisionCoordinates.put("Khulna", new Pair(22.8150, 89.5687));
        divisionCoordinates.put("Rajshahi", new Pair(24.3740, 88.6011));
        divisionCoordinates.put("Barisal", new Pair(22.7029, 90.3466));
        divisionCoordinates.put("Rangpur", new Pair(25.7465, 89.2514));
        divisionCoordinates.put("Mymensingh", new Pair(24.7466, 90.4077));
        divisionCoordinates.put("Sylhet", new Pair(24.8897, 91.8759));
        divisionCoordinates.put("Habiganj", new Pair(24.3864, 91.4182));
        divisionCoordinates.put("Moulvibazar", new Pair(24.3065, 91.7296));
        divisionCoordinates.put("Sunamganj", new Pair(25.0657, 91.4059));
        divisionCoordinates.put("Faridpur", new Pair(23.5228, 89.8500));
        divisionCoordinates.put("Gazipur", new Pair(24.0022, 90.4266));
        divisionCoordinates.put("Gopalganj", new Pair(23.0022, 89.8268));
        divisionCoordinates.put("Kishoreganj", new Pair(24.4333, 90.7750));
        divisionCoordinates.put("Madaripur", new Pair(23.1690, 90.1985));
        divisionCoordinates.put("Manikganj", new Pair(23.8583, 90.0391));
        divisionCoordinates.put("Munshiganj", new Pair(23.5429, 90.5039));
        divisionCoordinates.put("Narayanganj", new Pair(23.6062, 90.4996));
        divisionCoordinates.put("Bandarban", new Pair(21.8310, 92.3686));
        divisionCoordinates.put("Brahmanbaria", new Pair(23.9571, 91.1119));
        divisionCoordinates.put("Chandpur", new Pair(23.2255, 90.6715));
        divisionCoordinates.put("Comilla", new Pair(23.4160, 91.1588));
        divisionCoordinates.put("Coxs Bazar", new Pair(21.4272, 92.0058));
        divisionCoordinates.put("Feni", new Pair(23.0238, 91.3849));
        divisionCoordinates.put("Khagrachari", new Pair(23.1126, 91.9630));
        divisionCoordinates.put("Lakshmipur", new Pair(22.9420, 90.8402));
        divisionCoordinates.put("Noakhali", new Pair(22.8432, 91.1082));
        divisionCoordinates.put("Rangamati", new Pair(22.6511, 92.1822));
        divisionCoordinates.put("Bogra", new Pair(24.8500, 89.3672));
        divisionCoordinates.put("Joypurhat", new Pair(25.0968, 89.0319));
        divisionCoordinates.put("Naogaon", new Pair(24.7936, 88.9318));
        divisionCoordinates.put("Natore", new Pair(24.4206, 88.9762));
        divisionCoordinates.put("Nawabganj", new Pair(24.5965, 88.2746));
        divisionCoordinates.put("Pabna", new Pair(24.0128, 89.2380));
        divisionCoordinates.put("Rajshahi", new Pair(24.3740, 88.6011));
        divisionCoordinates.put("Sirajgonj", new Pair(24.4513, 89.7082));
        divisionCoordinates.put("Bagerhat", new Pair(22.6584, 89.7850));
        divisionCoordinates.put("Chuadanga", new Pair(23.6438, 88.8415));
        divisionCoordinates.put("Jessore", new Pair(23.1667, 89.2089));
        divisionCoordinates.put("Jhenaidah", new Pair(23.5441, 89.1524));
        divisionCoordinates.put("Khulna", new Pair(22.8150, 89.5687));
        divisionCoordinates.put("Kushtia", new Pair(23.9032, 89.1214));
        divisionCoordinates.put("Magura", new Pair(23.4874, 89.4195));
        divisionCoordinates.put("Meherpur", new Pair(23.7622, 88.6363));
        divisionCoordinates.put("Narail", new Pair(23.1724, 89.5124));
        divisionCoordinates.put("Satkhira", new Pair(22.7185, 89.0705));
        divisionCoordinates.put("Barguna", new Pair(22.1500, 90.1122));
        divisionCoordinates.put("Barisal", new Pair(22.7010, 90.3285));
        divisionCoordinates.put("Bhola", new Pair(22.6859, 90.6480));
        divisionCoordinates.put("Jhalokati", new Pair(22.6236, 90.1973));
        divisionCoordinates.put("Patuakhali", new Pair(22.3595, 90.3314));
        divisionCoordinates.put("Pirojpur", new Pair(22.5856, 89.9720));
        divisionCoordinates.put("Jamalpur", new Pair(24.9312, 89.9440));
        divisionCoordinates.put("Mymensingh", new Pair(24.7570, 90.4069));
        divisionCoordinates.put("Netrokona", new Pair(24.8896, 90.7270));
        divisionCoordinates.put("Sherpur", new Pair(25.0205, 90.0153));
    }
    
    public static double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
        // Convert degrees to radians
        lat1 = Math.toRadians(lat1);
        lon1 = Math.toRadians(lon1);
        lat2 = Math.toRadians(lat2);
        lon2 = Math.toRadians(lon2);
        
        // Haversine formula
        double dlat = lat2 - lat1;
        double dlon = lon2 - lon1;
        double a = Math.pow(Math.sin(dlat / 2), 2) + Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(dlon / 2), 2);
        double c = 2 * Math.asin(Math.sqrt(a));
        double r = 6371;  // Earth's radius in kilometers
        double distance = c * r;
        
        return distance;
    }
    
}
