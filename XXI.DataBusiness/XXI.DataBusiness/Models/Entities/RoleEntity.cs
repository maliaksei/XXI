namespace XXI.Centuty.DataBusiness.Models.Entities
{
    using System.Collections.Generic;
    using Repository.Pattern.Ef6;

    public class RoleEntity : Entity
    {
        public RoleEntity()
        {
            this.User = new HashSet<UserEntity>();
        }

        public long Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<UserEntity> User { get; set; }
    }
}
