package eu.sociosproject.sociosapi.server.adaptors.myspace.corefunctionalities;

import org.scribe.builder.api.DefaultApi10a;
import org.scribe.model.OAuthConfig;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;

public class MySpaceApi extends DefaultApi10a {

    private static final String AUTHORIZATION_URL = "http://api.myspace.com/authorize?oauth_token=%s&oauth_callback=%s";

    private OAuthConfig fConfig;

    @Override
    public OAuthService createService(OAuthConfig config) {
        fConfig = config;
        return super.createService(config);
    }

    @Override
    public String getAccessTokenEndpoint() {
        return "http://api.myspace.com/access_token";
    }

    @Override
    public Verb getAccessTokenVerb() {
        return Verb.GET;
    }

    @Override
    public String getAuthorizationUrl(Token requestToken) {
        return String.format(
            AUTHORIZATION_URL,
            requestToken.getToken(),
            fConfig.getCallback());
    }

    @Override
    public String getRequestTokenEndpoint() {
        return "http://api.myspace.com/request_token";
    }

    @Override
    public Verb getRequestTokenVerb() {
        return Verb.GET;
    }
}
