

namespace proyecto_Practica02_.Models
{
    public class Bill
    {
        public int NInvoice { get; set; }
        public DateTime? DateTime { get; set; }
        public int IdPayment { get; set; }
        public string Client { get; set; }

        public Bill()
        {
            NInvoice = 0;
            DateTime = null;
            IdPayment = 0;
            Client = string.Empty;
        }

        public Bill(int nInvoice, DateTime datetime, int idPayment, string client)
        {
            NInvoice = nInvoice;
            DateTime = datetime;
            IdPayment = idPayment;
            Client = client;
        }
    }
}
