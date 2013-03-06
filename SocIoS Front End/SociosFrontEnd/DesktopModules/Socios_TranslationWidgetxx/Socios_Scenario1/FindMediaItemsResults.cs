using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using SociosServices.WebSkeletonServiceLive;

namespace DotNetNuke.Modules.Socios_Scenario1
{
    public class FindMediaItemsResults
    {
        
        // A nice list for demonstration purposes.
       // private static List<CultureInfo> baseList =
        //  new List<CultureInfo>(CultureInfo.GetCultures(CultureTypes.AllCultures));

        private static List<MediaItem> baseList = new List<MediaItem>();

       

        // Our minimal SelectMethod.
        public static List<MediaItem> MinimalSelectMethod(
          string parameter1, string parameter2, int startRowIndex, int maximumRows)
        {
            maximumRows = 10;
            startRowIndex = (int)HttpContext.Current.Session["currentMediaItemsPage"];
            List<MediaItem> someList = GetSomeKindOfList(parameter1, parameter2);
            // Make sure we don't try to get objects that don't exist, ArgumentOutOfRangeException otherwise!
            if (startRowIndex + maximumRows > someList.Count)
            { maximumRows = someList.Count - startRowIndex; }
            return someList.GetRange(startRowIndex, maximumRows);
        }

        // Our minimal SelectCountMethod.
        public static int MinimalSelectCountMethod(string parameter1, string parameter2)
        {
            return GetSomeKindOfList(parameter1, parameter2).Count;
        }

        // A method to get a filtered list for our primary data source.
        public static List<MediaItem> GetSomeKindOfList(string parameter1, string parameter2)
        {

            return (List<MediaItem>)HttpContext.Current.Session["FindMediaItemsResultsCache"];

            //return baseList.FindAll(x => x.title.ToLower().StartsWith(parameter1))
            //  .FindAll(x => string.IsNullOrEmpty(parameter2.ToLower()) ||
            //    x.title.ToLower().EndsWith(parameter2.ToLower()));
        }
    }
}