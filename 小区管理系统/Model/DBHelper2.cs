using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public static class DBHelper2
    {
        // 数据库连接字符串
        private static string ConnString = "server=GGB;database=CommunityDB;User ID=sa;Password=123456";
        private static SqlConnection conn;

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

        public static DataTable GetDataTable(string sql, params SqlParameter[] parameters)
        {
            Init();
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                foreach (SqlParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                SqlDataAdapter dap = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                dap.Fill(table);
                return table;
            }
        }

        public static bool ExecuteNonQueryWithParameters(string sql, Dictionary<string, object> parameters)
        {
            Init();
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                foreach (var kvp in parameters)
                {
                    var value = kvp.Value ?? DBNull.Value;
                    cmd.Parameters.AddWithValue(kvp.Key, value);
                }

                int result = cmd.ExecuteNonQuery();
                return result > 0 ? true : false;
            }
        }
    }
}
