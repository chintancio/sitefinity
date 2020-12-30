using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Web.Mvc; 
using Telerik.Sitefinity.Mvc;
using SitefinityWebApp.Mvc.Models;
using DataAccessLayer;
using System.Data;
using System.Globalization;
using Telerik.Sitefinity.Security.Claims;

namespace SitefinityWebApp.Mvc.Controllers
{
    [ControllerToolboxItem(Name = "ProfileWidget", Title = "Profile Widget", SectionName = "MvcWidgets")] 

    public class ProfileController : Controller 
       {
        [Category("String Properties")] 
           public string Message { get; set; } 
   
  
           public ActionResult Index()
           { 
               var model = new ProfileModel();
               //Current User
               var identity = ClaimsManager.GetCurrentIdentity();

               //Get information about the user
               string userId = identity.UserId.ToString();

               //To Display Temp Value 
               if (userId == "00000000-0000-0000-0000-000000000000")
                   userId = "6ef9076e-59ba-413a-aafb-71bcdd18801a";
               
               //Get UserInfo Details
               List<ProfileModel> profileDetails = new List<ProfileModel>();
               profileDetails = (from DataRow dr in DataAccess.GetUserInfoDetails(userId).Rows
                   select new ProfileModel()
                   {
                       Name = dr["Name"].ToString(),
                       Address = dr["Address"].ToString(),
                       Country = dr["Country"].ToString(),
                       Birthdate = DateTime.Parse(dr["Birthdate"].ToString()).ToString("dd MMMM yyyy", CultureInfo.InvariantCulture),
                       Age =  (DateTime.Now.Year - DateTime.Parse(dr["Birthdate"].ToString()).Year).ToString(),
                       Hobby = dr["Hobby"].ToString(),
                       Language = dr["Language"].ToString(),
                       FavoriteMovie = dr["FavoriteMovie"].ToString(),
                       FavoriteSeries = dr["FavoriteSeries"].ToString()
                   }).ToList();

               return View("Default", profileDetails[0]); 

           }
    } 

    
}