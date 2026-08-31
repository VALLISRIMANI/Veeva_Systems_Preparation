/*
Document Lock Manager

Veeva Systems specializes in cloud-based software. In a cloud environment, documents can be accessed by different users.

Design and implement a lightweight simulation of a concurrent document management system that grants or denies locks on documents to users and releases locks on documents.

Implement a DocumentLockManager class with the following methods:

1. requestLock(String docId, String userId, int timestamp)

This method grants a lock to the user if the document is not already locked by another user. Return true if the lock is successfully granted. Return false if the document is already locked.


2. releaseLock(String docId, String userId)

Release the lock if the requesting user is the current lock holder. Return true if the lock is successfully released. Return false otherwise.


3. cleanExpiredLocks(int currentTimestamp, int duration)

Release all locks that have been held longer than the allowed duration relative to the current timestamp.

Note: Timestamp can be represented using int or long.

*/

import java.util.*;

class Document {
    private String docId;
    private String userId;
    private long lockTimestamp;
    
    public Document(String docId, String userId, long lockTimestamp) {
        this.docId = docId;
        this.userId = userId;
        this.lockTimestamp = lockTimestamp;
    }

    public String getDocId() {
        return docId;
    }

    public String getUserId() {
        return userId;
    }

    public long getLockTimestamp() {
        return lockTimestamp;
    }
}

public class DocumentLockManager {
    private Map<String, Document> lockedDocuments;

    public DocumentLockManager() {
        lockedDocuments = new HashMap<>();
    }

    public boolean requestLock (String docId, String userId, long timestamp) {
        if (lockedDocuments.containsKey(docId)) {
            return false;
        }

        Document document = new Document(docId, userId, timestamp);
        lockedDocuments.put(docId, document);

        return true;
    }

    public boolean releaseLock (String docId, String userId) {
        Document document = lockedDocuments.get(docId);

        if (document == null) {
            return false;
        }

        if (!document.getUserId().equals(userId)) {
            return false;
        }

        lockedDocuments.remove(docId);
        return true;
    }

    public void cleanExpiredLocks (long currentTimestamp, long duration) {
        Iterator<Map.Entry<String, Document>> iterator = lockedDocuments.entrySet().iterator();

        while (iterator.hasNext()) {
            Map.Entry<String, Document> entry = iterator.next();
            Document document = entry.getValue();

            long heldDuration = currentTimestamp - document.getLockTimestamp();

            if (heldDuration > duration) {
                iterator.remove();
            }
        }
    }

    public void displayLocks() {
        if (lockedDocuments.isEmpty()) {
            System.out.println("No active locks.");
            return;
        }

        for (Document document : lockedDocuments.values()) {
            System.out.println("Document: " + document.getDocId() + " | User: " + document.getUserId() + " | Lock Time: " + document.getLockTimestamp());
        }
    }

    public static void main(String[] args) {
        DocumentLockManager manager = new DocumentLockManager();

        System.out.println(manager.requestLock("DOC101", "USER1",100));
        
        System.out.println(manager.requestLock("DOC101", "USER2", 110));

        System.out.println(manager.releaseLock("DOC101", "USER2"));

        System.out.println(manager.releaseLock("DOC101", "USER1"));

        manager.requestLock("DOC102", "USER3", 200);

        manager.cleanExpiredLocks(250, 30);

        manager.displayLocks();
    }
}
