using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class Admissions
    {
        [Key]
        public int AdmissionId { get; set; }
        public int StudentId { get; set; }
        public int StandardId { get; set; }
        public int FeeInstallmentPending { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public long MobileNo { get; set; }
        public string Address { get; set; }
        public string StudentName { get; set; }
        public int Age { get; set; }
        public string StandardName { get; set; }
    }
}
