using System;
using System.Collections.Generic;
using System.Linq;
using Repository.Pattern.Ef6;
using Repository.Pattern.Infrastructure;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Services
{
    public class AddressService
    {
        public IRepository<AddressEntity> _repositoryAddress;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public AddressService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _repositoryAddress = new Repository<AddressEntity>(_dataContext, _unitOfWork);
        }

        public IEnumerable<AddressEntity> GetAddressesByUserId(long userId)
        {
            return _repositoryAddress.Queryable().Where(x => x.UserId == userId).ToList();
        }

        public AddressEntity GetAddressByIdAndUserId(long addressId, long userId)
        {
            return _repositoryAddress.Queryable().SingleOrDefault(x => x.Id == addressId && x.UserId == userId);
        }

        public void AddAddress(AddressDataModel addressDataModel)
        {
            var entityModel = new AddressEntity
            {
                Country = addressDataModel.Country,
                City = addressDataModel.City,
                Street = addressDataModel.Street,
                House = addressDataModel.House,
                Flat = addressDataModel.Flat,
                UserId = addressDataModel.UserId,
                ObjectState = ObjectState.Added

            };
            _repositoryAddress.Insert(entityModel);
            _dataContext.SaveChanges();
        }

       public void UpdateAddress(AddressDataModel addressDataModel)
        {
            var addressEntity = _repositoryAddress.Queryable().SingleOrDefault(x => x.Id == addressDataModel.Id);
            if (addressEntity == null) return;
            addressEntity.Country = addressDataModel.Country;
            addressEntity.City = addressDataModel.City;
            addressEntity.Street = addressDataModel.Street;
            addressEntity.House = addressDataModel.House;
            addressEntity.Flat = addressDataModel.Flat;
            addressEntity.ObjectState = ObjectState.Modified;
            _repositoryAddress.Update(addressEntity);
            _dataContext.SaveChanges();
        }

        public void DeleteAddress(long addressId)
        {
            var address = _repositoryAddress.Queryable().SingleOrDefault(x => x.Id == addressId);
            if (address != null)
            {
                _repositoryAddress.Delete(address);
                _dataContext.SaveChanges();
            }
        }

        public IEnumerable<AddressEntity> GetAddresses(long userId)
        {
            return _repositoryAddress.Queryable().Where(x => x.UserId == userId);
        }
    }
}
