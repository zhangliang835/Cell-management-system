using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class NoticeService
    {
        //查询管理员发布的公告记录
        public static List<Notice> FindAllNotice()
        {
            List<Notice> noticeList = new List<Notice>();
            string sql = "select * from Notice";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Notice notice = new Notice();
                notice.Id = (int)row.ItemArray[0];
                notice.Title = row.ItemArray[1].ToString();
                notice.Content = row.ItemArray[2].ToString();
                notice.Photo = row.ItemArray[3].ToString();           
                notice.PublishTime = row.ItemArray[4].ToString();
                noticeList.Add(notice);
            }
            return noticeList;
        }
        //查询业主的所有公告记录
        public static DataTable FindAllResident()
        {
            string sql = "select * from Notice where FaSongID = 1 or  FaSongID =0";
            DataTable data = DBHelper.GetDataTable(sql);
            return data;
        }
        //查询员工的所有公告记录
        public static DataTable FindAllStaff()
        {
            string sql = "select * from Notice where FaSongID = 2 or  FaSongID =0";
            DataTable data = DBHelper.GetDataTable(sql);
            return data;
        }
        //增加公告记录
        public static bool AddNotice(Notice notice)
        {
            string sql = "insert into Notice values('" + notice.Title + "','" + notice.Content + "','" + notice.Photo + "','" + notice.PublishTime + "',"+notice.FaSongID+")";
            return DBHelper.ExcuteSql(sql);
        }
        //修改公告
        public static bool UpdateNotice(Notice notice)
        {
            string sql = "Update Notice set Title='" + notice.Title + "',Content='" + notice.Content + "',Photo='" + notice.Photo + "',PublishTime='" + notice.PublishTime + "',FaSongID="+notice.FaSongID+" where Id = " + notice.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        //删除公告
        public static bool DeleteNotice(int Id)
        {
            string sql = "delete from Notice where Id = " + Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //根据ID查询公告
        public static Notice FindALLById(int id)
        {
            List<Notice> noticeslist = new List<Notice>();
            string sql = "select*from Notice where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Notice notice = new Notice();
                notice.Id = (int)row.ItemArray[0];
                notice.Title = row.ItemArray[1].ToString();
                notice.Content = row.ItemArray[2].ToString();
                notice.Photo = row.ItemArray[3].ToString();
                notice.PublishTime = row.ItemArray[4].ToString();                           
                noticeslist.Add(notice);
            }
            return noticeslist.Count > 0 ? noticeslist[0] : null;
        }
    }
}
