using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodIsGood.Models
{
    public class Offer
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public float PriceUnit { get; set; }

        [Required]
        public float Quantity { get; set; }

        [Required]
        public DateTime CreateTime { get; set; }

        [Required]
        public DateTime EndTime { get; set; }

        [Required]
        public bool OfferType { get; set; }

        public string Description { get; set; }

        public virtual Product Product { get; set; }

        public int ProductID { get; set; }
    }
}