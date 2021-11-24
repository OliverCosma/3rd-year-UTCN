using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FoodIsGood.DAL;
using FoodIsGood.Models;

namespace foodisgood.Controllers
{
    public class RightsController : Controller
    {
        private FoodIsGoodContext db = new FoodIsGoodContext();

        // GET: Rights
        public ActionResult Index()
        {
            return View(db.Rights.ToList());
        }

        // GET: Rights/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Right right = db.Rights.Find(id);
            if (right == null)
            {
                return HttpNotFound();
            }
            return View(right);
        }

        // GET: Rights/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Rights/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Suspended")] Right right)
        {
            if (ModelState.IsValid)
            {
                db.Rights.Add(right);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(right);
        }

        // GET: Rights/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Right right = db.Rights.Find(id);
            if (right == null)
            {
                return HttpNotFound();
            }
            return View(right);
        }

        // POST: Rights/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Suspended")] Right right)
        {
            if (ModelState.IsValid)
            {
                db.Entry(right).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(right);
        }

        // GET: Rights/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Right right = db.Rights.Find(id);
            if (right == null)
            {
                return HttpNotFound();
            }
            return View(right);
        }

        // POST: Rights/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Right right = db.Rights.Find(id);
            db.Rights.Remove(right);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
