
package eu.sociosproject.sociosapi;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import eu.sociosproject.sociosvoc.ActivityIdList;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sociosApiUserKey" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="activityIds" type="{http://www.sociosproject.eu/sociosVoc/}ActivityIdList"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "sociosApiUserKey",
    "activityIds"
})
@XmlRootElement(name = "FindConnectedActivities")
public class FindConnectedActivities {

    @XmlElement(required = true)
    protected String sociosApiUserKey;
    @XmlElement(required = true)
    protected ActivityIdList activityIds;

    /**
     * Gets the value of the sociosApiUserKey property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSociosApiUserKey() {
        return sociosApiUserKey;
    }

    /**
     * Sets the value of the sociosApiUserKey property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSociosApiUserKey(String value) {
        this.sociosApiUserKey = value;
    }

    /**
     * Gets the value of the activityIds property.
     * 
     * @return
     *     possible object is
     *     {@link ActivityIdList }
     *     
     */
    public ActivityIdList getActivityIds() {
        return activityIds;
    }

    /**
     * Sets the value of the activityIds property.
     * 
     * @param value
     *     allowed object is
     *     {@link ActivityIdList }
     *     
     */
    public void setActivityIds(ActivityIdList value) {
        this.activityIds = value;
    }

}
