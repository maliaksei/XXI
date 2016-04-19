using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Century.WebSite.Mappings
{
    public static class CarouselModelMapper
    {
        public static IEnumerable<CarouselViewModel> GetcarouselItems(IQueryable<CarouselEntity> productEntities)
        {
            var productItemsViewModel = new List<CarouselViewModel>();
            int i = 0;
            foreach (var item in productEntities)
            {
                if(i == 0)
                {
                    productItemsViewModel.Add(new CarouselViewModel
                    {
                        Active = "active",
                        Id = item.Id,
                        Image = item.Image,
                        SubTitle = item.SubTitle,
                        Text = item.Text,
                        Tittle = item.Tittle,
                        UrlToProdict = item.UrlToProdict
                    });
                }
                else
                {
                    productItemsViewModel.Add(new CarouselViewModel
                    {
                        Active = "",
                        Id = item.Id,
                        Image = item.Image,
                        SubTitle = item.SubTitle,
                        Text = item.Text,
                        Tittle = item.Tittle,
                        UrlToProdict = item.UrlToProdict
                    });
                }
                i++;
            }
            return productItemsViewModel;
        }
    }
}