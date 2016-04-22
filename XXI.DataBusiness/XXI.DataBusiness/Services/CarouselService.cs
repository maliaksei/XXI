using Repository.Pattern.Ef6;
using Repository.Pattern.Infrastructure;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services.Model;

namespace XXI.Centuty.DataBusiness.Services
{
    public class CarouselService
    {
        public IRepository<CarouselEntity> _carouselRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public CarouselService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _carouselRepository = new Repository<CarouselEntity>(_dataContext, _unitOfWork);
        }

        public IQueryable<CarouselEntity> GetAllService()
        {
            return _carouselRepository.Queryable();
        }

        public CarouselEntity GetModelById(int carouselId)
        {
            return _carouselRepository.Queryable().SingleOrDefault(x => x.Id == carouselId);
        }

        public ServiceResponseModel Delete(int carouselId)
        {
            _carouselRepository.Delete(carouselId);
            try
            {
                _dataContext.SaveChanges();
                return new ServiceResponseModel
                {
                    CompletedStatus = CompletedStatus.Successed,
                    Data = carouselId
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

        public ServiceResponseModel Add(CarouselDataModel dataModel)
        {
            var entityModel = new CarouselEntity
            {
                Image = dataModel.Image,
                PriceImage = dataModel.PriceImage,
                SubTitle = dataModel.SubTitle,
                Text = dataModel.Text,
                Tittle = dataModel.Tittle,
                UrlToProdict = dataModel.UrlToProdict,
                ObjectState = ObjectState.Added
            };

            _carouselRepository.Insert(entityModel);
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
    }
}
