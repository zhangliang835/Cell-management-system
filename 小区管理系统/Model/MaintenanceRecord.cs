using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class MaintenanceRecord
    {
        public int Id { get; set; }
        public string IssueDescription { get; set; }
        public int ResidentId { get; set; }
        public string ResidentName { get; set; }
        public string RoomNumber { get; set; }
        public string PhotoBefore { get; set; }
        public string ApplyTime { get; set; }
        public string RepairStartTime { get; set; }
        public string RepairEndTime { get; set; }
        public string PhotoAfter { get; set; }
        public int RepairerID { get; set; }
        public int Status { get; set; }
        public string expenses { get; set; }

        public MaintenanceRecord(int id, string issueDescription, int residentId, string residentName, string roomNumber, string photoBefore, string applyTime, string repairStartTime, string repairEndTime, string photoAfter, int repairerID, int status, string expenses)
        {
            Id = id;
            IssueDescription = issueDescription;
            ResidentId = residentId;
            ResidentName = residentName;
            RoomNumber = roomNumber;
            PhotoBefore = photoBefore;
            ApplyTime = applyTime;
            RepairStartTime = repairStartTime;
            RepairEndTime = repairEndTime;
            PhotoAfter = photoAfter;
            RepairerID = repairerID;
            Status = status;
            this.expenses = expenses;
        }

        public MaintenanceRecord()
        {
        }
    }
}
