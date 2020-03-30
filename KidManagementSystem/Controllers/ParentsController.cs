using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using KidManagementSystem.Models;

namespace KidManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ParentsController : ControllerBase
    {
        private readonly KidDetailContext _context;

        public ParentsController(KidDetailContext context)
        {
            _context = context;
        }

        // GET: api/Parents
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Parents>>> GetParent()
        {
            return await _context.Parent.ToListAsync();
        }

        // GET: api/Parents/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Parents>> GetParents(int id)
        {
            var parents = await _context.Parent.FindAsync(id);

            if (parents == null)
            {
                return NotFound();
            }

            return parents;
        }

        // PUT: api/Parents/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutParents(int id, Parents parents)
        {
            if (id != parents.ParentId)
            {
                return BadRequest();
            }

            _context.Entry(parents).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ParentsExists(id))
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

        // POST: api/Parents
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Parents>> PostParents(Parents parents)
        {
            _context.Parent.Add(parents);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetParents", new { id = parents.ParentId }, parents);
        }

        // DELETE: api/Parents/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Parents>> DeleteParents(int id)
        {
            var parents = await _context.Parent.FindAsync(id);
            if (parents == null)
            {
                return NotFound();
            }

            _context.Parent.Remove(parents);
            await _context.SaveChangesAsync();

            return parents;
        }

        private bool ParentsExists(int id)
        {
            return _context.Parent.Any(e => e.ParentId == id);
        }
    }
}
