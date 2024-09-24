using Microsoft.AspNetCore.Mvc;
using proyecto_Practica02_.Models;
using proyecto_Practica02_.Services;
using System;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace proyecto_Practica02_.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacturasController : ControllerBase
    {
        private IProductionService productionService;

        public FacturasController()
        {
            productionService = new ProductionService();
        }

        // GET: api/<FacturasController>
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                return Ok(productionService.GetAllBill());
            }
            catch (Exception)
            {
                return StatusCode(500, "Error. Ha ocurrido un error interno!");
            }
        }

        // GET api/<FacturasController>/5
        [HttpGet("{dateTime}")]
        public IActionResult GetBy(DateTime dateTime, int idPayment)
        {
            try
            {
                return Ok(productionService.GetByDtP(dateTime, idPayment));
            }
            catch (Exception)
            {
                return StatusCode(500, "Error. Ha ocurrido un error interno!");
            }
        }

        // POST api/<FacturasController>
        [HttpPost]
        public IActionResult Post([FromBody] Bill bill)
        {
            try{
                return Ok(productionService.AddBill(bill)); 
            }
            catch(Exception)
            {
                return StatusCode(500, "Error. Ha ocurrido un error interno!");
            }
        }

        // PUT api/<FacturasController>/5
        [HttpPut("{id}")]
        public bool Put(int nroFactura, [FromBody] DateTime fecha, int formaPago, string cliente)
        {
            return productionService.UpdateBill(nroFactura, fecha, formaPago, cliente);
        }

    }
}
