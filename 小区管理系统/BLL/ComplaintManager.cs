using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static  class ComplaintManager
    {
        public static DataTable FindAll()
        {
            return ComplaintService.FindAll();
        }
        public static int FindResidentIdByID(int id)
        {
            return ComplaintService.FindResidentIdByID(id);
        }
        public static bool AddComplaint(Complaint complaint)
        {
            return ComplaintService.AddComplaint(complaint);
        }
        public static bool UpdateComplaint(Complaint complaint)
        {
            return ComplaintService.UpdateComplaint(complaint);
        }
        public static bool UpdateComplaintState(Complaint complaint)
        {
            return ComplaintService.UpdateComplaintState(complaint);
        }
        public static List<Complaint> FindAllByResidentId(int id)
        {
            return ComplaintService.FindAllByResidentId(id);
        }
        public static Complaint FindALLById(int id)
        {
            return ComplaintService.FindALLById(id);
        }
        public static bool DeleteComplaint(int id)
        {
            return ComplaintService.DeleteComplaint(id);
        }
    }
    }

