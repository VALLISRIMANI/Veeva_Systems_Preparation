# Java String MCQs

### Question 1

How many String objects are eligible for Garbage Collection right after this execution (assuming no other references exist)?

* A. 0 objects

* B. 3 objects

* C. 1 object

* D. 2 objects

**Answer:** A
**Explanation:** Without code provided showing dereferenced strings, 0 objects are eligible for garbage collection. Additionally, string literals stored in the String Constant Pool are not eligible for GC under standard execution.

### Question 2

How many total String objects (both in the heap and the string constant pool) are created when executing this line of code for the very first time in a fresh JVM classloader context?
`String s = new String("VeevaQA");`

* A. 2 objects

* B. 1 object

* C. 3 objects

* D. 0 objects

**Answer:** A
**Explanation:** Two objects are created: one literal `"VeevaQA"` in the String Constant Pool and one heap object created via the `new` keyword constructor.

### Question 3

Which of the following statements regarding StringBuilder and StringBuffer is incorrect?

* A. StringBuilder is not thread-safe, making it faster than StringBuffer in single-threaded execution contexts.

* B. StringBuffer methods are synchronized via explicit locking at the classloader level, making it immutable.

* C. StringBuffer synchronizes its critical methods using synchronized keywords.

* D. Both StringBuilder and StringBuffer inherit from the same abstract superclass or implement Appendable and CharSequence.

**Answer:** B
**Explanation:** `StringBuffer` methods use instance-level method synchronization, not classloader-level locking, and `StringBuffer` is mutable, not immutable.

### Question 4

What is the result of evaluating the following expression in Java?
`String result = "Status: " + null;`

* A. A NullPointerException is thrown at runtime.

* B. "Status: "

* C. null

* D. "Status: null"

**Answer:** D
**Explanation:** String concatenation with `null` converts `null` into the string literal `"null"`, resulting in `"Status: null"`.

### Question 5

What is the size of the array returned by the following code?
`String text = ",a,b,";`
`String[] tokens = text.split(",");`

* A. 2

* B. 3

* C. 4

* D. 5

**Answer:** B
**Explanation:** By default, `split(regex)` discards trailing empty strings. The split produces `["", "a", "b"]`, which has a length of 3.

### Question 6

Evaluate the behavior of the following snippet:

```
String s1 = "Veeva";
String s2 = "Ve" + "eva";
System.out.println(s1 == s2);

```

What will be printed?

* A. true

* B. false

* C. A compilation error.

* D. null

**Answer:** A
**Explanation:** Constant expression string concatenation (`"Ve" + "eva"`) is evaluated at compile time, resolving to `"Veeva"`, which references the exact same pool instance as `s1`.

### Question 7

If you initialize a StringBuilder using `StringBuilder sb = new StringBuilder(10);`, what will be the capacity of sb after appending a string of 15 characters to it?

* A. 15

* B. 22

* C. 20

* D. 25

**Answer:** B
**Explanation:** When capacity is exceeded, StringBuilder calculates new capacity as `(oldCapacity * 2) + 2`. Here, `(10 * 2) + 2 = 22`.

### Question 8

What type of value is returned by the `String.compareTo()` method when the invoking string is lexicographically greater than the argument string?

* A. Exact difference in character length between the two strings.

* B. Any negative integer.

* C. Always 1.

* D. A positive integer.

**Answer:** D
**Explanation:** `compareTo()` returns a positive integer if the invoking string comes lexicographically after the argument string.

### Question 9

Which of the following core Java classes or interfaces does not implement the CharSequence interface?

* A. java.util.Scanner

* B. java.lang.String

* C. java.lang.StringBuilder

* D. java.nio.CharBuffer

**Answer:** A
**Explanation:** `java.util.Scanner` does not implement `CharSequence`; it accepts `CharSequence` as an input source.

### Question 10

Why is the `hashCode()` value cached as an instance field within the `java.lang.String` class?

* A. To allow modification of hash values during runtime string mutation.

* B. Because strings are immutable, the hash code never changes, allowing performance optimization for hashing collections (like HashMap).

* C. To secure string values against memory reflection attacks.

* D. To synchronize multi-threaded access to character arrays.

