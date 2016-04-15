using System;
using System.Collections.Generic;
using System.Linq;
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
    public class ProductTypeAttributeValueService
    {
        public IRepository<ProductTypeAttributeValueEntity> _productTypeAttributeValueRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public ProductTypeAttributeValueService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _productTypeAttributeValueRepository = new Repository<ProductTypeAttributeValueEntity>(_dataContext, _unitOfWork);
        }

        public ServiceResponseModel AddProductAttributeValues(IEnumerable<ProductTypeAttributeValueDataModel> attributeValueDataModels)
        {
            var productAttributeValueEntityList =
                attributeValueDataModels.Select(item => new ProductTypeAttributeValueEntity
                {
                    ObjectState = ObjectState.Added,
                    ProductTypeAttributeId = item.ProductTypeAttributeId,
                    ValueName = item.Value,
                    ValueDescription = item.Description,
                    ProductId = item.ProductId
                });
            _productTypeAttributeValueRepository.InsertRange(productAttributeValueEntityList);
            try
            {
                _dataContext.SaveChanges();
                return new ServiceResponseModel
                {
                    CompletedStatus = CompletedStatus.Successed
                };
            }
            catch (Exception e)
            {

                return new ServiceResponseModel
                {
                    CompletedStatus = CompletedStatus.Error,
                    Data = e
                };
            }
           
        }
    }
}