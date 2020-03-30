using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using KidManagementSystem.Models;
using Microsoft.Data.SqlClient;

namespace KidManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PayFeesController : ControllerBase
    {
        private readonly KidDetailContext _context;

        public PayFeesController(KidDetailContext context)
        {
            _context = context;
        }

        // GET: api/PayFees
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PayFees>>> GetPayFee()
        {
            return await _context.PayFee.ToListAsync();
        }

        // GET: api/PayFees/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PayFees>> GetPayFees(int id)
        {
            var payFees = await _context.PayFee.FindAsync(id);

            if (payFees == null)
            {
                return NotFound();
            }

            return payFees;
        }

        // PUT: api/PayFees/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPayFees(int id, PayFees payFees)
        {
            if (id != payFees.PayFeesId)
            {
                return BadRequest();
            }

            _context.Entry(payFees).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PayFeesExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/PayFees
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<PayFees>> PostPayFees(PayFees payFees)
        {
            var data = _context.Database.ExecuteSqlCommand("spPayFees @StudentName ,@Fees ",
           new SqlParameter("@StudentName", payFees.StudentName),
           new SqlParameter("@Fees", payFees.Fees)

           );
            //  _context.PayFee.Add(payFees);
            //await _context.SaveChangesAsync();
            return Ok(data);
           // return CreatedAtAction("GetPayFees", new { id = payFees.PayFeesId }, payFees);
        }

        // DELETE: api/PayFees/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PayFees>> DeletePayFees(int id)
        {
            var payFees = await _context.PayFee.FindAsync(id);
            if (payFees == null)
            {
                return NotFound();
            }

            _context.PayFee.Remove(payFees);
            await _context.SaveChangesAsync();

            return payFees;
        }

        private bool PayFeesExists(int id)
        {
            return _context.PayFee.Any(e => e.PayFeesId == id);
        }
    }
}
