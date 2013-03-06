
package eu.sociosproject.sociosapi;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;
import eu.sociosproject.sociosvoc.SociosException;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the eu.sociosproject.sociosapi package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _Fault_QNAME = new QName("http://www.sociosproject.eu/sociosApi/", "fault");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: eu.sociosproject.sociosapi
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link FindMediaItems }
     * 
     */
    public FindMediaItems createFindMediaItems() {
        return new FindMediaItems();
    }

    /**
     * Create an instance of {@link MyConnectedPersons }
     * 
     */
    public MyConnectedPersons createMyConnectedPersons() {
        return new MyConnectedPersons();
    }

    /**
     * Create an instance of {@link FindConnectedActivities }
     * 
     */
    public FindConnectedActivities createFindConnectedActivities() {
        return new FindConnectedActivities();
    }

    /**
     * Create an instance of {@link GetMediaItems }
     * 
     */
    public GetMediaItems createGetMediaItems() {
        return new GetMediaItems();
    }

    /**
     * Create an instance of {@link GetActivities }
     * 
     */
    public GetActivities createGetActivities() {
        return new GetActivities();
    }

    /**
     * Create an instance of {@link FindActivities }
     * 
     */
    public FindActivities createFindActivities() {
        return new FindActivities();
    }

    /**
     * Create an instance of {@link ConnectedPersons }
     * 
     */
    public ConnectedPersons createConnectedPersons() {
        return new ConnectedPersons();
    }

    /**
     * Create an instance of {@link GetPersons }
     * 
     */
    public GetPersons createGetPersons() {
        return new GetPersons();
    }

    /**
     * Create an instance of {@link FindPersons }
     * 
     */
    public FindPersons createFindPersons() {
        return new FindPersons();
    }

    /**
     * Create an instance of {@link InteractWithUser }
     * 
     */
    public InteractWithUser createInteractWithUser() {
        return new InteractWithUser();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SociosException }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://www.sociosproject.eu/sociosApi/", name = "fault")
    public JAXBElement<SociosException> createFault(SociosException value) {
        return new JAXBElement<SociosException>(_Fault_QNAME, SociosException.class, null, value);
    }

}
