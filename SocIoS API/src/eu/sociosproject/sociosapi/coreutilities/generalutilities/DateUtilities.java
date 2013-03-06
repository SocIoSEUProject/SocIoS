/*
 * Copyright 2013 National Technical University of Athens
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
 
package eu.sociosproject.sociosapi.coreutilities.generalutilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 *
 * @author ang
 */
public class DateUtilities {

    public static Date asDate(XMLGregorianCalendar xgc) {
        if (xgc == null) {
            return null;
        }

        return xgc.toGregorianCalendar().getTime();
    }

    public static XMLGregorianCalendar asXMLGregorianCalendar(Date date) {
        if (date == null) {
            return null;
        }

        GregorianCalendar gc = new GregorianCalendar();
        gc.setTimeInMillis(date.getTime());

        DatatypeFactory df = null;
        try {
            df = DatatypeFactory.newInstance();
        } catch (DatatypeConfigurationException ex) {
            ex.printStackTrace();
            return null;
        }

        return df.newXMLGregorianCalendar(gc);
    }

    public static Date convert(String optString) {
        if (optString == null || optString.trim().length() == 0) {
            return null;
        }

        if (optString.startsWith("\"")) {
            optString = optString.substring(1, optString.length());
        }

        if (optString.endsWith("\"")) {
            optString = optString.substring(0, optString.length()-1);
        }

        if (optString.length() != 19) {
            return null;
        }
        
        int optYear = Integer.parseInt(optString.substring(0, 4));
        int optMonth = Integer.parseInt(optString.substring(5, 7));
        int optDay = Integer.parseInt(optString.substring(8, 10));
        int optHour = Integer.parseInt(optString.substring(11, 13));
        int optMinute = Integer.parseInt(optString.substring(14, 16));
        int optSecond = Integer.parseInt(optString.substring(17, 19));

        Date date = new Date();
        date.setYear(optYear - 1900);
        date.setMonth(optMonth - 1);
        date.setDate(optDay);
        date.setHours(optHour);
        date.setMinutes(optMinute);
        date.setSeconds(optSecond);

        return date;
    }

    public static Date timeStamptoDate(Long optInt) {
        long timeStamp = (long) optInt * 1000;
        Date date = new Date(timeStamp);

        return date;
    }
    
//    public static long datetoTimestamp(String str_date) {
//    	DateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
//    	Date date;
//		try {
//			date = (Date)formatter.parse(str_date);
//		
//    	java.sql.Timestamp timeStampDate = new 
//    	    	Timestamp(date.getTime());
//    	return timeStampDate;
//    	
//		} catch (ParseException e) {
//			System.out.println("datetoTimestamp: ParseException ");
//			e.printStackTrace();
//		}	
//		
//    }
    
    public static Date stringToDate(String str_date)
    {
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/mm/dd");
      Date convertedDate;
	try {
		convertedDate = dateFormat.parse(str_date);
		return convertedDate;
	} catch (ParseException e) {
		System.out.println("ParseException in stringToDate method");
		e.printStackTrace();
		return null;
	}
      

      }    
    
}