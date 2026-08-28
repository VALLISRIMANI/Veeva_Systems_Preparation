/*
Suppose there are 3 servers in a load balancing tool in a distributed system. And the servers are Server1, Server2, Server3. Each server has different number of active connections. For example, Server1 jas 4 connections, Server2 has 5 connections and Server3 has 2 connections. Now, whenever a new request comes in, it should allocated to a server that has less active connectionsat present. Implement this concept using Object Oriented Design. In above example the servers are fixed 3. But for every server the existing connections are input.
*/

import java.util.*;

class Server {
    private String serverName;
    private int activeConnections;

    public Server(String serverName, int activeConnections) {
        this.serverName = serverName;
        this.activeConnections = activeConnections;
    }

    public String getServerName() {
        return serverName;
    }

    public int getActiveConnections() {
        return activeConnections;
    }

    public void incrementConnections() {
        activeConnections++;
    }

    public void decrementConnections() {
        if (activeConnections > 0) {
            activeConnections--;
        }
    }
}

class LoadBalancer {
    private List<Server> servers;

    public LoadBalancer() {
        servers = new ArrayList<>();
    }

    public void addServer(Server server) {
        servers.add(server);
    }

    public Server getLeastLoadedServer() {
        Server leastLoaded = servers.get(0);

        for (Server server : servers) {
            if (server.getActiveConnections() < leastLoaded.getActiveConnections()) {
                leastLoaded = server;
            }
        }

        return leastLoaded;
    }

    public Server allocateRequest() {
        Server server = getLeastLoadedServer();

        server.incrementConnections();

        return server;
    }
}

public class LoadBalancing3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        LoadBalancer loadBalancer = new LoadBalancer();

        for (int i = 1; i <= 3; i++) {
            System.out.print("\nEnter active connections for Server" + i + ": ");
            int activeConnections = sc.nextInt();
            loadBalancer.addServer(new Server("Server" + i, activeConnections));
        }

        while (true) {
            System.out.print("\nEnter '1' to allocate a new request or '0' to exit: ");
            int choice = sc.nextInt();

            if (choice == 0) {
                System.out.println("Exiting...");
                break;
            } else if (choice == 1) {
                Server allocatedServer = loadBalancer.allocateRequest();
                System.out.println("Request allocated to " + allocatedServer.getServerName() + " with " + allocatedServer.getActiveConnections() + " active connections.");
            } else {
                System.out.println("Invalid choice. Please try again.");
            }
        }

        sc.close();
    }
}