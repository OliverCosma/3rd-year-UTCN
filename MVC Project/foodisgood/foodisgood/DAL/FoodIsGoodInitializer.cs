using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using FoodIsGood.Models;

namespace FoodIsGood.DAL
{
    public class FoodIsGoodInitializer : System.Data.Entity.DropCreateDatabaseAlways<FoodIsGoodContext>
    {
        protected override void Seed(FoodIsGoodContext context)
        {
            var rights = new List<Right>
            {
            new Right{Name="User",Suspended=false},
            new Right{Name="Admin",Suspended=false},
            };
            rights.ForEach(s => context.Rights.Add(s));
            context.SaveChanges();

            var users = new List<User>
            {
            new User{FirstName="Carson",LastName="LN",Email="carsonalex@gmail.com",Phone="07070707",CreateDate=DateTime.Parse("2008-3-8"),Password="password",Location="Here",RightID=1},
            new User{FirstName="Larry",LastName="LNA",Email="carsonalex@gmail.com",Phone="07070707",CreateDate=DateTime.Parse("2008-3-8"),Password="password",Location="Here",RightID=1},
            new User{FirstName="Smugus",LastName="LNB",Email="carsonalex@gmail.com",Phone="07070707",CreateDate=DateTime.Parse("2008-3-8"),Password="password",Location="Here",RightID=1}
            };
            users.ForEach(s => context.Users.Add(s));
            context.SaveChanges();

            var products = new List<Product>
            {
                new Product{Name="Tomatoes",Type="From Spain",Quality=1,ExpirationDate=DateTime.Parse("2021-4-6")},
                new Product{Name="Carrots",Type="From Portugal",Quality=2,ExpirationDate=DateTime.Parse("2021-4-3")},
                new Product{Name="Cucumber",Type="From Spain",Quality=1,ExpirationDate=DateTime.Parse("2021-5-6")}
            };
            products.ForEach(s => context.Products.Add(s));
            context.SaveChanges();

            var offers = new List<Offer>
            {
                new Offer{PriceUnit=2, Quantity=100, CreateTime=DateTime.Parse("2021-4-3"), EndTime=DateTime.Parse("2021-9-3"), OfferType=true, Description="Cyka!!!", ProductID=1},
                new Offer{PriceUnit=4, Quantity=179, CreateTime=DateTime.Parse("2021-4-6"), EndTime=DateTime.Parse("2023-9-3"), OfferType=true, Description="", ProductID=1},
                new Offer{PriceUnit=7, Quantity=163, CreateTime=DateTime.Parse("2021-4-18"), EndTime=DateTime.Parse("2022-9-3"), OfferType=true, Description="", ProductID=2},
                new Offer{PriceUnit=9, Quantity=24, CreateTime=DateTime.Parse("2021-4-4"), EndTime=DateTime.Parse("2025-9-3"), OfferType=true, Description="Smidania", ProductID=3},
                new Offer{PriceUnit=4, Quantity=35, CreateTime=DateTime.Parse("2021-4-2"), EndTime=DateTime.Parse("2021-8-3"), OfferType=true, Description="Genius delivery.", ProductID=3},
            };
            offers.ForEach(s => context.Offers.Add(s));
            context.SaveChanges();

        }
    }
}