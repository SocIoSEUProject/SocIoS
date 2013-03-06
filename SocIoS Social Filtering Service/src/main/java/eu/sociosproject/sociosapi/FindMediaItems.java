
package eu.sociosproject.sociosapi;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import eu.sociosproject.sociosvoc.MediaItemFilter;
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
 *         &lt;element name="filterMediaItem" type="{http://www.sociosproject.eu/sociosVoc/}MediaItemFilter"/>
 *         &lt;element name="filterPerson" type="{http://www.sociosproject.eu/sociosVoc/}PersonFilter"/>
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
    "filterMediaItem",
    "filterPerson",
    "personIdList"
})
@XmlRootElement(name = "FindMediaItems")
public class FindMediaItems {

    @XmlElement(required = true)
    protected String sociosApiUserKey;
    @XmlElement(required = true)
    protected MediaItemFilter filterMediaItem;
    @XmlElement(required = true)
    protected PersonFilter filterPerson;
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
     * Gets the value of the filterMediaItem property.
     * 
     * @return
     *     possible object is
     *     {@link MediaItemFilter }
     *     
     */
    public MediaItemFilter getFilterMediaItem() {
        return filterMediaItem;
    }

    /**
     * Sets the value of the filterMediaItem property.
     * 
     * @param value
     *     allowed object is
     *     {@link MediaItemFilter }
     *     
     */
    public void setFilterMediaItem(MediaItemFilter value) {
        this.filterMediaItem = value;
    }

    /**
     * Gets the value of the filterPerson property.
     * 
     * @return
     *     possible object is
     *     {@link PersonFilter }
     *     
     */
    public PersonFilter getFilterPerson() {
        return filterPerson;
    }

    /**
     * Sets the value of the filterPerson property.
     * 
     * @param value
     *     allowed object is
     *     {@link PersonFilter }
     *     
     */
    public void setFilterPerson(PersonFilter value) {
        this.filterPerson = value;
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
