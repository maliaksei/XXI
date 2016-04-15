using System.Collections.Generic;
using System.Linq;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Century.WebSite.Mappings
{
    public class CategoryModelMapper
    {
        public static IEnumerable<CategoryItemViewModel> GetCategoryItems(IQueryable<CategoryEntity> productEntities)
        {
            var productItemsViewModel = new List<CategoryItemViewModel>();
            foreach (var item in productEntities)
            {
                productItemsViewModel.Add(new CategoryItemViewModel
                {
                   Id = item.Id,
                   Name = item.Name
                });
            }
            return productItemsViewModel;
        }
    }
}