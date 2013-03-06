
package eu.sociosproject.sociosapi;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import eu.sociosproject.sociosvoc.ObjectId;


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
 *         &lt;element name="personId" type="{http://www.sociosproject.eu/sociosVoc/}ObjectId"/>
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
    "personId"
})
@XmlRootElement(name = "ConnectedPersons")
public class ConnectedPersons {

    @XmlElement(required = true)
    protected String sociosApiUserKey;
    @XmlElement(required = true)
    protected ObjectId personId;

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
     * Gets the value of the personId property.
     * 
     * @return
     *     possible object is
     *     {@link ObjectId }
     *     
     */
    public ObjectId getPersonId() {
        return personId;
    }

    /**
     * Sets the value of the personId property.
     * 
     * @param value
     *     allowed object is
     *     {@link ObjectId }
     *     
     */
    public void setPersonId(ObjectId value) {
        this.personId = value;
    }

}
