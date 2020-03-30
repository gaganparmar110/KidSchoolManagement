using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class Students
    {
        [Key]
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public int Age { get; set; }
        public int ParentId { get; set; }
    }
}
