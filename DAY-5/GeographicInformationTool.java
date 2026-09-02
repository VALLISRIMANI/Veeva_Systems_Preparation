/* 
You are tasked to build a backend module for a geographic information tool. The application must store a massive records of global cities mapped to their population counts. The application must handle frequent and instantaneous queries from users asking for the population of specific cities. A standard search through millions of records is unacceptable. 

Functional requirements: 
1. Efficient lookup: retrieve population of given city. 
2. Data integrity: prevent duplicate entries from the same city. You can update the record by overriding previous population count. 
3. Traversal.
*/

import java.util.*;

class City {
    private String name;
    private int population;

    public City(String name, int population) {
        this.name = name;
        this.population = population;
    }

    public String getName() {
        return name;
    }

    public int getPopulation() {
        return population;
    }

    @Override
    public String toString() {
        return "City [name=" + name + ", population=" + population + "]";
    }
}

class GeographicInformation {
    private HashMap<String, City> cityMap;

    public GeographicInformation() {
        cityMap = new HashMap<>();
    }

    public void addCity(City city) {
        cityMap.put(city.getName(), city);
    }

    public void printAllCities() {
        System.out.println("\nAll Cities:");
        for (City city : cityMap.values()) {
            System.out.println(city);
        }
    }

    public void lookupCity(String name) {
        if (cityMap.containsKey(name)) {
            System.out.println("\nCity found: " + cityMap.get(name));
        } else {
            System.out.println("\nCity with name '" + name + "' does not exist.");
        }
    }
}

public class GeographicInformationTool {
    public static void main(String[] args) {
        GeographicInformation geographicInfo = new GeographicInformation();

        geographicInfo.addCity(new City("New York", 8419600));
        geographicInfo.addCity(new City("Los Angeles", 3980400));
        geographicInfo.addCity(new City("Chicago", 2716000));
        geographicInfo.addCity(new City("Houston", 2328000));
        geographicInfo.addCity(new City("Phoenix", 1690000));

        geographicInfo.printAllCities();

        geographicInfo.lookupCity("Chicago");
        geographicInfo.lookupCity("Miami"); 

        geographicInfo.addCity(new City("Phoenix", 20000000));        
        geographicInfo.printAllCities();
    }
}