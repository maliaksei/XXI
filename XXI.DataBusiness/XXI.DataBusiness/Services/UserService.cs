namespace XXI.Centuty.DataBusiness.Services
{
    using System;
    using System.Linq;
    using Model;
    using Models.Entities;
    using Models.Enums;
    using Models.Membership;
    using Repository.Pattern.Ef6;
    using Repository.Pattern.Infrastructure;
    using Repository.Pattern.Repositories;
    using Repository.Pattern.UnitOfWork;

    public class UserService
    {
        public IRepository<ApplicationUser> _applicationServiceRepository;
        public IUnitOfWorkAsync _unitOfWork;
        public XXIDataContext _dataContext;

        public UserService()
        {
            _dataContext = new XXIDataContext();
            _unitOfWork = new UnitOfWork(_dataContext);
            _applicationServiceRepository = new Repository<ApplicationUser>(_dataContext, _unitOfWork);
        }

        public IQueryable<ApplicationUser> GetUsers()
        {
            return _applicationServiceRepository.Queryable();
        }
        public ServiceResponseModel ChangeUserStatus(long userId, UserStatus userStatus)
        {
            var user = _applicationServiceRepository.Queryable().SingleOrDefault(x => x.Id == userId);
            if (user != null)
            {
                user.UserStatus = userStatus;
                user.ObjectState = ObjectState.Modified;
                _applicationServiceRepository.Update(user);
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