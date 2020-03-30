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
    public class AdmissionsController : ControllerBase
    {
        private readonly KidDetailContext _context;

        public AdmissionsController(KidDetailContext context)
        {
            _context = context;
        }

        // GET: api/Admissions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Admissions>>> GetAdmission()
        {
            return await _context.Admission.ToListAsync();
        }

        // GET: api/Admissions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Admissions>> GetAdmissions(int id)
        {
            var admissions = await _context.Admission.FindAsync(id);

            if (admissions == null)
            {
                return NotFound();
            }

            return admissions;
        }

        // PUT: api/Admissions/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAdmissions(int id, Admissions admissions)
        {
            if (id != admissions.AdmissionId)
            {
                return BadRequest();
            }

            _context.Entry(admissions).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AdmissionsExists(id))
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

        // POST: api/Admissions
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Admissions>> PostAdmissions(Admissions admissions)
        {
            var data = _context.Database.ExecuteSqlCommand("spStudentAdmission @FatherName,@MotherName,@MobileNo,@Address,@StudentName,@Age,@StandardName ",
            new SqlParameter("@FatherName", admissions.FatherName),
                new SqlParameter("@MotherName", admissions.MotherName),
                new SqlParameter("@MobileNo", admissions.MobileNo),
                new SqlParameter("@Address", admissions.Address),
                new SqlParameter("@StudentName", admissions.StudentName),
                new SqlParameter("@Age", admissions.Age),
                new SqlParameter("@StandardName", admissions.StandardName)

            );
            //_context.Admission.Add(admissions);
            //await _context.SaveChangesAsync();
            return Ok(data);
           // return CreatedAtAction("GetAdmissions", new { id = admissions.AdmissionId }, admissions);
        }
    
        // DELETE: api/Admissions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Admissions>> DeleteAdmissions(int id)
        {
            var admissions = await _context.Admission.FindAsync(id);
            if (admissions == null)
            {
                return NotFound();
            }

            _context.Admission.Remove(admissions);
            await _context.SaveChangesAsync();

            return admissions;
        }

        private bool AdmissionsExists(int id)
        {
            return _context.Admission.Any(e => e.AdmissionId == id);
        }
    }
}
