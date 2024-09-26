using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static class ServiceChargeService
    {
        //增加
        /*   public static bool ADDservice(ServiceCharge service)
           {
               string sql = "insert into ServiceCharge values(" + service.SypeId + ",'" + service.StateTime + "'," + service.ResidentId + ",'" + service.ResidentName + "','" + service.RoomNumber + "','" + service.PaymentAmount + "'," + service.PaidStatus + ",'" + service.PaymentTime + "','" + service.After + "','" + service.Before + "','" + service.DiffValue + "')";
               return DBHelper.ExcuteSql(sql);
           }*/
        public static bool AddService(ServiceCharge service)
        {
            // 基础 SQL 语句
            string sql = "INSERT INTO ServiceCharge (SypeId, StateTime, ResidentId, ResidentName, RoomNumber, PaymentAmount, PaidStatus, PaymentTime, After, Before, DiffValue) VALUES (";

            // 添加各字段值
            sql += $"{service.SypeId},'{service.StateTime}',{service.ResidentId},'{service.ResidentName}','{service.RoomNumber}','{service.PaymentAmount}',{service.PaidStatus},";

            // 检查 PaymentTime 是否有值，以及是否是有效日期
            if (!string.IsNullOrEmpty(service.PaymentTime) && DateTime.TryParse(service.PaymentTime, out DateTime validDate))
            {
                sql += $"'{service.PaymentTime}',"; // 如果有效，使用这个值
            }
            else
            {
                sql += "NULL,"; // 如果无效，设为 NULL (数据库需要配置为接受 NULL 或有默认值)
            }

            // 继续添加剩余字段
            sql += $"'{service.After}','{service.Before}','{service.DiffValue}')";

            // 执行 SQL 语句
            return DBHelper.ExcuteSql(sql);
        }
        //检测当月水电费是否登记过，防止重复登记
        public static bool CheckRecordExists(string roomNumber, DateTime date, int SypeId)
        {
            string sql = $"SELECT COUNT(*) FROM ServiceCharge WHERE RoomNumber = '{roomNumber}' AND SypeId={SypeId} AND YEAR(StateTime) = {date.Year} AND MONTH(StateTime) = {date.Month}";
            DataTable dt = DBHelper.GetDataTable(sql);

            if (dt != null && dt.Rows.Count > 0)
            {
                // 获取第一行第一列的值，即 COUNT(*) 的结果
                int count = Convert.ToInt32(dt.Rows[0][0]);
                return count > 0;
            }

            return false;
        }
        //查询物业费名单
        public static List<ServiceCharge> FindAllServiceCharge()
        {
            List<ServiceCharge> serviceChargesList = new List<ServiceCharge>();
            string sql = "select * from ServiceCharge order by CASE PaidStatus when 2 then 1 when 0 then 2 when 3 then 3 when 1 then 4 else 5 end;";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                ServiceCharge service = new ServiceCharge();
                service.Id = (int)row.ItemArray[0];
                service.SypeId = (int)row.ItemArray[1];
                service.StateTime = row.ItemArray[2].ToString();
                service.ResidentId = (int)row.ItemArray[3];
                service.ResidentName = row.ItemArray[4].ToString();
                service.RoomNumber = row.ItemArray[5].ToString();
                service.PaymentAmount = row.ItemArray[6].ToString();
                service.PaidStatus = (int)row.ItemArray[7];
                service.PaymentTime = row.ItemArray[8].ToString();
                service.After = row.ItemArray[9].ToString();
                service.Before = row.ItemArray[10].ToString();
                service.DiffValue = row.ItemArray[11].ToString();

                serviceChargesList.Add(service);
            }
            return serviceChargesList;
        }
        public static DataTable FindAllServiceCharge2()
        {

            string sql = "select * from ServiceCharge order by CASE PaidStatus when 2 then 1 when 0 then 2 when 3 then 3 when 1 then 4 else 5 end;";

            DataTable table = DBHelper.GetDataTable(sql);

            return table;
        }

        //查询水费名单
        public static DataTable Findshuifei()
        {
            string sql = "select * from where SypeId=2";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //查询未支付或逾期的名单
        public static List<ServiceCharge> FindAllServiceChargeed()
        {
            List<ServiceCharge> serviceChargesList = new List<ServiceCharge>();
            string sql = "select * from ServiceCharge where PaidStatus!=1  order by CASE PaidStatus when 3 then 1 when 0 then 2  else 3 end;";

            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                ServiceCharge service = new ServiceCharge();
                service.Id = (int)row.ItemArray[0];
                service.SypeId = (int)row.ItemArray[1];
                service.StateTime = row.ItemArray[2].ToString();
                service.ResidentId = (int)row.ItemArray[3];
                service.ResidentName = row.ItemArray[4].ToString();
                service.RoomNumber = row.ItemArray[5].ToString();
                service.PaymentAmount = row.ItemArray[6].ToString();
                service.PaidStatus = (int)row.ItemArray[7];
                service.PaymentTime = row.ItemArray[8].ToString();
                service.After = row.ItemArray[9].ToString();
                service.Before = row.ItemArray[10].ToString();
                service.DiffValue = row.ItemArray[11].ToString();
                serviceChargesList.Add(service);
            }
            return serviceChargesList;
        }
        //根据ID查询
        public static List<ServiceCharge> FindServiceChargeById(int id)
        {
            List<ServiceCharge> serviceChargesList = new List<ServiceCharge>();

            string sql = "select * from ServiceCharge where ResidentId = " + id + "";

            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                ServiceCharge service = new ServiceCharge();
                service.Id = (int)row.ItemArray[0];
                service.SypeId = (int)row.ItemArray[1];
                service.StateTime = row.ItemArray[2].ToString();
                service.ResidentId = (int)row.ItemArray[3];
                service.ResidentName = row.ItemArray[4].ToString();
                service.RoomNumber = row.ItemArray[5].ToString();
                service.PaymentAmount = row.ItemArray[6].ToString();
                service.PaidStatus = (int)row.ItemArray[7];
                service.PaymentTime = row.ItemArray[8].ToString();
            
                service.Before = row.ItemArray[9].ToString();
                service.After = row.ItemArray[10].ToString();
                service.DiffValue = row.ItemArray[11].ToString();
                serviceChargesList.Add(service);
            }
            return serviceChargesList;
        }
        //根据按钮查询缴费状态
        public static List<ServiceCharge> FindButton(int paidStatus)
        {

            string sql = "SELECT * FROM ServiceCharge WHERE PaidStatus = " + paidStatus + "";
            DataTable table = DBHelper.GetDataTable(sql);

            List<ServiceCharge> serviceChargesList = new List<ServiceCharge>();
            foreach (DataRow row in table.Rows)
            {
                ServiceCharge service = new ServiceCharge();
                service.Id = (int)row.ItemArray[0];
                service.SypeId = (int)row.ItemArray[1];
                service.StateTime = row.ItemArray[2].ToString();
                service.ResidentId = (int)row.ItemArray[3];
                service.ResidentName = row.ItemArray[4].ToString();
                service.RoomNumber = row.ItemArray[5].ToString();
                service.PaymentAmount = row.ItemArray[6].ToString();
                service.PaidStatus = (int)row.ItemArray[7];
                service.PaymentTime = row.ItemArray[8].ToString();
                service.After = row.ItemArray[9].ToString();
                service.Before = row.ItemArray[10].ToString();
                service.DiffValue = row.ItemArray[11].ToString();
                serviceChargesList.Add(service);
            }
            return serviceChargesList;
        }
        public static List<ServiceCharge> FindButton1(int paidStatus, int id)
        {

            string sql = $"SELECT * FROM ServiceCharge WHERE PaidStatus = {paidStatus} and ResidentId = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);

            List<ServiceCharge> serviceChargesList = new List<ServiceCharge>();
            foreach (DataRow row in table.Rows)
            {
                ServiceCharge service = new ServiceCharge();
                service.Id = (int)row.ItemArray[0];
                service.SypeId = (int)row.ItemArray[1];
                service.StateTime = row.ItemArray[2].ToString();
                service.ResidentId = (int)row.ItemArray[3];
                service.ResidentName = row.ItemArray[4].ToString();
                service.RoomNumber = row.ItemArray[5].ToString();
                service.PaymentAmount = row.ItemArray[6].ToString();
                service.PaidStatus = (int)row.ItemArray[7];
                service.PaymentTime = row.ItemArray[8].ToString();
                service.After = row.ItemArray[9].ToString();
                service.Before = row.ItemArray[10].ToString();
                service.DiffValue = row.ItemArray[11].ToString();
                serviceChargesList.Add(service);
            }
            return serviceChargesList;
        }
        
        //缴费更改
        public static bool UpdateServiceCharge(ServiceCharge serviceCharge)
        {

            string sql = "update ServiceCharge set PaidStatus = " + serviceCharge.PaidStatus + ",PaymentTime='" + serviceCharge.PaymentTime + "'where Id =" + serviceCharge.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        public static bool UpdateSer(ServiceCharge serviceCharge)
        {
            string sql = "update ServiceCharge set PaidStatus = " + serviceCharge.PaidStatus + "where Id =" + serviceCharge.Id + "";
            return DBHelper.ExcuteSql(sql);
        }

        public static int FindAll(int id)
        {
            string sql = "select ResidentId from ServiceCharge where Id = " + id + " ";
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
        //查询所有未交费或逾期的数据



        public static List<ServiceCharge> FindNO()
        {
            List<ServiceCharge> serviceChargesList = new List<ServiceCharge>();

            string sql = "SELECT * FROM ServiceCharge WHERE PaidStatus = 0 OR PaidStatus = 2";

            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                ServiceCharge service = new ServiceCharge();
                service.Id = (int)row.ItemArray[0];
                service.SypeId = (int)row.ItemArray[1];
                service.StateTime = row.ItemArray[2].ToString();
                service.ResidentId = (int)row.ItemArray[3];
                service.ResidentName = row.ItemArray[4].ToString();
                service.RoomNumber = row.ItemArray[5].ToString();
                service.PaymentAmount = row.ItemArray[6].ToString();
                service.PaidStatus = (int)row.ItemArray[7];
                service.PaymentTime = row.ItemArray[8].ToString();
                service.After = row.ItemArray[9].ToString();
                service.Before = row.ItemArray[10].ToString();
                service.DiffValue = row.ItemArray[11].ToString();
                serviceChargesList.Add(service);
            }
            return serviceChargesList;
        }
        //收费信息界面姓名模糊查询、时间查询
        public static DataTable Findnametime2(string reisentname, string state, string end)
        {
            string sql = "SELECT * FROM ServiceCharge WHERE 1=1";

            if (!string.IsNullOrEmpty(reisentname))
            {
                sql += "and RoomNumber LIKE '%" + reisentname + "%' ";
            }
            if (!string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(end))
            {
                sql += "and StateTime BETWEEN '" + state + "' and '" + end + "' ";
            }
            if (!string.IsNullOrEmpty(state) && string.IsNullOrEmpty(end))
            {
                sql += "and StateTime = '" + state + "' ";
            }
            sql += "order by CASE PaidStatus when 2 then 1 when 0 then 2 when 3 then 3 when 1 then 4 else 5 end";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        public static DataTable Findnametime(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId)
        {
            string sql = "SELECT * FROM ServiceCharge WHERE 1=1";
           if (paidStatus != 4)
            {
                sql += $" AND PaidStatus = {paidStatus.Value}";
            }
          if (sypeId != 4)
            {
                sql += $" AND SypeId = {sypeId.Value}";
            }
            if (!string.IsNullOrEmpty(residentName))
            {
                sql += " AND RoomNumber LIKE '%" + residentName + "%'";
            }
            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                sql += " AND StateTime BETWEEN '" + startDate + "' AND '" + endDate + "'";
            }
            if (!string.IsNullOrEmpty(startDate) && string.IsNullOrEmpty(endDate))
            {
                sql += "and StateTime = '" + startDate + "' ";
            }
            sql += "order by CASE PaidStatus when 2 then 1 when 0 then 2 when 3 then 3 when 1 then 4 else 5 end";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        //费用缴纳界面姓名模糊查询、时间查询
        public static DataTable Findnametime6(string reisentname, string state, string end)
        {
            string sql = "SELECT * FROM ServiceCharge WHERE 1=1 and PaidStatus !=1";

            if (!string.IsNullOrEmpty(reisentname))
            {
                sql += "and RoomNumber LIKE '%" + reisentname + "%' ";
            }
            if (!string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(end))
            {
                sql += "and StateTime BETWEEN '" + state + "' and '" + end + "' ";
            }
            if (!string.IsNullOrEmpty(state) && string.IsNullOrEmpty(end))
            {
                sql += "and StateTime = '" + state + "' ";
            }
            sql += " order by CASE PaidStatus when 3 then 1 when 0 then 2  else 3 end";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        public static DataTable Findnametime5(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId)
        {
            string sql = "SELECT * FROM ServiceCharge WHERE 1=1 and PaidStatus !=1";

            if (paidStatus == 4)
            {

            }
            else if (paidStatus != 4)
            {
                sql += $" AND PaidStatus = {paidStatus.Value}";
            }


            if (sypeId == 4)
            {

            }
            else if (sypeId != 4)
            {
                sql += $" AND SypeId = {sypeId.Value}";
            }

            if (!string.IsNullOrEmpty(residentName))
            {
                sql += " AND RoomNumber LIKE '%" + residentName + "%'";
            }

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                sql += " AND StateTime BETWEEN '" + startDate + "' AND '" + endDate + "'";
            }

            sql += " order by CASE PaidStatus when 3 then 1 when 0 then 2  else 3 end";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        //业主系统的姓名模糊查询、时间查询
        public static DataTable Findnametime4( string state, string end,int ID)
        {
            string sqk = "SELECT * FROM ServiceCharge WHERE 1=1 and ResidentId = "+ID+"";

         
            if (!string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(end))
            {
                sqk += "and StateTime BETWEEN '" + state + "' and '" + end + "' ";
            }
            if (!string.IsNullOrEmpty(state) && string.IsNullOrEmpty(end))
            {
                sqk += "and StateTime = '" + state + "' ";
            }
            DataTable table = DBHelper.GetDataTable(sqk);
            return table;
        }

        public static DataTable Findnametime3( string startDate, string endDate, int? paidStatus, int? sypeId,int ID)
        {
            string sql = "SELECT * FROM ServiceCharge WHERE 1=1 and ResidentId = "+ID+"";

            if (paidStatus == 4)
            {

            }
            else if (paidStatus != 4)
            {
                sql += $" AND PaidStatus = {paidStatus.Value}";
            }


            if (sypeId == 4)
            {

            }
            else if (sypeId != 4)
            {
                sql += $" AND SypeId = {sypeId.Value}";
            }

       

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                sql += " AND StateTime BETWEEN '" + startDate + "' AND '" + endDate + "'";
            }
             if (!string.IsNullOrEmpty(startDate) && string.IsNullOrEmpty(endDate))
            {
                sql += " AND StateTime = '" + startDate + "'";
            }


            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //查询物业费总和
        public static double Findwuye()
        {
            string sql = "SELECT SUM(CAST(PaymentAmount AS DECIMAL(18,2))) AS TotalPayment FROM ServiceCharge";
            DataTable table = DBHelper.GetDataTable(sql);
            if (!string.IsNullOrEmpty(table.Rows[0]["TotalPayment"].ToString()))
            {
                double residentid = Convert.ToInt32(table.Rows[0]["TotalPayment"]);
                return residentid;
            }
            else
            {
                return -1;
            }
        }
        //查询实际收取物业费总金额
        public static double Findwuyeshishou()
        {
            string sql = "SELECT SUM(CAST(PaymentAmount AS DECIMAL(18,2))) AS TotalPayment FROM ServiceCharge where PaidStatus=1";
            DataTable table = DBHelper.GetDataTable(sql);
            if (!string.IsNullOrEmpty(table.Rows[0]["TotalPayment"].ToString()))
            {
                double residentid = Convert.ToInt32(table.Rows[0]["TotalPayment"]);
                return residentid;
            }
            else
            {
                return -1;
            }
        }
        //查询物业费欠费总金额
        public static double Findwuyeqianfei()
        {
            string sql = "SELECT SUM(CAST(PaymentAmount AS DECIMAL(18,2))) AS TotalPayment FROM ServiceCharge where PaidStatus=0 or PaidStatus=2";
            DataTable table = DBHelper.GetDataTable(sql);
            if (!string.IsNullOrEmpty(table.Rows[0]["TotalPayment"].ToString()))
            {
                double residentid = Convert.ToInt32(table.Rows[0]["TotalPayment"]);
                return residentid;
            }
            else
            {
                return -1;
            }
        }



        //物业费、水费、电费综合方法
        public static (double TotalWuye, double TotalShishouWuye, double TotalQianfeiWuye,
               double TotalShuiFei, double TotalShishouShuiFei, double TotalQianfeiShuiFei,
               double TotalDianFei, double TotalShishouDianFei, double TotalQianfeiDianFei)
    GetServiceChargeSummary2(string residentname)
        {
            string sql = @"
    SELECT 
        SUM(CASE WHEN SypeId = 1 AND PaidStatus = 1 THEN PaymentAmount ELSE 0 END) AS TotalShishouWuye,
        SUM(CASE WHEN SypeId = 1 AND PaidStatus IN (0, 2) THEN PaymentAmount ELSE 0 END) AS TotalQianfeiWuye,
        SUM(CASE WHEN SypeId = 1 THEN PaymentAmount ELSE 0 END) AS TotalWuye,

        SUM(CASE WHEN SypeId = 2 AND PaidStatus = 1 THEN PaymentAmount ELSE 0 END) AS TotalShishouShuiFei,
        SUM(CASE WHEN SypeId = 2 AND PaidStatus IN (0, 2) THEN PaymentAmount ELSE 0 END) AS TotalQianfeiShuiFei,
        SUM(CASE WHEN SypeId = 2 THEN PaymentAmount ELSE 0 END) AS TotalShuiFei,

        SUM(CASE WHEN SypeId = 3 AND PaidStatus = 1 THEN PaymentAmount ELSE 0 END) AS TotalShishouDianFei,
        SUM(CASE WHEN SypeId = 3 AND PaidStatus IN (0, 2) THEN PaymentAmount ELSE 0 END) AS TotalQianfeiDianFei,
        SUM(CASE WHEN SypeId = 3 THEN PaymentAmount ELSE 0 END) AS TotalDianFei
    FROM ServiceCharge where ResidentName='"+residentname+"'";

            DataTable table = DBHelper.GetDataTable(sql);

            if (table.Rows.Count > 0 &&
                !table.Rows[0].IsNull("TotalShishouWuye") &&
                !table.Rows[0].IsNull("TotalQianfeiWuye") &&
                !table.Rows[0].IsNull("TotalWuye") &&
                !table.Rows[0].IsNull("TotalShishouShuiFei") &&
                !table.Rows[0].IsNull("TotalQianfeiShuiFei") &&
                !table.Rows[0].IsNull("TotalShuiFei") &&
                !table.Rows[0].IsNull("TotalShishouDianFei") &&
                !table.Rows[0].IsNull("TotalQianfeiDianFei") &&
                !table.Rows[0].IsNull("TotalDianFei"))
            {
                return (
                    Convert.ToDouble(table.Rows[0]["TotalWuye"]),
                    Convert.ToDouble(table.Rows[0]["TotalShishouWuye"]),
                    Convert.ToDouble(table.Rows[0]["TotalQianfeiWuye"]),
                    Convert.ToDouble(table.Rows[0]["TotalShuiFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalShishouShuiFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalQianfeiShuiFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalDianFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalShishouDianFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalQianfeiDianFei"])
                );
            }
            else
            {
                return (0, 0, 0, 0, 0, 0, 0, 0, 0);
            }
        }   
        public static (double TotalWuye, double TotalShishouWuye, double TotalQianfeiWuye,
               double TotalShuiFei, double TotalShishouShuiFei, double TotalQianfeiShuiFei,
               double TotalDianFei, double TotalShishouDianFei, double TotalQianfeiDianFei)
    GetServiceChargeSummary1()
        {
            string sql = @"
    SELECT 
        SUM(CASE WHEN SypeId = 1 AND PaidStatus = 1 THEN PaymentAmount ELSE 0 END) AS TotalShishouWuye,
        SUM(CASE WHEN SypeId = 1 AND PaidStatus IN (0, 2) THEN PaymentAmount ELSE 0 END) AS TotalQianfeiWuye,
        SUM(CASE WHEN SypeId = 1 THEN PaymentAmount ELSE 0 END) AS TotalWuye,

        SUM(CASE WHEN SypeId = 2 AND PaidStatus = 1 THEN PaymentAmount ELSE 0 END) AS TotalShishouShuiFei,
        SUM(CASE WHEN SypeId = 2 AND PaidStatus IN (0, 2) THEN PaymentAmount ELSE 0 END) AS TotalQianfeiShuiFei,
        SUM(CASE WHEN SypeId = 2 THEN PaymentAmount ELSE 0 END) AS TotalShuiFei,

        SUM(CASE WHEN SypeId = 3 AND PaidStatus = 1 THEN PaymentAmount ELSE 0 END) AS TotalShishouDianFei,
        SUM(CASE WHEN SypeId = 3 AND PaidStatus IN (0, 2) THEN PaymentAmount ELSE 0 END) AS TotalQianfeiDianFei,
        SUM(CASE WHEN SypeId = 3 THEN PaymentAmount ELSE 0 END) AS TotalDianFei
    FROM ServiceCharge where MONTH(StateTime) = MONTH(GETDATE()) AND YEAR(StateTime) = YEAR(GETDATE()); ";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table.Rows.Count > 0 &&
                !table.Rows[0].IsNull("TotalShishouWuye") &&
                !table.Rows[0].IsNull("TotalQianfeiWuye") &&
                !table.Rows[0].IsNull("TotalWuye") &&
                !table.Rows[0].IsNull("TotalShishouShuiFei") &&
                !table.Rows[0].IsNull("TotalQianfeiShuiFei") &&
                !table.Rows[0].IsNull("TotalShuiFei") &&
                !table.Rows[0].IsNull("TotalShishouDianFei") &&
                !table.Rows[0].IsNull("TotalQianfeiDianFei") &&
                !table.Rows[0].IsNull("TotalDianFei"))
            {
                return (
                    Convert.ToDouble(table.Rows[0]["TotalWuye"]),
                    Convert.ToDouble(table.Rows[0]["TotalShishouWuye"]),
                    Convert.ToDouble(table.Rows[0]["TotalQianfeiWuye"]),
                    Convert.ToDouble(table.Rows[0]["TotalShuiFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalShishouShuiFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalQianfeiShuiFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalDianFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalShishouDianFei"]),
                    Convert.ToDouble(table.Rows[0]["TotalQianfeiDianFei"])
                );
            }
            else
            {
                return (0, 0, 0, 0, 0, 0, 0, 0, 0);
            }
        }
    }
}
