package eu.sociosproject.sociosapi.server.adaptors.myspace;

import org.scribe.model.Token;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokens;

public class MySpaceAccessTokens implements SnsAccessTokens<MySpaceAdaptor> {

    private final String API_KEY = "373fe4e4a6c84b44a19c54261b40700d";

    private final String API_SECRET = "bed0523ea62845c29ba4342852710f3703d83ad4a0b447cca210ef8e91143b82";

    private Token fAccessToken;

    public MySpaceAccessTokens(String accessToken, String accessSecret) {
        fAccessToken = new Token(accessToken, accessSecret);
    }

    @Override
    public MySpaceAdaptor create() {
        return new MySpaceAdaptor(this);
    }

    public Token getAccessToken() {
        return fAccessToken;
    }

    public String getApiKey() {
        return API_KEY;
    }

    public String getApiSecret() {
        return API_SECRET;
    }
}
