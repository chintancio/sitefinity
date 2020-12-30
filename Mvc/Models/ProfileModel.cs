using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SitefinityWebApp.Mvc.Models
{
    public class ProfileModel
    {     
        //Profile Info
        public string Name { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string Birthdate { get; set; }
        public string Age { get; set; }
        public string Hobby { get; set; }
        public string Language { get; set; }
        public string FavoriteMovie { get; set; }
        public string FavoriteSeries { get; set; }

    }
}
