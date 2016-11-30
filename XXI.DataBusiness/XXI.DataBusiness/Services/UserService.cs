namespace XXI.Centuty.DataBusiness.Services
{
    using System.Linq;
    using Models.Entities;
    using Models.Membership;
    using Repository.Pattern.Ef6;
    using Repository.Pattern.Repositories;
    using Repository.Pattern.UnitOfWork;

    public class UserService
    {
        public IRepository<ApplicationUser> _productTypeRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public UserService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _productTypeRepository = new Repository<ApplicationUser>(_dataContext, _unitOfWork);
        }

        public IQueryable<ApplicationUser> GetUsers()
        {
            return _productTypeRepository.Queryable();
        }
    }
}