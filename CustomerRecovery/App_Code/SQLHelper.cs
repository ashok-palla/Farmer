using System.Configuration;
using System;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;
using Atharvana.Web.Common;
using Atharvana.Common.CustomException;

public class SQLHelper
{
    private readonly string _connectionString;
    private static SQLHelper _instance;
    private readonly bool _debugEnabled;
    
    private SQLHelper(string connectionString)
    {
        _connectionString = connectionString;
        try
        {
            _debugEnabled = bool.Parse(ConfigurationManager.AppSettings["DebugEnabled"]);
        }
        catch (Exception)
        {
            // ignored
        }
    }

    public static SQLHelper GetInstance()
    {
        return _instance ?? (_instance = new SQLHelper("CustomerRecoveryConnectionString"));
    }

    public DataTable ExecuteStoredProcedure(string procedureName, SqlParameter[] parameters = (SqlParameter[]) null)
    {
        var dt = new DataTable();
        //Stopwatch to Log Bottleneck Procedures
        var sw = new Stopwatch();
        sw.Start();
        var conn = OpenDbConnection();
        //Only try to execute the stored procedure if connected to the database
        if (conn.State == ConnectionState.Open)
        {
            try
            {
                //stored procedure
                var dataAdapter = new SqlDataAdapter(procedureName, conn) { SelectCommand = { CommandType = CommandType.StoredProcedure } };
                //stored procedure parameters
                if (parameters != null)
                {
                    foreach (var param in parameters)
                    {
                        dataAdapter.SelectCommand.Parameters.Add(param);
                        dataAdapter.SelectCommand.CommandTimeout = 180;
                    }
                }
                //use datatable as equiv of a recordset:
                dataAdapter.Fill(dt);
            }
            catch (SqlException sex)
            {

                throw sex.Number >= 50000 ? new CustomMessageException(sex.Message, sex) : new CustomMessageException(sex.Message);
            }
            finally
            {
                CloseDbConnection(conn);
            }
        }

        //Stop the Stopwatch
        sw.Stop();
        try
        {
            var threshold = long.Parse(ConfigurationManager.AppSettings["SProcEventLogThresholdMilliSeconds"]);
            if ((sw.ElapsedMilliseconds > threshold))
            {
                Helpers.WriteToEventLog(string.Format("Procedure: {0} took: {1} ms to run", procedureName, sw.ElapsedMilliseconds));
            }
        }
        catch
        {
            //Dont bother throwing an Exception, as its no show stopper!
        }

        //return DataTable
        return dt;
    }

    public DataSet ExecuteStoredProcedureReturnDataSet(string procedureName, SqlParameter[] parameters)
    {
        var ds = new DataSet();
        var conn = OpenDbConnection();

        //Stopwatch to Log Bottleneck Procedures
        var sw = new Stopwatch();
        sw.Start();

        //Only try to execute the stored procedure if connected to the database
        if ((conn.State == ConnectionState.Open))
        {
            try
            {
                //stored procedure
                var dataAdapter = new SqlDataAdapter(procedureName, conn) { SelectCommand = { CommandType = CommandType.StoredProcedure } };
                //stored procedure parameters
                if ((parameters != null))
                {
                    foreach (var param in parameters)
                    {
                        dataAdapter.SelectCommand.Parameters.Add(param);
                        dataAdapter.SelectCommand.CommandTimeout = 180;
                    }
                }
                //use datatable as equiv of a recordset:
                dataAdapter.Fill(ds);
            }
            catch (SqlException SqlExp)
            {
                throw SqlExp.Number >= 50000 ? new CustomMessageException(SqlExp.Message, SqlExp) : new CustomMessageException(SqlExp.Message);
            }
            finally
            {
                CloseDbConnection(conn);
            }
        }

        //Stop the Stopwatch
        sw.Stop();
        try
        {
            //Try and Write to Event Log, if Threshold Exceeded
            var threshold = long.Parse(ConfigurationManager.AppSettings["SProcEventLogThresholdMilliSeconds"]);
            if ((sw.ElapsedMilliseconds > threshold))
            {
                Helpers.WriteToEventLog(string.Format("Procedure: {0} took: {1} ms to run", procedureName, sw.ElapsedMilliseconds));
            }
        }
        catch
        {
            //Dont bother throwing an Exception, as its no show stopper!
        }

        return ds;
    }

    private SqlConnection OpenDbConnection()
    {
        SqlConnection conn;
        try
        {
            //Modify to your settings:
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings[_connectionString].ConnectionString);
            conn.Open();
        }

        catch (Exception ex)
        {
            throw new CustomMessageException("Could not connect to the database.", ex);
        }
        return conn;
    }

    private static void CloseDbConnection(IDbConnection conn)
    {
        try
        {
            conn.Close();
        }
        catch (Exception ex)
        {
            throw new CustomMessageException("Could not close the database connection.", ex);
        }
    }
}