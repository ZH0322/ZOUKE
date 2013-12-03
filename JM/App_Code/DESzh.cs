﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
/// <summary>
///DES 的摘要说明
/// </summary>
public class DESzh
{
	public DESzh()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    private static string key = "zhoufoxcn";

    /**/
    /// <summary>
    /// 对称加密解密的密钥
    /// </summary>
    public static string Key
    {
        get
        {
            return key;
        }
        set
        {
            key = value;
        }
    }
    /// <summary>
    /// DES加密
    /// </summary>
    /// <param name="encryptString"></param>
    /// <returns></returns>
    public static string DesEncrypt(string encryptString)
    {
        byte[] keyBytes = Encoding.UTF8.GetBytes(key.Substring(0, 8));
        byte[] keyIV = keyBytes;
        byte[] inputByteArray = Encoding.UTF8.GetBytes(encryptString);
        DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
        MemoryStream mStream = new MemoryStream();
        CryptoStream cStream = new CryptoStream(mStream, provider.CreateEncryptor(keyBytes, keyIV), CryptoStreamMode.Write);
        cStream.Write(inputByteArray, 0, inputByteArray.Length);
        cStream.FlushFinalBlock();
        return Convert.ToBase64String(mStream.ToArray());
    }

    /**/
    /// <summary>
    /// DES解密
    /// </summary>
    /// <param name="decryptString"></param>
    /// <returns></returns>
    public static string DesDecrypt(string decryptString)
    {
        byte[] keyBytes = Encoding.UTF8.GetBytes(key.Substring(0, 8));
        byte[] keyIV = keyBytes;
        byte[] inputByteArray = Convert.FromBase64String(decryptString);
        DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
        MemoryStream mStream = new MemoryStream();
        CryptoStream cStream = new CryptoStream(mStream, provider.CreateDecryptor(keyBytes, keyIV), CryptoStreamMode.Write);
        cStream.Write(inputByteArray, 0, inputByteArray.Length);
        cStream.FlushFinalBlock();
        return Encoding.UTF8.GetString(mStream.ToArray());
    }
}