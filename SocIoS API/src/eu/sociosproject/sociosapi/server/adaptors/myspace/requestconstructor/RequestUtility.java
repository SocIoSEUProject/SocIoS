/**
 * 
 */
package eu.sociosproject.sociosapi.server.adaptors.myspace.requestconstructor;

import eu.sociosproject.sociosvoc.ObjectId;

/**
 * @author kotelnikov
 */
public class RequestUtility {

    public interface IFilter<T> {
        boolean accept(T item);
    }

    public static String toStringId(ObjectId oid) {
        return oid.getId().toString();
    }
}
