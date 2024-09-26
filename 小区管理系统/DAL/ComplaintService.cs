using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class ComplaintService
    {
        //查询所有投诉信息
        public static DataTable FindAll()
        {
            string sql = "  SELECT c.*, r.phone FROM Complaint AS c JOIN Resident AS r ON c.ResidentId = r.Id ORDER BY CASE c.State WHEN 0 THEN 1 WHEN 1 THEN 2 ELSE 3 END";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //根据主键查询业主ID
        public static int FindResidentIdByID(int id)
        {
            string sql = "select ResidentId from Complaint where Id = " + id + "  ";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
                int resId = Convert.ToInt32(table.Rows[0]["ResidentId"]);
                return resId;
            }
            else
            {
                return -1;
            }
        }
        //根据业主Id查询投诉记录
        public static List<Complaint> FindAllByResidentId(int id)
        {
            List<Complaint> complaintList = new List<Complaint>();
            string sql = "select * from Complaint where ResidentId = " + id + " ORDER BY CASE State WHEN 0 THEN 1 WHEN 1 THEN 2 ELSE 3 END";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Complaint complaint = new Complaint();
                complaint.Id = (int)row.ItemArray[0];
                complaint.ResidentId = (int)row.ItemArray[1];
                complaint.ResidentName = row.ItemArray[2].ToString();
                complaint.RoomNumber = row.ItemArray[3].ToString();
                complaint.Title = row.ItemArray[4].ToString();
                complaint.Content = row.ItemArray[5].ToString();
                complaint.Photo = row.ItemArray[6].ToString();
                complaint.Time = row.ItemArray[7].ToString();
                complaint.State = (int)row.ItemArray[8];
                complaintList.Add(complaint);
            }
            return complaintList;
        }
        //根据主键Id查询投诉记录
        public static Complaint FindALLById(int id)
        {
            List<Complaint> complaintList = new List<Complaint>();
            string sql = "select*from Complaint where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Complaint complaint = new Complaint();
                complaint.Id = (int)row.ItemArray[0];
                complaint.ResidentId = (int)row.ItemArray[1];
                complaint.ResidentName = row.ItemArray[2].ToString();
                complaint.RoomNumber = row.ItemArray[3].ToString();
                complaint.Title = row.ItemArray[4].ToString();
                complaint.Content = row.ItemArray[5].ToString();
                complaint.Photo = row.ItemArray[6].ToString();
                complaint.Time = row.ItemArray[7].ToString();
                complaintList.Add(complaint);
            }
            return complaintList.Count > 0 ? complaintList[0] : null;
        }
        //增加投诉记录
        public static bool AddComplaint(Complaint complaint)
        {
            string sql = "insert into Complaint values("+complaint.ResidentId+",'" + complaint.ResidentName + "','" + complaint.RoomNumber + "','"+complaint.Title+"','" + complaint.Content + "','" + complaint.Photo + "','"+complaint.Time+"',"+complaint.State + ")";
            return DBHelper.ExcuteSql(sql);
        }
        //修改投诉记录
        public static bool UpdateComplaint(Complaint complaint)
        {
            string sql = "Update Complaint set ResidentName='" + complaint.ResidentName + "',RoomNumber='" + complaint.RoomNumber + "',Title='" + complaint.Title + "',Content='" + complaint.Content + "',Photo='" + complaint.Photo + "',Time='" + complaint.Time + "'where Id = " + complaint.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //修改投诉状态
        public static bool UpdateComplaintState(Complaint complaint)
        {
            string sql = "Update Complaint set State = "+complaint.State+"where Id = " + complaint.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //删除投诉记录
        public static bool DeleteComplaint(int id)
        {
            string sql = "delete from Complaint where Id = " + id + " ";
            return DBHelper.ExcuteSql(sql);
        }
    }
}
