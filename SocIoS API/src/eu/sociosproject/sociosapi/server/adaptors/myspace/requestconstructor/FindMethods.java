package eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor;

import java.util.HashSet;
import java.util.Set;

import eu.sociosproject.sociosvoc.MediaItem;
import eu.sociosproject.sociosvoc.MediaItemFilter;
import eu.sociosproject.sociosvoc.ObjectId;
import eu.sociosproject.sociosvoc.PersonFilter;

/**
 * @author kotelnikov
 */
public class FindMethods extends RequestUtility {

	private static final String SEARCH_IMAGES = "http://api.myspace.com/opensearch/images";

	private static final String SEARCH_VIDEOS = "http://api.myspace.com/opensearch/videos";

	public static String mediaImagesRequest(MediaItemFilter mediaItemFilter) {
		return mediaItemsRequest(mediaItemFilter, SEARCH_IMAGES);
	}

	public static String mediaImagesRequest(PersonFilter personFilter) {
		return mediaImagesRequest(personFilter, SEARCH_IMAGES);
	}

	private static String mediaImagesRequest(PersonFilter personFilter,
			String baseUrl) {
		if (personFilter == null) {
			return null;
		}
		StringBuilder url = newSearchUrl(baseUrl);
		if (personFilter.getDisplayName() != null) {
			StringBuilder keywords = new StringBuilder();
			for (String keyword : personFilter.getDisplayName().getKeyword()) {
				keywords.append(keyword).append(" ");
			}
			String totalKeywords = keywords.toString().trim()
					.replaceAll(" ", "%20");
			if (0 < totalKeywords.length()) {
				url.append("&searchTerms=").append(totalKeywords);
			}
		}
		return url.toString();
	}

	public static IFilter<MediaItem> mediaItemFilter(PersonFilter personFilter) {
		final Set<String> userIds = new HashSet<String>();
		for (ObjectId oid : personFilter.getId().getObjectId()) {
			userIds.add(toStringId(oid));
		}
		if (userIds.isEmpty()) {
			return new IFilter<MediaItem>() {
				@Override
				public boolean accept(MediaItem item) {
					return true;
				}
			};
		}
		return new IFilter<MediaItem>() {
			@Override
			public boolean accept(MediaItem item) {
				ObjectId userId = item.getUserId();
				String userIdStr = toStringId(userId);
				boolean result = userIds.contains(userIdStr);
				return result;
			}
		};
	}

	private static String mediaItemsRequest(MediaItemFilter mediaItemFilter,
			String baseUrl) {
		if (mediaItemFilter == null) {
			return null;
		}
		StringBuilder requestUrl = newSearchUrl(baseUrl);
		StringBuilder text = new StringBuilder();
		if (mediaItemFilter.getDescription() != null) {
			for (String keyword : mediaItemFilter.getDescription().getKeyword()) {
				text.append(keyword).append(" ");
			}
		}

		if (mediaItemFilter.getTitle() != null) {
			for (String keyword : mediaItemFilter.getTitle().getKeyword()) {
				text.append(keyword).append(" ");
			}
		}

		String totalText = text.toString().trim();
		if (0 < totalText.length()) {
			requestUrl.append("&searchTerms=").append(totalText);
		}

		StringBuilder tags = new StringBuilder();
		if (mediaItemFilter.getTags() != null) {
			for (String tag : mediaItemFilter.getTags().getKeyword()) {
				tags.append(tag).append(" ");
			}
		}

		// if (mediaItemFilter.getTaggedPeople() != null) {
		// for (String tagKeyword : mediaItemFilter
		// .getTaggedPeople()
		// .getKeyword()) {
		// tags.append(tagKeyword).append(" ");
		// }
		// }
		//
		 String totalTags = tags.toString().trim();
		 if (0 < totalTags.length()) {
		 requestUrl.append("&tags=").append(totalTags);
		 }

		return requestUrl.toString().replaceAll(" ", "%20").trim();
	}

	public static String mediaVideoRequest(MediaItemFilter mediaItemFilter) {
		return mediaItemsRequest(mediaItemFilter, SEARCH_VIDEOS);
	}

	public static String mediaVideoRequest(PersonFilter personFilter) {
		return mediaImagesRequest(personFilter, SEARCH_VIDEOS);
	}

	private static StringBuilder newSearchUrl(String base) {
		StringBuilder url = new StringBuilder();
		url.append(base);
		url.append("?format=");
		url.append("json");
		return url;
	}

}