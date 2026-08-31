/*
===============================================================================
SQL QUESTION: APPROVED PROMOTIONAL OR LEGAL DOCUMENTS
===============================================================================

Consider the following table representing document information in Veeva Cloud:

documents:

id
name
status
major_version_no
document_type

Question:
---------
Retrieve metadata for all the approved promotional or legal documents
in ascending order of document name.


===============================================================================
SOLUTION 1: WHERE + IN + ORDER BY
===============================================================================
*/

SELECT *
FROM documents
WHERE status = 'APPROVED'
  AND document_type IN ('Promotional', 'Legal')
ORDER BY name ASC;


/*
===============================================================================
SOLUTION 2: Using OR
===============================================================================
*/

SELECT *
FROM documents
WHERE status = 'APPROVED'
  AND (
      document_type = 'Promotional'
      OR document_type = 'Legal'
  )
ORDER BY name ASC;


/*
===============================================================================
SOLUTION 3: Selecting ONLY the required metadata columns
===============================================================================
*/

SELECT
    id,
    name,
    status,
    major_version_no,
    document_type
FROM documents
WHERE status = 'APPROVED'
  AND document_type IN ('Promotional', 'Legal')
ORDER BY name ASC;