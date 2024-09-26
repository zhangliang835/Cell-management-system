using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{

    public static class DBHelper
    {
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        private static string ConnString = "server=GGB;database=CommunityDB;User ID=sa;Password=123456";
        /// <summary>
        /// 数据库连接
        /// </summary>
        private static SqlConnection conn;


        /// <summary>
        /// 数据库连接初始化
        /// </summary>
        public static void Init()
        {
            if (conn == null)
            {
                conn = new SqlConnection(ConnString);
            }
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            if (conn.State == ConnectionState.Broken)
            {
                conn.Close();
                conn.Open();
            }
        }

        /// <summary>
        /// 根据sql语句查询数据
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static DataTable GetDataTable(string sql)
        {
            Init();
            SqlDataAdapter dap = new SqlDataAdapter(sql, conn);
            DataTable table = new DataTable();
            dap.Fill(table);
            return table;
        }

        /// <summary>
        /// 用于数据表的新增、修改、删除的数据操作
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static bool ExcuteSql(string sql)
        {
            Init();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int result = cmd.ExecuteNonQuery();
            return result > 0 ? true : false;
        }
    }
}
