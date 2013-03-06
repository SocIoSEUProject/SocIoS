using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SociosServices;

namespace DotNetNuke.Modules.Socios_Scenario1
{
    public class TypesConverter
    {
        public static object ConvertPerson(object input, String inType, String outType)
        {
            if (inType.Equals("Core") && outType.Equals("Rec"))
            {

                SociosServices.RecommendationService.Person response = new SociosServices.RecommendationService.Person();
                SociosServices.WebSkeletonServiceLive.Person request = (SociosServices.WebSkeletonServiceLive.Person)input;

                System.Reflection.PropertyInfo[] properties = request.GetType().GetProperties();
                foreach (System.Reflection.PropertyInfo propertyInfo in properties)
                {
                    String propertyName = "";
                    String propertyValue = "";
                    Boolean isNull = true;

                    propertyName = propertyInfo.Name;
                    if (propertyInfo.GetValue(request, null) != null)
                    {
                        propertyValue = propertyInfo.GetValue(request, null).ToString();
                        isNull = false;
                    }

                    //Console.WriteLine(propertyName + " " + propertyValue);
                    if (!isNull)
                    {
                        if (propertyName.Equals("id"))
                        {
                            response.id = new SociosServices.RecommendationService.ObjectId();
                            response.id.id = request.id.id;
                            response.id.source = new SociosServices.RecommendationService.Source();
                            response.id.source.knownSnsSpecified = true;
                            if (request.id.source.Item.ToString().Equals("FLICKR"))
                                response.id.source.knownSns = SociosServices.RecommendationService.KnownSns.FLICKR;
                            else if (request.id.source.Item.ToString().Equals("DAILYMOTION"))
                                response.id.source.knownSns = SociosServices.RecommendationService.KnownSns.DAILYMOTION;
                            else if (request.id.source.Item.ToString().Equals("FACEBOOK"))
                                response.id.source.knownSns = SociosServices.RecommendationService.KnownSns.FACEBOOK;
                            else if (request.id.source.Item.ToString().Equals("MYSPACE"))
                                response.id.source.knownSns = SociosServices.RecommendationService.KnownSns.MYSPACE;
                            else if (request.id.source.Item.ToString().Equals("TWITTER"))
                                response.id.source.knownSns = SociosServices.RecommendationService.KnownSns.TWITTER;
                            else if (request.id.source.Item.ToString().Equals("YOUTUBE"))
                                response.id.source.knownSns = SociosServices.RecommendationService.KnownSns.YOUTUBE;


                        }
                        else if (propertyName.Equals("currentLocation"))
                        {
                            if (request.currentLocation != null)
                            {

                                response.currentLocation = new SociosServices.RecommendationService.Address();
                                response.currentLocation.country = request.currentLocation.country;
                                response.currentLocation.formatted = request.currentLocation.formatted;
                                response.currentLocation.latitude = request.currentLocation.latitude;
                                response.currentLocation.latitudeSpecified = request.currentLocation.latitudeSpecified;
                                response.currentLocation.extendedAddress = request.currentLocation.extendedAddress;
                                response.currentLocation.locality = request.currentLocation.locality;
                                response.currentLocation.longitude = request.currentLocation.longitude;
                                response.currentLocation.longitudeSpecified = request.currentLocation.longitudeSpecified;
                                response.currentLocation.poBox = request.currentLocation.poBox;
                                response.currentLocation.postalCode = request.currentLocation.postalCode;
                                response.currentLocation.primary = request.currentLocation.primary;
                                response.currentLocation.primarySpecified = request.currentLocation.primarySpecified;
                                response.currentLocation.region = request.currentLocation.region;
                                response.currentLocation.streetAddress = request.currentLocation.streetAddress;
                                response.currentLocation.type = request.currentLocation.type;

                            }

                        }
                        else if (propertyName.Equals("accounts"))
                        {
                            if (request.accounts != null)
                            {
                                response.accounts = new SociosServices.RecommendationService.Account();
                                response.accounts.domain = request.accounts.domain;
                                response.accounts.primary = request.accounts.primary;
                                response.accounts.primarySpecified = request.accounts.primarySpecified;
                                response.accounts.userid = new SociosServices.RecommendationService.ObjectId();
                                if (request.accounts.userid != null)
                                {
                                    response.accounts.userid.id = request.accounts.userid.id;
                                    response.accounts.userid.source = new SociosServices.RecommendationService.Source();

                                    if (request.accounts.userid.source.Item.ToString().Equals("FLICKR"))
                                        response.accounts.userid.source.knownSns = SociosServices.RecommendationService.KnownSns.FLICKR;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("DAILYMOTION"))
                                        response.accounts.userid.source.knownSns = SociosServices.RecommendationService.KnownSns.DAILYMOTION;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("FACEBOOK"))
                                        response.accounts.userid.source.knownSns = SociosServices.RecommendationService.KnownSns.FACEBOOK;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("MYSPACE"))
                                        response.accounts.userid.source.knownSns = SociosServices.RecommendationService.KnownSns.MYSPACE;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("TWITTER"))
                                        response.accounts.userid.source.knownSns = SociosServices.RecommendationService.KnownSns.TWITTER;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("YOUTUBE"))
                                        response.accounts.userid.source.knownSns = SociosServices.RecommendationService.KnownSns.YOUTUBE;
                                }



                            }
                        }
                        else if (propertyName.Equals("addresses"))
                        {
                            if (request.addresses != null)
                            {
                                response.addresses = new SociosServices.RecommendationService.Address[request.addresses.Length];
                                for (int lll = 0; lll < response.addresses.Length; lll++)
                                {
                                    response.addresses[lll] = new SociosServices.RecommendationService.Address();
                                    response.addresses[lll].country = request.addresses[lll].country;
                                    response.addresses[lll].formatted = request.addresses[lll].formatted;
                                    response.addresses[lll].latitude = request.addresses[lll].latitude;
                                    response.addresses[lll].latitudeSpecified = request.addresses[lll].latitudeSpecified;
                                    response.addresses[lll].extendedAddress = request.addresses[lll].extendedAddress;
                                    response.addresses[lll].locality = request.addresses[lll].locality;
                                    response.addresses[lll].longitude = request.addresses[lll].longitude;
                                    response.addresses[lll].longitudeSpecified = request.addresses[lll].longitudeSpecified;
                                    response.addresses[lll].poBox = request.addresses[lll].poBox;
                                    response.addresses[lll].postalCode = request.addresses[lll].postalCode;
                                    response.addresses[lll].primary = request.addresses[lll].primary;
                                    response.addresses[lll].primarySpecified = request.addresses[lll].primarySpecified;
                                    response.addresses[lll].region = request.addresses[lll].region;
                                    response.addresses[lll].streetAddress = request.addresses[lll].streetAddress;
                                    response.addresses[lll].type = request.addresses[lll].type;
                                }

                            }

                        }
                        else if (propertyName.Equals("name"))
                        {
                            response.name = new SociosServices.RecommendationService.Name();
                            response.name.additionalName = request.name.additionalName;
                            response.name.familyName = request.name.familyName;
                            response.name.formatted = request.name.formatted;
                            response.name.givenName = request.name.givenName;
                            response.name.honorificPrefix = request.name.honorificPrefix;
                            response.name.honorificSuffix = request.name.honorificSuffix;

                        }
                        else if (propertyName.Equals("networkPresence"))
                        {

                            if (request.networkPresence.Equals("AWAY"))
                                response.networkPresence = SociosServices.RecommendationService.NetworkPresence.AWAY;
                            else if (request.networkPresence.Equals("CHAT"))
                                response.networkPresence = SociosServices.RecommendationService.NetworkPresence.CHAT;
                            else if (request.networkPresence.Equals("DND"))
                                response.networkPresence = SociosServices.RecommendationService.NetworkPresence.DND;
                            else if (request.networkPresence.Equals("OFFLINE"))
                                response.networkPresence = SociosServices.RecommendationService.NetworkPresence.OFFLINE;
                            else if (request.networkPresence.Equals("ONLINE"))
                                response.networkPresence = SociosServices.RecommendationService.NetworkPresence.ONLINE;
                            else if (request.networkPresence.Equals("XA"))
                                response.networkPresence = SociosServices.RecommendationService.NetworkPresence.XA;


                        }
                        else if (propertyName.Equals("organizations"))
                        {

                            if (request.organizations != null)
                            {
                                response.organizations = new SociosServices.RecommendationService.Organization[request.organizations.Length];

                                for (int lll = 0; lll < response.organizations.Length; lll++)
                                {
                                    response.organizations[lll] = new SociosServices.RecommendationService.Organization();

                                    if (request.organizations[lll].address != null)
                                    {
                                        response.organizations[lll].address = new SociosServices.RecommendationService.Address();
                                        response.organizations[lll].address.country = request.organizations[lll].address.country;
                                        response.organizations[lll].address.formatted = request.organizations[lll].address.formatted;
                                        response.organizations[lll].address.latitude = request.organizations[lll].address.latitude;
                                        response.organizations[lll].address.latitudeSpecified = request.organizations[lll].address.latitudeSpecified;
                                        response.organizations[lll].address.extendedAddress = request.organizations[lll].address.extendedAddress;
                                        response.organizations[lll].address.locality = request.organizations[lll].address.locality;
                                        response.organizations[lll].address.longitude = request.organizations[lll].address.longitude;
                                        response.organizations[lll].address.longitudeSpecified = request.organizations[lll].address.longitudeSpecified;
                                        response.organizations[lll].address.poBox = request.organizations[lll].address.poBox;
                                        response.organizations[lll].address.postalCode = request.organizations[lll].address.postalCode;
                                        response.organizations[lll].address.primary = request.organizations[lll].address.primary;
                                        response.organizations[lll].address.primarySpecified = request.organizations[lll].address.primarySpecified;
                                        response.organizations[lll].address.region = request.organizations[lll].address.region;
                                        response.organizations[lll].address.streetAddress = request.organizations[lll].address.streetAddress;
                                        response.organizations[lll].address.type = request.organizations[lll].address.type;

                                    }
                                    response.organizations[lll].department = request.organizations[lll].department;
                                    response.organizations[lll].description = request.organizations[lll].description;
                                    response.organizations[lll].endDate = request.organizations[lll].endDate;
                                    response.organizations[lll].endDateSpecified = request.organizations[lll].endDateSpecified;
                                    response.organizations[lll].field = request.organizations[lll].field;
                                    response.organizations[lll].name = request.organizations[lll].name;
                                    response.organizations[lll].salary = request.organizations[lll].salary;

                                    response.organizations[lll].startDate = request.organizations[lll].startDate;
                                    response.organizations[lll].startDateSpecified = request.organizations[lll].startDateSpecified;
                                    response.organizations[lll].subField = request.organizations[lll].subField;
                                    response.organizations[lll].title = request.organizations[lll].title;


                                    response.organizations[lll].type = request.organizations[lll].type;
                                    response.organizations[lll].webpage = request.organizations[lll].webpage;

                                }
                            }




                        }
                        else
                        {
                            System.Reflection.PropertyInfo responseInfo = response.GetType().GetProperty(propertyInfo.Name);
                            responseInfo.SetValue(response, propertyInfo.GetValue(request, null), null);
                        }
                    }
                    else
                    {
                        //Console.WriteLine("It is null i don't even check it");
                    }

                }

                return response;
            }
            else if (inType.Equals("Core") && outType.Equals("Rep"))
            {

                SociosServices.ReputationService.Person response = new SociosServices.ReputationService.Person();
                SociosServices.WebSkeletonServiceLive.Person request = (SociosServices.WebSkeletonServiceLive.Person)input;

                System.Reflection.PropertyInfo[] properties = request.GetType().GetProperties();
                foreach (System.Reflection.PropertyInfo propertyInfo in properties)
                {
                    String propertyName = "";
                    String propertyValue = "";
                    Boolean isNull = true;

                    propertyName = propertyInfo.Name;
                    if (propertyInfo.GetValue(request, null) != null)
                    {
                        propertyValue = propertyInfo.GetValue(request, null).ToString();
                        isNull = false;
                    }

                    //Console.WriteLine(propertyName + " " + propertyValue);
                    if (!isNull)
                    {
                        if (propertyName.Equals("id"))
                        {
                            response.id = new SociosServices.ReputationService.ObjectId();
                            response.id.id = request.id.id;
                            response.id.source = new SociosServices.ReputationService.Source();
                            response.id.source.knownSnsSpecified = true;
                            if (request.id.source.Item.ToString().Equals("FLICKR"))
                                response.id.source.knownSns = SociosServices.ReputationService.KnownSns.FLICKR;
                            else if (request.id.source.Item.ToString().Equals("DAILYMOTION"))
                                response.id.source.knownSns = SociosServices.ReputationService.KnownSns.DAILYMOTION;
                            else if (request.id.source.Item.ToString().Equals("FACEBOOK"))
                                response.id.source.knownSns = SociosServices.ReputationService.KnownSns.FACEBOOK;
                            else if (request.id.source.Item.ToString().Equals("MYSPACE"))
                                response.id.source.knownSns = SociosServices.ReputationService.KnownSns.MYSPACE;
                            else if (request.id.source.Item.ToString().Equals("TWITTER"))
                                response.id.source.knownSns = SociosServices.ReputationService.KnownSns.TWITTER;
                            else if (request.id.source.Item.ToString().Equals("YOUTUBE"))
                                response.id.source.knownSns = SociosServices.ReputationService.KnownSns.YOUTUBE;


                        }
                        else if (propertyName.Equals("currentLocation"))
                        {
                            if (request.currentLocation != null)
                            {

                                response.currentLocation = new SociosServices.ReputationService.Address();
                                response.currentLocation.country = request.currentLocation.country;
                                response.currentLocation.formatted = request.currentLocation.formatted;
                                response.currentLocation.latitude = request.currentLocation.latitude;
                                response.currentLocation.latitudeSpecified = request.currentLocation.latitudeSpecified;
                                response.currentLocation.extendedAddress = request.currentLocation.extendedAddress;
                                response.currentLocation.locality = request.currentLocation.locality;
                                response.currentLocation.longitude = request.currentLocation.longitude;
                                response.currentLocation.longitudeSpecified = request.currentLocation.longitudeSpecified;
                                response.currentLocation.poBox = request.currentLocation.poBox;
                                response.currentLocation.postalCode = request.currentLocation.postalCode;
                                response.currentLocation.primary = request.currentLocation.primary;
                                response.currentLocation.primarySpecified = request.currentLocation.primarySpecified;
                                response.currentLocation.region = request.currentLocation.region;
                                response.currentLocation.streetAddress = request.currentLocation.streetAddress;
                                response.currentLocation.type = request.currentLocation.type;

                            }

                        }
                        else if (propertyName.Equals("accounts"))
                        {
                            if (request.accounts != null)
                            {
                                response.accounts = new SociosServices.ReputationService.Account();
                                response.accounts.domain = request.accounts.domain;
                                response.accounts.primary = request.accounts.primary;
                                response.accounts.primarySpecified = request.accounts.primarySpecified;
                                response.accounts.userid = new SociosServices.ReputationService.ObjectId();
                                if (request.accounts.userid != null)
                                {
                                    response.accounts.userid.id = request.accounts.userid.id;
                                    response.accounts.userid.source = new SociosServices.ReputationService.Source();

                                    if (request.accounts.userid.source.Item.ToString().Equals("FLICKR"))
                                        response.accounts.userid.source.knownSns = SociosServices.ReputationService.KnownSns.FLICKR;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("DAILYMOTION"))
                                        response.accounts.userid.source.knownSns = SociosServices.ReputationService.KnownSns.DAILYMOTION;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("FACEBOOK"))
                                        response.accounts.userid.source.knownSns = SociosServices.ReputationService.KnownSns.FACEBOOK;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("MYSPACE"))
                                        response.accounts.userid.source.knownSns = SociosServices.ReputationService.KnownSns.MYSPACE;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("TWITTER"))
                                        response.accounts.userid.source.knownSns = SociosServices.ReputationService.KnownSns.TWITTER;
                                    else if (request.accounts.userid.source.Item.ToString().Equals("YOUTUBE"))
                                        response.accounts.userid.source.knownSns = SociosServices.ReputationService.KnownSns.YOUTUBE;
                                }



                            }
                        }
                        else if (propertyName.Equals("addresses"))
                        {
                            if (request.addresses != null)
                            {
                                response.addresses = new SociosServices.ReputationService.Address[request.addresses.Length];
                                for (int lll = 0; lll < response.addresses.Length; lll++)
                                {
                                    response.addresses[lll] = new SociosServices.ReputationService.Address();
                                    response.addresses[lll].country = request.addresses[lll].country;
                                    response.addresses[lll].formatted = request.addresses[lll].formatted;
                                    response.addresses[lll].latitude = request.addresses[lll].latitude;
                                    response.addresses[lll].latitudeSpecified = request.addresses[lll].latitudeSpecified;
                                    response.addresses[lll].extendedAddress = request.addresses[lll].extendedAddress;
                                    response.addresses[lll].locality = request.addresses[lll].locality;
                                    response.addresses[lll].longitude = request.addresses[lll].longitude;
                                    response.addresses[lll].longitudeSpecified = request.addresses[lll].longitudeSpecified;
                                    response.addresses[lll].poBox = request.addresses[lll].poBox;
                                    response.addresses[lll].postalCode = request.addresses[lll].postalCode;
                                    response.addresses[lll].primary = request.addresses[lll].primary;
                                    response.addresses[lll].primarySpecified = request.addresses[lll].primarySpecified;
                                    response.addresses[lll].region = request.addresses[lll].region;
                                    response.addresses[lll].streetAddress = request.addresses[lll].streetAddress;
                                    response.addresses[lll].type = request.addresses[lll].type;
                                }

                            }

                        }
                        else if (propertyName.Equals("name"))
                        {
                            response.name = new SociosServices.ReputationService.Name();
                            response.name.additionalName = request.name.additionalName;
                            response.name.familyName = request.name.familyName;
                            response.name.formatted = request.name.formatted;
                            response.name.givenName = request.name.givenName;
                            response.name.honorificPrefix = request.name.honorificPrefix;
                            response.name.honorificSuffix = request.name.honorificSuffix;

                        }
                        else if (propertyName.Equals("networkPresence"))
                        {

                            if (request.networkPresence.Equals("AWAY"))
                                response.networkPresence = SociosServices.ReputationService.NetworkPresence.AWAY;
                            else if (request.networkPresence.Equals("CHAT"))
                                response.networkPresence = SociosServices.ReputationService.NetworkPresence.CHAT;
                            else if (request.networkPresence.Equals("DND"))
                                response.networkPresence = SociosServices.ReputationService.NetworkPresence.DND;
                            else if (request.networkPresence.Equals("OFFLINE"))
                                response.networkPresence = SociosServices.ReputationService.NetworkPresence.OFFLINE;
                            else if (request.networkPresence.Equals("ONLINE"))
                                response.networkPresence = SociosServices.ReputationService.NetworkPresence.ONLINE;
                            else if (request.networkPresence.Equals("XA"))
                                response.networkPresence = SociosServices.ReputationService.NetworkPresence.XA;


                        }
                        else if (propertyName.Equals("organizations"))
                        {

                            if (request.organizations != null)
                            {
                                response.organizations = new SociosServices.ReputationService.Organization[request.organizations.Length];

                                for (int lll = 0; lll < response.organizations.Length; lll++)
                                {
                                    response.organizations[lll] = new SociosServices.ReputationService.Organization();

                                    if (request.organizations[lll].address != null)
                                    {
                                        response.organizations[lll].address = new SociosServices.ReputationService.Address();
                                        response.organizations[lll].address.country = request.organizations[lll].address.country;
                                        response.organizations[lll].address.formatted = request.organizations[lll].address.formatted;
                                        response.organizations[lll].address.latitude = request.organizations[lll].address.latitude;
                                        response.organizations[lll].address.latitudeSpecified = request.organizations[lll].address.latitudeSpecified;
                                        response.organizations[lll].address.extendedAddress = request.organizations[lll].address.extendedAddress;
                                        response.organizations[lll].address.locality = request.organizations[lll].address.locality;
                                        response.organizations[lll].address.longitude = request.organizations[lll].address.longitude;
                                        response.organizations[lll].address.longitudeSpecified = request.organizations[lll].address.longitudeSpecified;
                                        response.organizations[lll].address.poBox = request.organizations[lll].address.poBox;
                                        response.organizations[lll].address.postalCode = request.organizations[lll].address.postalCode;
                                        response.organizations[lll].address.primary = request.organizations[lll].address.primary;
                                        response.organizations[lll].address.primarySpecified = request.organizations[lll].address.primarySpecified;
                                        response.organizations[lll].address.region = request.organizations[lll].address.region;
                                        response.organizations[lll].address.streetAddress = request.organizations[lll].address.streetAddress;
                                        response.organizations[lll].address.type = request.organizations[lll].address.type;

                                    }
                                    response.organizations[lll].department = request.organizations[lll].department;
                                    response.organizations[lll].description = request.organizations[lll].description;
                                    response.organizations[lll].endDate = request.organizations[lll].endDate;
                                    response.organizations[lll].endDateSpecified = request.organizations[lll].endDateSpecified;
                                    response.organizations[lll].field = request.organizations[lll].field;
                                    response.organizations[lll].name = request.organizations[lll].name;
                                    response.organizations[lll].salary = request.organizations[lll].salary;

                                    response.organizations[lll].startDate = request.organizations[lll].startDate;
                                    response.organizations[lll].startDateSpecified = request.organizations[lll].startDateSpecified;
                                    response.organizations[lll].subField = request.organizations[lll].subField;
                                    response.organizations[lll].title = request.organizations[lll].title;


                                    response.organizations[lll].type = request.organizations[lll].type;
                                    response.organizations[lll].webpage = request.organizations[lll].webpage;

                                }
                            }




                        }
                        else
                        {
                            System.Reflection.PropertyInfo responseInfo = response.GetType().GetProperty(propertyInfo.Name);
                            responseInfo.SetValue(response, propertyInfo.GetValue(request, null), null);
                        }
                    }
                    else
                    {
                        string i = "It is null i don't even check it";//Console.WriteLine("It is null i don't even check it");
                    }
                }

                return response;

            }
            else
                return null;

        }
    }
}