**Answer:** B
**Explanation:** Since `String` is immutable, its hash code is computed once on demand and cached to speed up operations in hash-based collections like `HashMap`.

### Question 11

What is the output of the following code snippet?

```
String result = String.join("-", "Veeva", null, "SDET");
System.out.println(result);

```

* A. A NullPointerException is thrown.

* B. Veeva--SDET

* C. Veeva-SDET

* D. Veeva-null-SDET

**Answer:** D
**Explanation:** `String.join` treats `null` elements as the string `"null"`, printing `"Veeva-null-SDET"`.

### Question 12

What is the `length()` method used for in Java String?

* A. To find the last index of a character

* B. To concatenate two strings

* C. To convert a string to lowercase

* D. To find the number of characters in a string

**Answer:** D
**Explanation:** `length()` returns the total count of characters contained within the string.

### Question 13

Which method is used to compare two strings for equality in Java String?

* A. compare()

* B. equals()

* C. compareTo()

* D. hashCode()

**Answer:** B
**Explanation:** `equals()` checks whether two strings have the exact same sequence of characters.

### Question 14

Which method is used to convert a string to uppercase in Java String?

* A. toUppercase()

* B. toUpperCase()

* C. upperCase()

* D. convertCase()

**Answer:** B
**Explanation:** Java method names follow camelCase naming conventions, making `toUpperCase()` the valid method.

### Question 15

Which method is used to find the index of a specified character in Java String?

* A. indexOf()

* B. findIndex()

* C. searchIndex()

* D. locateIndex()

**Answer:** A
**Explanation:** `indexOf()` returns the index of the first occurrence of the specified character or substring.

### Question 16

Which method is used to replace characters in a string with another character in Java String?

* A. replace()

* B. replaceChar()

* C. replaceAll()

* D. replaceCharacter()

**Answer:** A
**Explanation:** `replace()` replaces all occurrences of a specific character or `CharSequence` with a new one. (`replaceAll()` is specifically for regex patterns).

### Question 17

Which method is used to extract a substring from a string in Java String?

* A. substring()

* B. extractString()

* C. getSubstring()

* D. subString()

**Answer:** A
**Explanation:** `substring()` returns a new string that is a subset of the character sequence.

### Question 18

Which method is used to remove leading and trailing whitespace from a string in Java String?

* A. strip()

* B. trim()

* C. removeWhitespace()

* D. removeSpaces()

**Answer:** B
**Explanation:** `trim()` (and `strip()` from Java 11+) removes leading and trailing spaces. `trim()` is the classic standard string method.

### Question 19

Which method is used to split a string into an array of substrings based on a specified delimiter in Java String?

* A. split()

* B. divide()

* C. separate()

* D. break()

**Answer:** A
**Explanation:** `split()` splits a string around matches of the given regular expression into an array.

### Question 20

Which method is used to check if a string starts with a specified prefix in Java String?

* A. startsWith()

* B. hasPrefix()

* C. checkPrefix()

* D. beginWith()

**Answer:** A
**Explanation:** `startsWith()` checks whether the string begins with the given prefix.

### Question 21

Which method is used to convert a string to lowercase in Java String?

* A. toLower()

* B. toLowerCase()

* C. lowerCase()

* D. convertToLower()

**Answer:** B
**Explanation:** `toLowerCase()` converts all characters in the String to lowercase using default locale rules.

### Question 22

Which of the following code snippets correctly initializes a String variable in Java?

* A. String name = "John";

* B. String name = new String("John");

* C. String name; name = "John";

* D. String name; name = new String("John");

**Answer:** A
**Explanation:** While options A, B, C, and D are all syntactically valid in code, Option A represents the standard literal initialization idiom.

### Question 23

Which of the following methods can be used to find the length of a String in Java?

* A. string.length()

* B. string.length

* C. string.size()

* D. string.size

**Answer:** A
**Explanation:** `length()` is a method on `String` objects (unlike arrays, which use `.length` field).

### Question 24

Which of the following methods can be used to convert a String to uppercase in Java?

* A. string.toUpperCase()

* B. string.toUpper()

* C. string.upperCase()

* D. string.upper()

