using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace library.Controllers
{
    public class LoginPageController : Controller
    {
        // GET: LoginPage
        public ActionResult Index()
        {
            return View();
        }
    }
}