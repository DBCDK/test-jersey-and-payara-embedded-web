import javax.ws.rs.client.Client;
import org.glassfish.jersey.client.JerseyClientBuilder;
import org.junit.Test;

public class EmptyTest {

    @Test(timeout = 30_000L)
    public void test() throws Exception {

        Client client = JerseyClientBuilder.newBuilder()
                .build();

        client.target("http://example.com/")
                .request().get(String.class);

        System.out.println("OK");
    }
}
