using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mymvc.Controllers
{
    public class AlunoController : Controller
    {
        // GET: Aluno
        public ActionResult Index()
        {
            //MANEIRA DE PASSAR DADOS ENTRE A ACTION E A VIEW

            //maneira de passar que "come" tudo mas não é tão seguro
            ViewBag.fruta = "banana";
            //coleções do TIPO DICIONÁRIO mas temos que fazer um casting
            ViewData["carne"] = "Grelhada Mista";
            TempData["sobremesa"] = "pudim";
            TempData.Keep();
            return View();
        }


        public ActionResult Outra()
        {
            return View();
        }

        public ActionResult Um()
        {
            mymvc.Models.Aluno aluno = new Models.Aluno { Num = 1, Nome = "Josefina", Clube = "Chaves" };
            return View(aluno);


        }


    }
}