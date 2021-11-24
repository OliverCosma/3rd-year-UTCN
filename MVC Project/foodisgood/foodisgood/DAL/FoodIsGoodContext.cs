using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FoodIsGood.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace FoodIsGood.DAL
{
    public class FoodIsGoodContext : DbContext
    {
        public FoodIsGoodContext() : base("FoodIsGoodContext")
        {
        }
        public DbSet<Offer> Offers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Right> Rights { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}