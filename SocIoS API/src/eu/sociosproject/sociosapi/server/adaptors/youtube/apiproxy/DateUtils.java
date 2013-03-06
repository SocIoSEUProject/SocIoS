package eu.sociosproject.sociosapi.server.adaptors.youtube.apiproxy;

import java.util.Date;
import java.util.GregorianCalendar;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 *
 * @author kGiannakakis
 */
public class DateUtils {
    public static XMLGregorianCalendar getXMLGregorianCalendar(Date date) {
        if (date == null) {
            return null;
        }

        GregorianCalendar gc = new GregorianCalendar();
        gc.setTimeInMillis(date.getTime());

        DatatypeFactory df = null;
        try {
            df = DatatypeFactory.newInstance();
        } catch (DatatypeConfigurationException ex) {
            return null;
        }

        return df.newXMLGregorianCalendar(gc);        
    }    
}
