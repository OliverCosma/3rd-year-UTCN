using System.ComponentModel.DataAnnotations;

namespace FoodIsGood.Models
{
    public class Order
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public int BuyerID { get; set; }

        public virtual User BuyerUser { get; set; }

        [Required]
        public int OfferID { get; set; }

        public virtual Offer Offer { get; set; }

        [Required]
        public float DesiredQuantity { get; set; }
    }
}