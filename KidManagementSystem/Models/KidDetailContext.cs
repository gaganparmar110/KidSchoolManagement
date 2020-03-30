using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class KidDetailContext : DbContext
    {
        public KidDetailContext(DbContextOptions<KidDetailContext> options): base(options)
        {

        }
        public DbSet<Students> Student {get; set;}
        public DbSet<Parents> Parent { get; set; }
        public DbSet<Standards> Standard { get; set; }
        public DbSet<Admissions> Admission { get; set; }
        public DbSet<PayFees> PayFee { get; set; }
        public DbSet<FeesStructures> FeesStructure { get; set; }
        public DbSet<Sessions> Session { get; set; }
        public DbSet<vEnquiryAdmissions> vEnquiryAdmission { get; set; }
}
}
