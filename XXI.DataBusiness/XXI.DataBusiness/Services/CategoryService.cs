using System.Collections.Generic;
using System.Linq;
using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Services
{
    public class CategoryService
    {
        public IRepository<CategoryEntity> _repositoryCategory;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public CategoryService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _repositoryCategory = new Repository<CategoryEntity>(_dataContext, _unitOfWork);
        }


        public IQueryable<CategoryEntity> GetAllCategory()
        {
            return _repositoryCategory.Queryable();
        }
    }
}