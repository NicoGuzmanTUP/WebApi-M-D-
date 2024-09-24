using proyecto_Practica02_.Data.Implementations;
using proyecto_Practica02_.Data.Interfaces;
using proyecto_Practica02_.Models;

namespace proyecto_Practica02_.Services
{
    public class ProductionService : IProductionService
    {
        private IAplication repository;

        public ProductionService()
        {
            repository = new ArticleRepository();
        }
        public bool AddArticle(Article article)
        {
            return repository.PostComponents(article);
        }

        public List<Article> GetAllArticle()
        {
            return repository.GetComponents();
        }
        public Article GetById(int id)
        {
            return repository.GetByIdComponents(id);
        }

        //public bool DeleteArticle(Article article)
        //{
        //    return repository.DeleteComponents(article);
        //}
        public bool DeleteArticle(int id)
        {
            return repository.DeleteComponents(id);
        }

        public bool AddBill(Bill bill)
        {
            return repository.Register(bill);
        }

        public List<Bill> GetAllBill()
        {
            return repository.ConsultAll();
        }

        public Bill GetByDtP(DateTime dateTime, int idPayment)
        {
            return repository.Consult(dateTime, idPayment);
        }

        public bool UpdateBill(int nroFactura, DateTime fecha, int formaPago, string cliente)
        {
            return repository.Edit(nroFactura, fecha, formaPago, cliente);
        }
    }
}
