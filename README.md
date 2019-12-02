# Jerset client in integrationtest

Issue using `fish.payara.extras:payara-embedded-web:5.193.1` and `org.glassfish.jersey.core:jersey-client:2.29`

## About

The `pom.xml` is constructed from `pom.xml.in` using `build-pom.sh`.
It is basically an effective-pom without *Management and version properties

The `EmptyTest.java` contains a JerseyClient (javax.ws.rs.client.Client),
and a simple invocation og said client.

The reult of this seems to be:

    java.lang.NoSuchMethodError: org.glassfish.jersey.internal.LocalizationMessages.WARNING_PROPERTIES()Ljava/lang/String;


If you comment out `fish.payara.extras:payara-embedded-web`, the difference in `mvn dependency:tree` is

    --- without	2019-12-02 10:31:04.556687376 +0100
    +++ with	2019-12-02 10:30:55.288638153 +0100
    @@ -1,5 +1,6 @@
     [INFO] dk.dbc:jersey-integration-test:war:1.0-SNAPSHOT
     [INFO] +- javax:javaee-web-api:jar:8.0:provided
    +[INFO] +- fish.payara.extras:payara-embedded-web:jar:5.193.1:provided
     [INFO] +- junit:junit:jar:4.12:test
     [INFO] |  \- org.hamcrest:hamcrest-core:jar:1.3:test
     [INFO] +- org.glassfish.jersey.core:jersey-client:jar:2.29:test

However the test goes through

If you revert to `payara-embedded-web:5.193` and `jersey-client:2.27` (and dependencies), it goes through too.
Any one isn't enough though.


Using `payara-embedded-all` instead doesn't change anything.
