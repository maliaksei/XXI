using System;
using System.Collections.Generic;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    using Repository.Pattern.Ef6;

    public class UserEntity : Entity
    {
        public UserEntity()
        {
            this.Address = new HashSet<AddressEntity>();
            this.Order = new HashSet<OrderEntity>();
            this.Review = new HashSet<ReviewEntity>();
            this.Role = new HashSet<RoleEntity>();
        }

        public long Id { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public string PhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public Nullable<System.DateTime> LockoutEndDateUtc { get; set; }
        public bool LockoutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        public string UserName { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Patronymic { get; set; }

        public virtual ICollection<AddressEntity> Address { get; set; }
        public virtual ICollection<OrderEntity> Order { get; set; }
        public virtual ICollection<ReviewEntity> Review { get; set; }
        public virtual ICollection<RoleEntity> Role { get; set; }
    }
}
