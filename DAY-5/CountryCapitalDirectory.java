/*
Country Capital Directory:

You are tasked with building a digital directory that maps world countries to their respective capital cities, to ensure efficient lookups, updates, and management. Implement a system using key-value data structure. Your system must support a variety of data operations, including initialization, storage, inserting the data records, safely retrieving information, checking for records, removing entries, and list all the active data.

Functional Requirements: 
1. Initialization: Create an empty data structure with country name as key and capital name as value, both are text strings. 
2. Data Insertion: Populate the data structure with M distinct country-capital pairs. 
3. Data Retrieval: Lookup and extract the capital of specific country using its name. 
4. Iteration and Display: Traverse the entire directory, print every country along with its capital. 
5. Existing Verification: Check if a specific country exists in the directory or not. 
6. Data Deletion: Delete specific entry from the directory based on the country name.
*/




import java.util.*;

class Directory {
	private HashMap<String, String> directory;
	
	public Directory() {
		directory = new HashMap<>();
	}
	
	public void add(String country, String capital) {
		directory.put(country, capital);
	}
	
    public void printAllEntries() {
        System.out.println("\n--- All Country-Capital Entries ---");
        for (Map.Entry<String, String> entry : directory.entrySet()) {
            System.out.println("Country: " + entry.getKey() + " , " + "Capital: " + entry.getValue());
        }
    }

	public void retrieveCapitalUsingCountry(String country) {
		if (directory.containsKey(country)) {
			System.out.println("\nCountry: " + country + " , " + "Capital: " + directory.get(country));
		} else {
			System.out.println("\nCountry Not Found");
		}
	}
	
	
	public void checkIfCountryExistsOrNot(String country) {
		if (directory.containsKey(country)) {
			System.out.println("\nCountry: " + country + " exists in the directory.");
		} else {
			System.out.println("\nCountry: " + country + " does not exist in the directory.");
		}
	}
	
	public void deleteEntryUsingCountry(String country) {
		if (directory.containsKey(country)) {
			directory.remove(country);
			System.out.println("\nCountry: " + country + " is deleted.");
		} else {
			System.out.println("\nCountry Not Found");
		}
	}
}	
	
public class CountryCapitalDirectory {
	public static void main(String[] args) {
        Directory directory = new Directory();
        directory.add("India", "New Delhi");
        directory.add("USA", "Washington D.C.");
        directory.add("France", "Paris");
        directory.add("Japan", "Tokyo");
        directory.add("Australia", "Canberra");

        directory.printAllEntries();

        directory.retrieveCapitalUsingCountry("India");
        
        directory.checkIfCountryExistsOrNot("USA");
        directory.checkIfCountryExistsOrNot("Germany");

        directory.deleteEntryUsingCountry("France");
        directory.printAllEntries();
    }
}
