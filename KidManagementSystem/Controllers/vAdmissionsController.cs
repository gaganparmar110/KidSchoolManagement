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
    public class vAdmissionsController : ControllerBase
    {
        private readonly KidDetailContext _context;

        public vAdmissionsController(KidDetailContext context)
        {
            _context = context;
        }

        // GET: api/vAdmissions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<vAdmissions>>> GetvAdmissions()
        {
            return await _context.vAdmissions.ToListAsync();
        }

        // GET: api/vAdmissions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<vAdmissions>> GetvAdmissions(int id)
        {
            var vAdmissions = await _context.vAdmissions.FindAsync(id);

            if (vAdmissions == null)
            {
                return NotFound();
            }

            return vAdmissions;
        }

        // PUT: api/vAdmissions/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutvAdmissions(int id, vAdmissions vAdmissions)
        {
            if (id != vAdmissions.AdmissionId)
            {
                return BadRequest();
            }

            _context.Entry(vAdmissions).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!vAdmissionsExists(id))
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

        // POST: api/vAdmissions
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<vAdmissions>> PostvAdmissions(vAdmissions vAdmissions)
        {
            _context.vAdmissions.Add(vAdmissions);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetvAdmissions", new { id = vAdmissions.AdmissionId }, vAdmissions);
        }

        // DELETE: api/vAdmissions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<vAdmissions>> DeletevAdmissions(int id)
        {
            var vAdmissions = await _context.vAdmissions.FindAsync(id);
            if (vAdmissions == null)
            {
                return NotFound();
            }

            _context.vAdmissions.Remove(vAdmissions);
            await _context.SaveChangesAsync();

            return vAdmissions;
        }

        private bool vAdmissionsExists(int id)
        {
            return _context.vAdmissions.Any(e => e.AdmissionId == id);
        }
    }
}
