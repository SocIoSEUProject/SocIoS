
package eu.sociosproject.sociosapi;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import eu.sociosproject.sociosvoc.ActivityFilter;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.PersonFilter;
import eu.sociosproject.sociosvoc.PersonIdList;


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
 *         &lt;element name="activityFilter" type="{http://www.sociosproject.eu/sociosVoc/}ActivityFilter"/>
 *         &lt;element name="personFilter" type="{http://www.sociosproject.eu/sociosVoc/}PersonFilter"/>
 *         &lt;element name="mediaItemIdList" type="{http://www.sociosproject.eu/sociosVoc/}MediaItemIdList"/>
 *         &lt;element name="personIdList" type="{http://www.sociosproject.eu/sociosVoc/}PersonIdList"/>
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
    "activityFilter",
    "personFilter",
    "mediaItemIdList",
    "personIdList"
})
@XmlRootElement(name = "FindActivities")
public class FindActivities {

    @XmlElement(required = true)
    protected String sociosApiUserKey;
    @XmlElement(required = true)
    protected ActivityFilter activityFilter;
    @XmlElement(required = true)
    protected PersonFilter personFilter;
    @XmlElement(required = true)
    protected MediaItemIdList mediaItemIdList;
    @XmlElement(required = true)
    protected PersonIdList personIdList;

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
     * Gets the value of the activityFilter property.
     * 
     * @return
     *     possible object is
     *     {@link ActivityFilter }
     *     
     */
    public ActivityFilter getActivityFilter() {
        return activityFilter;
    }

    /**
     * Sets the value of the activityFilter property.
     * 
     * @param value
     *     allowed object is
     *     {@link ActivityFilter }
     *     
     */
    public void setActivityFilter(ActivityFilter value) {
        this.activityFilter = value;
    }

    /**
     * Gets the value of the personFilter property.
     * 
     * @return
     *     possible object is
     *     {@link PersonFilter }
     *     
     */
    public PersonFilter getPersonFilter() {
        return personFilter;
    }

    /**
     * Sets the value of the personFilter property.
     * 
     * @param value
     *     allowed object is
     *     {@link PersonFilter }
     *     
     */
    public void setPersonFilter(PersonFilter value) {
        this.personFilter = value;
    }

    /**
     * Gets the value of the mediaItemIdList property.
     * 
     * @return
     *     possible object is
     *     {@link MediaItemIdList }
     *     
     */
    public MediaItemIdList getMediaItemIdList() {
        return mediaItemIdList;
    }

    /**
     * Sets the value of the mediaItemIdList property.
     * 
     * @param value
     *     allowed object is
     *     {@link MediaItemIdList }
     *     
     */
    public void setMediaItemIdList(MediaItemIdList value) {
        this.mediaItemIdList = value;
    }

    /**
     * Gets the value of the personIdList property.
     * 
     * @return
     *     possible object is
     *     {@link PersonIdList }
     *     
     */
    public PersonIdList getPersonIdList() {
        return personIdList;
    }

    /**
     * Sets the value of the personIdList property.
     * 
     * @param value
     *     allowed object is
     *     {@link PersonIdList }
     *     
     */
    public void setPersonIdList(PersonIdList value) {
        this.personIdList = value;
    }

}
