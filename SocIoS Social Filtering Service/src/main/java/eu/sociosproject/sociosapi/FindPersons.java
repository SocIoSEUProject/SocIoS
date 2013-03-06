
package eu.sociosproject.sociosapi;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import eu.sociosproject.sociosvoc.MediaItemIdList;
import eu.sociosproject.sociosvoc.PersonFilter;


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
 *         &lt;element name="personFilter" type="{http://www.sociosproject.eu/sociosVoc/}PersonFilter"/>
 *         &lt;element name="mediaItemIdList" type="{http://www.sociosproject.eu/sociosVoc/}MediaItemIdList"/>
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
    "personFilter",
    "mediaItemIdList"
})
@XmlRootElement(name = "FindPersons")
public class FindPersons {

    @XmlElement(required = true)
    protected String sociosApiUserKey;
    @XmlElement(required = true)
    protected PersonFilter personFilter;
    @XmlElement(required = true)
    protected MediaItemIdList mediaItemIdList;

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

}
