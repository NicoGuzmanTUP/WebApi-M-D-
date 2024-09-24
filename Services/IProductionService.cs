using proyecto_Practica02_.Models;

namespace proyecto_Practica02_.Services
{
    public interface IProductionService
    {
        List<Article> GetAllArticle();

        bool AddArticle(Article article);

        //bool DeleteArticle(Article article);
        bool DeleteArticle(int id);

        Article GetById(int id);

        bool AddBill(Bill bill);
        List<Bill> GetAllBill();
        Bill GetByDtP(DateTime dateTime, int idPayment);
        bool UpdateBill(int nroFactura, DateTime fecha, int formaPago, string cliente);
    }
}
