using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static class MaintenanceRecordService
    {
        //申请报修
        /*     public static bool AddMaintenance(MaintenanceRecord maintenance)
             {
                 string sql = "insert into MaintenanceRecord values('" + maintenance.IssueDescription + "'," + maintenance.ResidentId + ",'" + maintenance.ResidentName + "','" + maintenance.RoomNumber + "','" + maintenance.PhotoBefore + "','" + maintenance.ApplyTime + "','" + maintenance.RepairStartTime + "','" + maintenance.RepairEndTime + "','" + maintenance.PhotoAfter + "'," + maintenance.RepairerID + "," + maintenance.Status + ",'" + maintenance.expenses + "')";
                 return DBHelper.ExcuteSql(sql);
             }*/
        public static bool AddMaintenance(MaintenanceRecord maintenance)
        {
            string sql = "INSERT INTO MaintenanceRecord(IssueDescription, ResidentId, ResidentName, RoomNumber, PhotoBefore, ApplyTime, RepairStartTime, RepairEndTime, PhotoAfter, RepairerID, Status, expenses) VALUES (@IssueDescription, @ResidentId, @ResidentName, @RoomNumber, @PhotoBefore, @ApplyTime, @RepairStartTime, @RepairEndTime, @PhotoAfter, @RepairerID, @Status, @expenses)";
            Dictionary<string, object> parameters = new Dictionary<string, object>()
      {
          { "@IssueDescription", maintenance.IssueDescription },
          { "@ResidentId", maintenance.ResidentId },
          { "@ResidentName", maintenance.ResidentName },
          { "@RoomNumber", maintenance.RoomNumber },
          { "@PhotoBefore", maintenance.PhotoBefore },
          { "@ApplyTime", (object)maintenance.ApplyTime ?? DBNull.Value }, // 将null转为DBNull
          { "@RepairStartTime", (object)maintenance.RepairStartTime ?? DBNull.Value },
          { "@RepairEndTime", (object)maintenance.RepairEndTime ?? DBNull.Value },
          { "@PhotoAfter", maintenance.PhotoAfter },
          { "@RepairerID", maintenance.RepairerID },
          { "@Status", maintenance.Status },
          { "@expenses", maintenance.expenses }
      };

            return DBHelper2.ExecuteNonQueryWithParameters(sql, parameters);
        }


        //修改方法
        public static bool UpdateMaintenance(MaintenanceRecord maintenance)
        {
            string sql = "update MaintenanceRecord set RepairerID=" + maintenance.RepairerID + ",Status=" + maintenance.Status + ",RepairStartTime = '" + maintenance.RepairStartTime + "' where Id=" + maintenance.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        public static bool UpdateMaintenance2(MaintenanceRecord maintenance)
        {
            string sql = "update MaintenanceRecord set RepairStartTime = '" + maintenance.RepairStartTime + "' where Id=" + maintenance.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        public static bool UpdateMaintenance3(MaintenanceRecord maintenance)
        {
            string sql = "update MaintenanceRecord set expenses='"+maintenance.expenses+"', RepairEndTime = '" + maintenance.RepairEndTime + "' ,PhotoAfter='" + maintenance.PhotoAfter+ "',Status = "+maintenance.Status+" where Id=" + maintenance.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        public static bool UpdateMaintenance4(MaintenanceRecord maintenance)
        {
            string sql = "update MaintenanceRecord set Status=" + maintenance.Status + " where Id=" + maintenance.Id + "";
            return DBHelper.ExcuteSql(sql);
        }

        //查询报修-全部--查询结果根据Status值来排序
        public static List<MaintenanceRecord> FindAll()
        {
            List<MaintenanceRecord> maintenancesList = new List<MaintenanceRecord>();
            string sql = "SELECT * FROM MaintenanceRecord ORDER BY CASE Status WHEN 0 THEN 1 WHEN 3 THEN 2 WHEN 2 THEN 3 WHEN 1 THEN 4 ELSE 5 END";

            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                MaintenanceRecord maintenance = new MaintenanceRecord();
                maintenance.Id = (int)row.ItemArray[0];
                maintenance.IssueDescription = row.ItemArray[1].ToString();
                maintenance.ResidentId = (int)row.ItemArray[2];
                maintenance.ResidentName = row.ItemArray[3].ToString();
                maintenance.RoomNumber = row.ItemArray[4].ToString();
                maintenance.PhotoBefore = row.ItemArray[5].ToString();
                maintenance.ApplyTime = row.ItemArray[6].ToString();
                maintenance.RepairStartTime = row.ItemArray[7].ToString();
                maintenance.RepairEndTime = row.ItemArray[8].ToString();
                maintenance.PhotoAfter = row.ItemArray[9].ToString();
                maintenance.RepairerID = (int)row.ItemArray[10];
                maintenance.Status = (int)row.ItemArray[11];
                maintenance.expenses = row.ItemArray[12].ToString();
                maintenancesList.Add(maintenance);
            }
            return maintenancesList;
        }
        //根据报修人Id查询报修记录
        public static List<MaintenanceRecord> FindById(int id)
        {
            List<MaintenanceRecord> mianList = new List<MaintenanceRecord>();
            string sql = "select*from MaintenanceRecord where ResidentId = " + id + " ORDER BY CASE Status WHEN 0 THEN 1 WHEN 3 THEN 2 WHEN 2 THEN 3 WHEN 1 THEN 4 ELSE 5 END";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                MaintenanceRecord maintenance = new MaintenanceRecord();
                maintenance.Id = (int)row.ItemArray[0];
                maintenance.IssueDescription = row.ItemArray[1].ToString();
                maintenance.ResidentId = (int)row.ItemArray[2];
                maintenance.ResidentName = row.ItemArray[3].ToString();
                maintenance.RoomNumber = row.ItemArray[4].ToString();
                maintenance.PhotoBefore = row.ItemArray[5].ToString();
                maintenance.ApplyTime = row.ItemArray[6].ToString();
                maintenance.RepairStartTime = row.ItemArray[7].ToString();
                maintenance.RepairEndTime = row.ItemArray[8].ToString();
                maintenance.PhotoAfter = row.ItemArray[9].ToString();
                maintenance.RepairerID = (int)row.ItemArray[10];
                maintenance.Status = (int)row.ItemArray[11];
                maintenance.expenses = row.ItemArray[12].ToString();
                mianList.Add(maintenance);
            }
            return mianList;
        }
        //根据主键ID查询
        public static MaintenanceRecord FindAllById(int id)
        {
            List<MaintenanceRecord> mainList = new List<MaintenanceRecord>();
            string sql = "select*from MaintenanceRecord where Id = " + id + " ";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                MaintenanceRecord maintenance = new MaintenanceRecord();
                maintenance.Id = (int)row.ItemArray[0];
                maintenance.IssueDescription = row.ItemArray[1].ToString();
                maintenance.ResidentId = (int)row.ItemArray[2];
                maintenance.ResidentName = row.ItemArray[3].ToString();
                maintenance.RoomNumber = row.ItemArray[4].ToString();
                maintenance.PhotoBefore = row.ItemArray[5].ToString();
                maintenance.ApplyTime = row.ItemArray[6].ToString();
                maintenance.RepairStartTime = row.ItemArray[7].ToString();
                maintenance.RepairEndTime = row.ItemArray[8].ToString();
                maintenance.PhotoAfter = row.ItemArray[9].ToString();
                maintenance.RepairerID = (int)row.ItemArray[10];
                maintenance.Status = (int)row.ItemArray[11];
                maintenance.expenses = row.ItemArray[12].ToString();
                mainList.Add(maintenance);
            }
            return mainList.Count > 0 ? mainList[0] : null;
        }

        //通过维修人员ID--Session和维修状态查询
        public static List<MaintenanceRecord> FindAllByIdSta(int repairerid)
        {
            List<MaintenanceRecord> mianList = new List<MaintenanceRecord>();
            string sql = "select*from MaintenanceRecord where RepairerID = " + repairerid + "ORDER BY CASE Status WHEN 0 THEN 1 WHEN 3 THEN 2 WHEN 2 THEN 3 WHEN 1 THEN 4 ELSE 5 END ";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                MaintenanceRecord maintenance = new MaintenanceRecord();
                maintenance.Id = (int)row.ItemArray[0];
                maintenance.IssueDescription = row.ItemArray[1].ToString();
                maintenance.ResidentId = (int)row.ItemArray[2];
                maintenance.ResidentName = row.ItemArray[3].ToString();
                maintenance.RoomNumber = row.ItemArray[4].ToString();
                maintenance.PhotoBefore = row.ItemArray[5].ToString();
                maintenance.ApplyTime = row.ItemArray[6].ToString();
                maintenance.RepairStartTime = row.ItemArray[7].ToString();
                maintenance.RepairEndTime = row.ItemArray[8].ToString();
                maintenance.PhotoAfter = row.ItemArray[9].ToString();
                maintenance.RepairerID = (int)row.ItemArray[10];
                maintenance.Status = (int)row.ItemArray[11];
                maintenance.expenses = row.ItemArray[12].ToString();
                mianList.Add(maintenance);
            }
            return mianList;
        }
    }
}
