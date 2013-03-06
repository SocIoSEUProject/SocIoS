package eu.sociosproject.sociosapi.server.adaptors.myspace;

import eu.sociosproject.sociosapi.server.adaptors.SnsAccessTokensDao;

public class MySpaceAccessTokensDao implements SnsAccessTokensDao<MySpaceAccessTokens>{

	@Override
	public MySpaceAccessTokens get(String sociosUserApiKey) {
		return new MySpaceAccessTokens("<example SNS key1>", "<example SNS key2>");
	}
}
