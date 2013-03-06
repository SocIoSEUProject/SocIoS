using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace MySpaceID_OAuth.Core
{
    public class Constants
    {
        
        public static readonly string MySpaceID = "http://api.myspace.com/VANITY_NAME";
        public static readonly string API_MYSPACE_COM = "http://api.myspace.com";


        /// <summary>
        /// insert offsite consumer key here
        /// </summary>
        public static readonly string ConsumerKey = "373fe4e4a6c84b44a19c54261b40700d";

        /// <summary>
        /// Insert offsite consumer secret here
        /// </summary>
        public static readonly string ConsumerSecret = "bed0523ea62845c29ba4342852710f3703d83ad4a0b447cca210ef8e91143b82";

        /// <summary>
        /// insert onsite consumer key here
        /// </summary>
        public static readonly string OnSiteConsumerKey = "INSERT_ONSITE_CONSUMER_KEY_HERE";

        /// <summary>
        /// Insert onsite consumer secret here
        /// </summary>
        public static readonly string OnSiteConsumerSecret = "INSERT_ONSITE_CONSUMER_SECRET_HERE";

    }
}
