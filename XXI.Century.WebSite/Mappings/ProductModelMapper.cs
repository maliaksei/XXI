using System.Collections.Generic;
using System.Linq;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Century.WebSite.Mappings
{
    public static class ProductModelMapper
    {
        public static IQueryable<ProductItemViewModel> GetProductItems(IQueryable<ProductEntity> productEntities)
        {
            return productEntities.Select(item => new ProductItemViewModel
            {
                ProductId = item.Id,
                Description = item.Description,
                ImagePath = item.Image,
                ProductName = item.Name,
                UnitPrice = item.Price
            }).AsQueryable();
        }

        public static ProductDetailsViewModel GetProductDetails(ProductEntity productEntity)
        {
            if (productEntity != null)
            {
                var attributes = productEntity.ProductAttributeValues.Select(x => new
                {
                    x.ValueName,
                    x.ProductTypeAttribute.Name
                }).ToDictionary(p => p.Name, p => p.ValueName);

                var reviews = productEntity.Reviews.Select(x => new { x.User.FirstName, x.Text, }).ToDictionary(p => p.FirstName, p => p.Text);

                return new ProductDetailsViewModel
                {
                    ProductId = productEntity.Id,
                    Description = productEntity.Description,
                    ImagePath = productEntity.Image,
                    ProductName = productEntity.Name,
                    UnitPrice = productEntity.Price,
                    Attributes = attributes,
                    Reviews = reviews
                };

            }
            return null;
        }
    }
}
