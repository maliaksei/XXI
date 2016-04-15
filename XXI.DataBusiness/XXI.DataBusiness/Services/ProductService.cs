using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;
using Repository.Pattern.Infrastructure;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services.Model;

namespace XXI.Centuty.DataBusiness.Services
{
    public class ProductService
    {
        public IRepository<ProductEntity> _productRepository;
        public IRepository<CategoryEntity> _categorRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public ProductService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _productRepository = new Repository<ProductEntity>(_dataContext, _unitOfWork);
            _categorRepository = new Repository<CategoryEntity>(_dataContext, _unitOfWork);
        }

        public IQueryable<ProductEntity> GetAllProducts()
        {
            return _productRepository.Queryable();
        }

        public IQueryable<ProductEntity> GetAllProductsByStatuses(IEnumerable<ProductStatus> productStatusList)
        {
            return _productRepository.Queryable().Where(x => productStatusList.Contains(x.Status));
        }

        public ProductEntity GetProductById(long id)
        {
            return _productRepository.Queryable().Include("ProductAttributeValues.ProductTypeAttribute").Include("Reviews.User").SingleOrDefault(x => x.Id == id);
        }

        public IQueryable<ProductEntity> GetProductsByCategoryId(long? categoryId)
        {
            return _productRepository.Queryable().Where(x => x.Categories.Any(y => y.Id == categoryId));
        }

        public ServiceResponseModel AddProduct(ProductDataModel dataModel)
        {
            var category = _categorRepository.Queryable().SingleOrDefault(x => x.Id == dataModel.CategoryId);
            var entityModel = new ProductEntity
            {
                Name = dataModel.Name,
                Description = dataModel.Description,
                Price = dataModel.Price,
                Image = dataModel.Image,
                Status = dataModel.ProductStatus,
                ProductTypeId = dataModel.ProductTypeId,
                ObjectState = ObjectState.Added
            };

            if (category != null)
            {
                entityModel.Categories.Add(category);
            }
            
            _productRepository.Insert(entityModel);
            try
            {
                _dataContext.SaveChanges();
                return new ServiceResponseModel
                {
                    CompletedStatus = CompletedStatus.Successed,
                    Data = entityModel.Id
                };
            }
            catch (Exception)
            {
                return new ServiceResponseModel
                {
                    CompletedStatus = CompletedStatus.Error
                };
            }

        }

        public ServiceResponseModel ChangeProductStatus(long productId, ProductStatus productStatus)
        {
            var product = _productRepository.Queryable().SingleOrDefault(x => x.Id == productId);
            if (product != null)
            {
                product.Status = productStatus;
                product.ObjectState = ObjectState.Modified;
                _productRepository.Update(product);

                try
                {
                    _dataContext.SaveChanges();
                    return new ServiceResponseModel { CompletedStatus = CompletedStatus.Successed };
                }
                catch (Exception)
                {
                    return new ServiceResponseModel { CompletedStatus = CompletedStatus.Error };
                }
            }
            return new ServiceResponseModel { CompletedStatus = CompletedStatus.Error };
        }
    }
}
