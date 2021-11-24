using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FoodIsGood.Models
{
    public class Right
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [Display(Name = "Account Type")]
        public string Name { get; set; }

        public bool Suspended { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}