using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.Practices.EnterpriseLibrary.Data;
 
namespace DataAccessLayer
{
    public partial class DataAccess
    {
        /// <summary>
        /// It instantiate the SQL Connection of the DAL using the Enterprise Library.
        /// </summary>
        private static Database customDB = null;
        private static Database Custom_DB
        {
            get
            {
                if (customDB == null)
                {
                    string ConnectionString = string.Empty;
                    try
                    {
                        if (Configuration == null)
                        {
                            ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ProfileDB"].ToString();
                        }
                        else
                        {
                            ConnectionString = Configuration.ConnectionStrings.ConnectionStrings["ProfileDB"].ToString();
                        }
                    }
                    catch (Exception ex) { }
                    finally
                    {
                        if (!string.IsNullOrEmpty(ConnectionString))
                        {
                            customDB = new SqlDatabase(ConnectionString);
                        }
                    }
                }
                return customDB;
            }
        }

        public static System.Configuration.Configuration Configuration { get; set; }

        public static DataTable Run_StoredProc(string SPName, FlexibleParameters pParams)
        {
            try
            {
                DbCommand spCommand = Custom_DB.GetStoredProcCommand(SPName);

                foreach (FlexibleParameter Parm in pParams)
                {
                    if (Parm != null)
                    {
                        Custom_DB.AddInParameter(spCommand, Parm.ParameterNm, Parm.ParameterDBType, Parm.ParameterValue);
                    }
                }
                IDataReader reader = Custom_DB.ExecuteReader(spCommand);
                DataTable intervalData = new DataTable("UserInfoTable");
                intervalData.Load(reader);

                return intervalData;
            }
            catch (Exception ex)
            {
                throw (ex);
            }

        }

        public static DataTable GetUserInfoDetails(string userID)
        {
            FlexibleParameters pParams = new FlexibleParameters(1);
            pParams.Add(new FlexibleParameter("@userid", 0, DbType.String, userID));
            return Run_StoredProc("SP_GetUserInfo", pParams);
        }
    }
}