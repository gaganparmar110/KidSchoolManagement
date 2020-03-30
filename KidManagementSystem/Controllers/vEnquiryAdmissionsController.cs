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
    public class vEnquiryAdmissionsController : ControllerBase
    {
        private readonly KidDetailContext _context;

        public vEnquiryAdmissionsController(KidDetailContext context)
        {
            _context = context;
        }

        // GET: api/vEnquiryAdmissions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<vEnquiryAdmissions>>> GetvEnquiryAdmission()
        {
            return await _context.vEnquiryAdmission.ToListAsync();
        }

        // GET: api/vEnquiryAdmissions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<vEnquiryAdmissions>> GetvEnquiryAdmissions(int id)
        {
            var vEnquiryAdmissions = await _context.vEnquiryAdmission.FindAsync(id);

            if (vEnquiryAdmissions == null)
            {
                return NotFound();
            }

            return vEnquiryAdmissions;
        }

        // PUT: api/vEnquiryAdmissions/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutvEnquiryAdmissions(int id, vEnquiryAdmissions vEnquiryAdmissions)
        {
            if (id != vEnquiryAdmissions.StandardId)
            {
                return BadRequest();
            }

            _context.Entry(vEnquiryAdmissions).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!vEnquiryAdmissionsExists(id))
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

        // POST: api/vEnquiryAdmissions
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<vEnquiryAdmissions>> PostvEnquiryAdmissions(vEnquiryAdmissions vEnquiryAdmissions)
        {
            _context.vEnquiryAdmission.Add(vEnquiryAdmissions);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetvEnquiryAdmissions", new { id = vEnquiryAdmissions.StandardId }, vEnquiryAdmissions);
        }

        // DELETE: api/vEnquiryAdmissions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<vEnquiryAdmissions>> DeletevEnquiryAdmissions(int id)
        {
            var vEnquiryAdmissions = await _context.vEnquiryAdmission.FindAsync(id);
            if (vEnquiryAdmissions == null)
            {
                return NotFound();
            }

            _context.vEnquiryAdmission.Remove(vEnquiryAdmissions);
            await _context.SaveChangesAsync();

            return vEnquiryAdmissions;
        }

        private bool vEnquiryAdmissionsExists(int id)
        {
            return _context.vEnquiryAdmission.Any(e => e.StandardId == id);
        }
    }
}
