using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace BLL
{
    public static  class MaintenanceRecordManager
    {
        public static bool AddMaintenance(MaintenanceRecord maintenance)
        {
            return MaintenanceRecordService.AddMaintenance(maintenance);
        }
        public static List<MaintenanceRecord> FindAll()
        {
            return MaintenanceRecordService.FindAll();
        }
        public static List<MaintenanceRecord> FindById(int userid)
        {
            return MaintenanceRecordService.FindById(userid);
        }
        //根据主键ID查询
        public static MaintenanceRecord FindAllById(int id)
        {
            return MaintenanceRecordService.FindAllById(id);
        }

        //修改维修人员ID
        public static bool UpdateMaintenance(MaintenanceRecord maintenance)
        {
            return MaintenanceRecordService.UpdateMaintenance(maintenance);
        }

        public static  List<MaintenanceRecord> FindAllByIdSta(int repairerid)
        {
            return MaintenanceRecordService.FindAllByIdSta(repairerid);
        }
        public static bool UpdateMaintenance2(MaintenanceRecord maintenance)
        {
            return MaintenanceRecordService.UpdateMaintenance2(maintenance);
        }   public static bool UpdateMaintenance4(MaintenanceRecord maintenance)
        {
            return MaintenanceRecordService.UpdateMaintenance4(maintenance);
        }
        //修改维修图片和维修完成时间
        public static bool UpdateMaintenance3(MaintenanceRecord maintenance)
        {
            return MaintenanceRecordService.UpdateMaintenance3(maintenance);
        }
    }
}
