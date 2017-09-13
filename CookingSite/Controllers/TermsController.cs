using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CookingSite.Models;
using Newtonsoft.Json;

namespace CookingSite.Controllers
{
    public class TermsController : Controller
    {
        private CookingSiteDBEntities db = new CookingSiteDBEntities();
        public string userInput { get; set; }
        public int userInput1 { get; set; }
        public string aspId { get; set; }
        public int ctr = 1;
        public int output;
        public bool isFav;
        public static List<int> savfavId = new List<int> { };


        // GET: Terms
        public ActionResult Index()
        {
            return View(db.Terms.ToList());
        }

        //The following method runs a linq query and populates a list. 
        //The list is then ViewBag-ed and used to set the favorites button to red
        //if the termID is contained in the list
        public ActionResult Words()
        {
            List<int> wordArr1 = new List<int> { };

            var checkFav =
                from key in db.Favorites
                select key.TermID;
            wordArr1.AddRange(checkFav);
            ViewBag.Favorites = wordArr1;
            return View(db.Terms.ToList());
        }

        // GET: Terms/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Term term = db.Terms.Find(id);
            if (term == null)
            {
                return HttpNotFound();
            }
            return View(term);
        }

        // GET: Terms/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Terms/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TermID,TermName,TermDef,TermInfo,TermPicture,TermVideo,IsMatch")] Term term)
        {
            if (ModelState.IsValid)
            {
                db.Terms.Add(term);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(term);
        }

        // GET: Terms/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Term term = db.Terms.Find(id);
            if (term == null)
            {
                return HttpNotFound();
            }
            return View(term);
        }

        // POST: Terms/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TermID,TermName,TermDef,TermInfo,TermPicture,TermVideo,IsMatch")] Term term)
        {
            if (ModelState.IsValid)
            {
                db.Entry(term).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(term);
        }

        // GET: Terms/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Term term = db.Terms.Find(id);
            if (term == null)
            {
                return HttpNotFound();
            }
            return View(term);
        }

        // POST: Terms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Term term = db.Terms.Find(id);
            db.Terms.Remove(term);
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

        //The following method recieves a JSON object from the terms index view.
        //The method utilizes linq queries, lists and arrays to set the bool in the
        //Terms table to false then compare terms to set the value to for each search.
        //This allows the index view to show only terms that match the users' input.
        [HttpPost]

        public JsonResult GetKey(TermsController term)
        {
            string outPut = term.userInput;
            var outPut1 = "";
            if (ModelState.IsValid)
            {
                string[] keyArr = db.Terms.Select(x => x.TermName).ToArray();

                var relaceQuery =
                            from key in db.Terms
                            where key.IsMatch == true
                            select key;


                foreach (Term key in relaceQuery)
                {
                    if (key.IsMatch == true)
                    {
                        key.IsMatch = false;
                    }

                }
                db.SaveChanges();

                for (int j = 0; j < keyArr.Length; j++)
                {
                    outPut1 = keyArr[j];
                }
                string[] wordArr = { " " };
                if (!(outPut == null))
                {
                    wordArr = outPut.Split(' ', ',', '.', '\n', '?', '!', '@', '#', '$', '/', '%', '^', '&', '*', '(', ')', '{', '}', '[', ']', '|', '<', '>');
                }
                for (int i = 0; i < wordArr.Length; i++)
                {
                    var tempword = wordArr[i];
                    wordArr[i] = UppercaseFirst(tempword);  
                }
               
                for (int i = 0; i < wordArr.Length; i++)
                {
                    var tempWord = wordArr[i];

                    if (keyArr.Contains(tempWord))
                    {
                        var query =
                            from key in db.Terms
                            where key.TermName == tempWord
                            select key;


                        foreach (Term key in query)
                        {
                            if (key.IsMatch == null || key.IsMatch == false)
                            {
                                key.IsMatch = true;
                            }

                        }

                    }
                }
                db.SaveChanges();
            }
            return new JsonResult() { Data = JsonConvert.SerializeObject(outPut1), JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        //The following method recieves a JSON object from the terms index view.
        //The methods utilizes linq queries foreach loops and a list to accomplish the following:
        //Save an item to the favorites table, not allow of entering of of a favorite item
        //which a customer has already added, not allow multiple favorites of the same item
        //to appear on the favorites index view
        [HttpPost]

        public JsonResult SavFav(TermsController term)
        {
            term.output = term.userInput1;
            string output2 = term.aspId;
            var resetQuery =
                           from key in db.Terms
                           select key;
            foreach (Term key in resetQuery)
            {
                if (key.IsLiked == true || key.IsLiked == null)
                {
                    key.IsLiked = false;
                }
            }
            var setQuery =
                          from key in db.Terms
                          where key.TermID == output
                          select key;
            foreach (Term key in setQuery)
            {
                if (key.IsLiked == false || key.IsLiked == null)
                {
                    key.IsLiked = true;
                }
            }
            db.SaveChanges();
            int tempfav = term.ctr++;
            int tempTerm = term.userInput1;
            string tempId = term.aspId;
            List<string> wordArr1 = new List<string> { };

            var checkFav =
                from key in db.Favorites
                select key.TermID.ToString();
            wordArr1.AddRange(checkFav);
            var tempInput = term.output.ToString();
            if (wordArr1.Contains(tempInput) == true)
            {
                term.isFav = true;
            }
            else
            {
                term.isFav = false;
            }
            if (term.isFav == false)
            {
                Favorite fav = new Favorite
                {
                    FavoriteID = tempfav,
                    TermID = tempTerm,
                    Id = tempId
                };

                db.Favorites.Add(fav);
                db.SaveChanges();
            }

            return new JsonResult() { Data = JsonConvert.SerializeObject(output2), JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        //The following method is called by the GetKey() method. The method sets all of the input from the user search to uppercase
        static string UppercaseFirst(string outPut)
        {
            // Check for empty string.
            if (string.IsNullOrEmpty(outPut))
            {
                return string.Empty;
            }
            // Return char and concat substring.
            return char.ToUpper(outPut[0]) + outPut.Substring(1);
        }
        //This method is called by a JSON method in the terms controller and sets the IsMatch bool in the terms table to false.
        public JsonResult MakeFalse()
        {
            CookingSiteDBEntities db = new CookingSiteDBEntities();
            var relaceQuery =
                            from key in db.Terms
                            where key.IsMatch == true
                            select key;
            foreach (Term key in relaceQuery)
            {
                if (key.IsMatch == true)
                {
                    key.IsMatch = false;
                }
            }
            db.SaveChanges();
            return new JsonResult();
        }
    }
}
