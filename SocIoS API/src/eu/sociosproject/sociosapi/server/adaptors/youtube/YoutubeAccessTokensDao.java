package eu.sociosproject.sociosapi.server.adaptors.youtube;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokensDao;

public class YoutubeAccessTokensDao implements SnsAccessTokensDao<YoutubeAcessTokens>{

	@Override
	public YoutubeAcessTokens get(String sociosUserApiKey) {
		//return new YoutubeAcessTokens("<example SNS key1>", "<example SNS key2>");
		return new YoutubeAcessTokens("randomx");
	}
}
