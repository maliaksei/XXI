using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XXI.Century.WebSite.Models
{
    public class CarouselViewModel
    {
        public string Active { get; set; }
        public long Id { get; set; }
        public string Image { get; set; }
        public string Tittle { get; set; }
        public string SubTitle { get; set; }
        public string Text { get; set; }
        public string UrlToProdict { get; set; }
    }
}