/// <copyright file="FilterGridView.cs" company="PMI">
///     All rights reserved.
/// </copyright>
/// <author>Me</author>

using System;
using System.Collections;
using System.Data;

namespace DataAccessLayer
{
    /// <summary>
    /// Class for the parameters of the Stored Procedure
    /// </summary>

    public class FlexibleParameter
    {
        private string strParameterNm;
        private int iParameterNo;
        private DbType oParameterDBType;
        private object oParameterValue;




        public FlexibleParameter(string pParameterNm, int pParameterNo, DbType pParameterDBType, object pParameterValue)
        {
            strParameterNm = pParameterNm;
            iParameterNo = pParameterNo;
            oParameterDBType = pParameterDBType;
            oParameterValue = pParameterValue;
            
        }
        /// <summary>
        /// It accepts a string value, returning value of the parameter name.
        /// </summary>
        public string ParameterNm
        {
            get
            {
                return strParameterNm;
            }
            set
            {
                strParameterNm = value;
            }
        }
        /// <summary>
        /// It accepts an int value, returning the value of the parameter sequence.
        /// </summary>
        public int ParameterNo
        {
            get
            {
                return iParameterNo;
            }
            set
            {
                iParameterNo = value;
            }
        }
        /// <summary>
        /// It accepts a value, returning the value of the parameter type.
        /// </summary>
        public DbType ParameterDBType
        {
            get
            {
                return oParameterDBType;
            }
            set
            {
                oParameterDBType = value;
            }
        }
        /// <summary>
        /// It accepts any value, returning the value of the parameter itself.
        /// </summary>
        public object ParameterValue
        {
            get
            {
                return oParameterValue;
            }
            set
            {
                oParameterValue = value;
            }
        }
        public static DbType TypeToDbType(Type t)
        {
            DbType dbt;
            try
            {
                dbt = (DbType)Enum.Parse(typeof(DbType), t.Name);
            }
            catch
            {
                dbt = DbType.Object;
            }
            return dbt;
        } 

    }

    public class FlexibleParameters : IEnumerator, IEnumerable
    {
        private FlexibleParameter[] ParameterArray;
        private bool bEOF;
        int position = -1;

        public FlexibleParameters(int pParameterCount)
        {
            ParameterArray = new FlexibleParameter[pParameterCount];
        }
        public FlexibleParameters(DataRow DR)
        {
            int ColumnCount;
            try
            {
                ColumnCount = DR.Table.Columns.Count;
                ParameterArray = new FlexibleParameter[ColumnCount];
                for (int i = 0; i < ColumnCount; i++)
                {
                    ParameterArray[i] = new FlexibleParameter(DR.Table.Columns[i].ColumnName, i + 1, FlexibleParameter.TypeToDbType(DR[i].GetType()), DR[i]);  
                }
            }
            catch (Exception e)
            {
                throw new Exception("Failed to Convert Data Row into Parameter Array.", e);
            }
        }
        #region IEnumerable Members
        public IEnumerator GetEnumerator()
        {
            //return (IEnumerator)this;
            for (int i = 0; i < ParameterArray.Length; i++)
            {
                yield return ParameterArray[i];
            }
        }
        #endregion

        #region IEnumerator Members
        public FlexibleParameter Current
        {
            get
            {
                return ParameterArray[position];
            }
        }
        Object IEnumerator.Current
        {
            get
            {
                return Current;
            }
        }
        public FlexibleParameter this[int pPosition]
        {
            get
            {
                return ParameterArray[pPosition];

            }
            set
            {
                ParameterArray[pPosition] = value;
            }
        }
        public FlexibleParameter this[string pParamNm]
        {
            get
            {
                for (int i = 0; i <= ParameterArray.GetUpperBound(0); i++)
                {
                    if (pParamNm.ToUpper() == ParameterArray[i].ParameterNm.ToUpper())
                        return ParameterArray[i];
                }
                return null;
            }
            set
            {
                for (int i = 0; i <= ParameterArray.GetUpperBound(0) + 1; i++)
                {
                    if (pParamNm.ToUpper() == ParameterArray[i].ParameterNm.ToUpper())
                    {
                        ParameterArray[i] = value;
                    }
                }
            }
        }
        public bool MoveNext()
        {
            position++;
            if (position < ParameterArray.Length)
            {
                bEOF = false;
                return true;
            }
            else
            {
                bEOF = true;
                return false;
            }
        }
        public void Reset()
        {
            position = -1;
        }
        public void MoveFirst()
        {
            position = 0;
        }
        #endregion
        public bool EOF
        {
            get
            {
                return bEOF;
            }
        }
        public void Add(FlexibleParameter pParam)
        {
            ParameterArray[ParameterArray.Length - 1] = pParam;
            ParameterArray = (FlexibleParameter[])Resize(ParameterArray, ParameterArray.Length + 1);


        }
        public static Array Resize(Array array, int newSize)
        {
            Type type = array.GetType().GetElementType();
            Array newArray = Array.CreateInstance(type, newSize);
            Array.Copy(array, 0, newArray, 0, Math.Min(array.Length, newSize));
            return newArray;
        }

        public DataRow ToDataRow
        {
            get
            {
                try
                {
                    object[] Values = new object[ParameterArray.Length];
                    DataTable DT = new DataTable();
                    for (int i = 0; i < ParameterArray.Length; i++)
                    {
                        DT.Columns.Add(ParameterArray[i].ParameterNm);
                        Values[i] = ParameterArray[i].ParameterValue;
                    }
                    DT.Rows.Add(Values);
                    return DT.Rows[0];
                }
                catch (Exception e)
                {
                    throw new Exception("Failed to convert Parameters into DataRow", e);
                }
            }
        }


    }
 
}


