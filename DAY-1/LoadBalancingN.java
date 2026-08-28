/*
Suppose there are 3 servers in a load balancing tool in a distributed system. And the servers are Server1, Server2, Server3. Each server has different number of active connections. For example, Server1 jas 4 connections, Server2 has 5 connections and Server3 has 2 connections. Now, whenever a new request comes in, it should allocated to a server that has less active connectionsat present. Implement this concept using Object Oriented Design. In above example the servers are fixed 3. But for every server the existing connections are input.

Implement the above question with N servers. Input is N servers and requests. With N servers assume that each connection has start time and end time. Once end time is elapsed that should be deleted from the server connections. And using this scenario allocate servers.
*/

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

class Connection {
    private LocalDateTime startTime;
    private LocalDateTime endTime;

    public Connection(LocalDateTime startTime, LocalDateTime endTime) {
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }
}

class Server {
    private String serverName;
    private List<Connection> connections;

    public Server(String serverName) {
        this.serverName = serverName;
        this.connections = new ArrayList<>();
    }

    public String getServerName() {
        return serverName;
    }

    public void addConnection(Connection connection) {
        connections.add(connection);
    }

    public int getActiveConnectionCount() {
        return connections.size();
    }

    public void removeExpiredConnections(LocalDateTime currentTime) {
        Iterator<Connection> iterator = connections.iterator();

        while (iterator.hasNext()) {
            Connection connection = iterator.next();

            if (connection.getEndTime().isBefore(currentTime)
                    || connection.getEndTime().isEqual(currentTime)) {
                iterator.remove();
            }
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

    public Server getLeastLoadedServer(LocalDateTime currentTime) {
        if (servers.isEmpty()) {
            throw new IllegalStateException("At least one server is required");
        }

        for (Server server : servers) {
            server.removeExpiredConnections(currentTime);
        }

        Server leastLoaded = servers.get(0);

        for (Server server : servers) {
            if (server.getActiveConnectionCount()
                    < leastLoaded.getActiveConnectionCount()) {
                leastLoaded = server;
            }
        }

        return leastLoaded;
    }

    public Server allocateRequest(LocalDateTime currentTime, LocalDateTime endTime) {
        Server server = getLeastLoadedServer(currentTime);
        Connection connection = new Connection(currentTime, endTime);

        server.addConnection(connection);
        return server;
    }
}

public class LoadBalancingN {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        LoadBalancer loadBalancer = new LoadBalancer();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        System.out.print("Enter number of servers: ");
        int n = sc.nextInt();
        for (int i = 1; i <= n; i++) {
            Server server = new Server("Server" + i);
            loadBalancer.addServer(server);
        }

        System.out.print("Enter number of requests: ");
        int requests = sc.nextInt();
        sc.nextLine();

        for (int i = 1; i <= requests; i++) {
            System.out.println("\nRequest " + i);

            System.out.print("Enter start time(yyyy-MM-dd HH:mm): ");
            LocalDateTime startTime = LocalDateTime.parse(sc.nextLine(), formatter);

            System.out.print("Enter end time(yyyy-MM-dd HH:mm): ");
            LocalDateTime endTime = LocalDateTime.parse(sc.nextLine(), formatter);

            Server server =
                loadBalancer.allocateRequest(
                    startTime,
                    endTime
                );

            System.out.println("Request allocated to " + server.getServerName());

            System.out.println("Active connections: " + server.getActiveConnectionCount());
        }

        sc.close();
    }
}