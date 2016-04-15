using System.Linq;
using Repository.Pattern.Ef6;
using Repository.Pattern.Infrastructure;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Services
{
    public class ProductTypeService
    {
        public IRepository<ProductTypeEntity> _productTypeRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public ProductTypeService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _productTypeRepository = new Repository<ProductTypeEntity>(_dataContext, _unitOfWork);
        }

        public IQueryable<ProductTypeEntity> GetProductTypes()
        {
            return _productTypeRepository.Queryable();
        }

        public ProductTypeEntity GetProductTypeById(long id)
        {
            return _productTypeRepository.Queryable().SingleOrDefault(x => x.Id == id);
        }

        public void UpdateProductType(ProductTypeDataModel productType)
        {
            var productTypeEntityModel = _productTypeRepository.Queryable().SingleOrDefault(x => x.Id == productType.Id);
            if (productTypeEntityModel == null) return;
            productTypeEntityModel.Name = productType.Name;
            productTypeEntityModel.Description = productType.Description;
            productTypeEntityModel.ObjectState = ObjectState.Modified;
            _productTypeRepository.Update(productTypeEntityModel);
            _dataContext.SaveChanges();
        }

        public void AddProductType(ProductTypeDataModel productType)
        {
            var entityModel = new ProductTypeEntity
            {
                Name = productType.Name,
                Description = productType.Description,
                ObjectState = ObjectState.Added
            };
            _productTypeRepository.Insert(entityModel);
            _dataContext.SaveChanges();
        }

        public void DeleteProductTypeById(long productTypeId)
        {
            var productType = _productTypeRepository.Queryable().SingleOrDefault(x => x.Id == productTypeId);
            if (productType != null)
            {
                _productTypeRepository.Delete(productType);
                _dataContext.SaveChanges();
            }
        }
    }
}