using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Services
{
  public  class ReviewService
    {
        public IRepository<ReviewEntity> _reviewRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public ReviewService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _reviewRepository = new Repository<ReviewEntity>(_dataContext, _unitOfWork);
        }

        public IQueryable<ReviewEntity> GetProductTypes()
        {
            return _reviewRepository.Queryable();
        }

        public ReviewEntity GetProductTypeById(long id)
        {
            return _reviewRepository.Queryable().SingleOrDefault(x => x.Id == id);
        }

        public void AddReview(ReviewDataModel revieDataModel)
        {
            var review = _reviewRepository.Queryable().Any(x => x.ProductId == revieDataModel.ProductId && x.UserId == revieDataModel.UserId);
            if (!review)
            {
                var entityModel = new ReviewEntity
                {
                    ProductId = revieDataModel.ProductId,
                    UserId = revieDataModel.UserId,
                    Text = revieDataModel.Text
                };
                _reviewRepository.Insert(entityModel);
                _dataContext.SaveChanges();
            }
           
        }
    }
}