**Answer:** A
**Explanation:** `toUpperCase()` is the official built-in String class method.

### Question 25

Which of the following methods can be used to check if a String contains a specific substring in Java?

* A. string.contains(substring)

* B. string.includes(substring)

* C. string.hasSubstring(substring)

* D. string.has(substring)

**Answer:** A
**Explanation:** `contains()` returns `true` if and only if the string contains the specified sequence of char values.

### Question 26

Which of the following methods can be used to concatenate two Strings in Java?

* A. string.concat(otherString)

* B. string.join(otherString)

* C. string.append(otherString)

* D. string.add(otherString)

**Answer:** A
**Explanation:** `concat()` appends the specified string to the end of the invoking string.

### Question 27

What will be the output of the following code snippet?

```
String name = "John";
System.out.println(name.charAt(2));

```

* A. J

* B. o

* C. h

* D. n

**Answer:** C
**Explanation:** Strings use 0-based indexing: `0='J'`, `1='o'`, `2='h'`, `3='n'`. Index 2 yields `'h'`.

### Question 28

Which of the following methods can be used to check if two Strings are equal in Java?

* A. string.equals(otherString)

* B. string.equalTo(otherString)

* C. string.compare(otherString)

* D. string.compareString(otherString)

**Answer:** A
**Explanation:** `equals()` is the standard method for value equality checks across Java objects.

### Question 29

Which of the following methods can be used to replace a specific character in a String with another character in Java?

* A. string.replace(character, newCharacter)

* B. string.replaceAll(character, newCharacter)

* C. string.replaceChar(character, newCharacter)

* D. string.replaceString(character, newCharacter)

**Answer:** A
**Explanation:** `replace(char oldChar, char newChar)` is used for character replacement.

### Question 30

Which of the following methods can be used to split a String into an array of substrings in Java?

* A. string.split(separator)

* B. string.splitString(separator)

* C. string.split(separator, limit)

* D. string.splitString(separator, limit)

**Answer:** A
**Explanation:** `split(String regex)` is the basic signature used to split strings into string arrays.

### Question 31

What is the output?

```
public class Main {
    public static void main(String[] args) {
        String s = "Java";
        s.concat(" SE 21");
        s.replace('a', 'o');
        System.out.println(s);
    }
}

```

* A. Java

* B. Java SE 21

* C. Jovo

* D. Jovo SE 21

**Answer:** A
**Explanation:** Strings are immutable. `concat()` and `replace()` return new strings, but their return values are ignored, so `s` remains `"Java"`.

### Question 32

What is the output of the following program?

```
public class Main {
    public static void main(String[] args) {
        String s1 = "Hello";
        String s2 = new String("Hello");
        String s3 = s2.intern();

        System.out.println((s1 == s2) + " " + s1.equals(s2));
        System.out.println((s1 == s3) + " " + (s2 == s3));
    }
}

```

* A. false true / true false

* B. false true / false true

* C. true true / true false

* D. true false / false true

**Answer:** A
**Explanation:** `s1 == s2` is `false` (different references). `s1.equals(s2)` is `true` (same value). `s3` gets the canonical pool instance equal to `s1`, so `s1 == s3` is `true` and `s2 == s3` is `false`.

### Question 33

What is the output of the following program?

```
public class Main {
    public static void main(String[] args) {
        String str = "java";
        System.out.println(str + "c");
        System.out.println('j' + 'a' + 'v' + 'a');
    }
}

```

* A. javac / 418

* B. javac / java

* C. javac / javac

* D. java c / 418

**Answer:** A
**Explanation:** `str + "c"` concatenates strings to print `"javac"`. `'j'+'a'+'v'+'a'` performs numeric addition of ASCII char values (`106 + 97 + 118 + 97 = 418`).

### Question 34

What will this block of code print?

```
public class Main {
    public static void main(String[] args) {
        String str = null;
        str += "code";
        System.out.println(str);
    }
}

```

* A. nullcode

* B. code

* C. NullPointerException

* D. compilation error

**Answer:** A
**Explanation:** `str += "code"` evaluates `String.valueOf(str) + "code"`, turning `null` into `"null"` and resulting in `"nullcode"`.