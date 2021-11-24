using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FoodIsGood.Models
{
    public class User
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        public string Email { get; set; }

        public string Phone { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime CreateDate { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        public string Location { get; set; }
        [Display(Name = "Account Type")]
        public virtual Right Right { get; set; }

        [Display(Name = "Account Type")]
        public int RightID { get; set; }

        public virtual ICollection<Offer> Offers { get; set; }
    }
}