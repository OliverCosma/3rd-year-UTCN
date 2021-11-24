using System;
using System.ComponentModel.DataAnnotations;

namespace FoodIsGood.Models
{
    public class Product
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Type { get; set; }

        public int Quality { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime ExpirationDate { get; set; }

    }
}