package eu.sociosproject.sociosapi.server.adaptors.youtube;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokens;

public class YoutubeAcessTokens implements SnsAccessTokens<YoutubeAdaptor>{

	private final String token;	
	
	public YoutubeAcessTokens(String token) {
		this.token = token;
	}

	public String getToken() {
		return token;
	}

	@Override
	public YoutubeAdaptor create() {
		return new YoutubeAdaptor(this);
	}
}
