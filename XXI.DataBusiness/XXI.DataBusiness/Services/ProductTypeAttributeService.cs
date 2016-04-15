using System;
using System.Linq;
using Repository.Pattern.Ef6;
using Repository.Pattern.Infrastructure;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Services
{
    public class ProductTypeAttributeService
    {
        public IRepository<ProductTypeAttributeEntity> _productTypeAttributeRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public ProductTypeAttributeService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _productTypeAttributeRepository = new Repository<ProductTypeAttributeEntity>(_dataContext, _unitOfWork);
        }

        public IQueryable<ProductTypeAttributeEntity> GetProductTypeAttributes()
        {
            return _productTypeAttributeRepository.Queryable();
        }

        public IQueryable<ProductTypeAttributeEntity> GetProductTypeAttributesByProductTypeId(long productTypeId)
        {
            return _productTypeAttributeRepository.Queryable().Where(x => x.ProductTypeId == productTypeId);
        }

        public ProductTypeAttributeEntity GetProductTypeAttributesById(long id)
        {
            return _productTypeAttributeRepository.Queryable().SingleOrDefault(x => x.Id == id);
        }

        public void AddProductTypeAttribute(ProductTypeAttributeDataModel dataModel)
        {
            var entityModel = new ProductTypeAttributeEntity
            {
                Name = dataModel.Name,
                Description = dataModel.Description,
                ProductTypeId = dataModel.ProductTypeId,
                ObjectState = ObjectState.Added
            };
            _productTypeAttributeRepository.Insert(entityModel);
            _dataContext.SaveChanges();
        }

        public void UpdateProductTypeAttribute(ProductTypeAttributeDataModel datamodel)
        {
            var productTypeEntityModel = _productTypeAttributeRepository.Queryable().SingleOrDefault(x => x.Id == datamodel.Id);
            if (productTypeEntityModel == null) throw new ArgumentException("ProductTypeAttribute not foud");
            productTypeEntityModel.Name = datamodel.Name;
            productTypeEntityModel.Description = datamodel.Description;
            productTypeEntityModel.ObjectState = ObjectState.Modified;
            _productTypeAttributeRepository.Update(productTypeEntityModel);
            _dataContext.SaveChanges();
        }

        public void DeleteProductTypeAttribute(long id)
        {

            var productType = _productTypeAttributeRepository.Queryable().SingleOrDefault(x => x.Id == id);
            if (productType != null)
            {
                _productTypeAttributeRepository.Delete(productType);
                _dataContext.SaveChanges();
            }
        }
    }
}