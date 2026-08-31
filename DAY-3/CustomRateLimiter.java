/*
Design a Custom Rate Limiter or Custom Rate Cache.

Implement a class VeevaLogger that handles request/message tracking.

The system must prevent printing an identical message if that message has already been printed within the last 10 seconds.

The logger should provide a method that receives a message and its timestamp and determines whether the message should be printed.

For example:

timestamp = 1   → "Hello" → print
timestamp = 5   → "Hello" → do not print
timestamp = 11  → "Hello" → print

The same message can be printed again once 10 seconds have elapsed since its previous print.
*/

import java.util.*;

class VeevaLogger {
    private Map<String, Integer> lastPrintedTime;

    public VeevaLogger() {
        lastPrintedTime = new HashMap<>();
    }

    public boolean shouldPrintMessage(int timestamp, String message) {
        if (!lastPrintedTime.containsKey(message)) {
            lastPrintedTime.put(message, timestamp);
            return true;
        }

        int previousTime = lastPrintedTime.get(message);

        if (timestamp - previousTime >= 10) {
            lastPrintedTime.put(message, timestamp);
            return true;
        }

        return false;
    }

    public void log(int timestamp, String message) {
        if (shouldPrintMessage(timestamp, message)) {
            System.out.println(message);
        }
    }
}

public class CustomRateLimiter {
    public static void main(String[] args) {
        VeevaLogger logger = new VeevaLogger();

        logger.log(1, "Hello");
        logger.log(5, "Hello");
        logger.log(10, "Hello");
        logger.log(11, "Hello");

        logger.log(2, "Veeva");
        logger.log(8, "Veeva");
        logger.log(12, "Veeva");
    }
}