public sealed class IniReader
{
    [DllImport("kernel32.dll", EntryPoint="GetPrivateProfileStringW", CharSet=CharSet.Unicode, ExactSpelling=true, SetLastError=true), SuppressUnmanagedCodeSecurity]
    private static extern int GetPrivateProfileString(string lpAppName, string lpKeyName, string lpDefault,
        [MarshalAs(UnmanagedType.LPArray, SizeParamIndex=4)] char[] lpReturnedString, int nSize, string lpFileName);
 
    private static string GetPrivateProfileString(string fileName, string sectionName, string keyName)
    {
        char[] ret = new char[256];
 
        while (true)
        {
            int length = GetPrivateProfileString(sectionName, keyName, null, ret, ret.Length, fileName);
            
            if (length == 0)
                Marshal.ThrowExceptionForHR(Marshal.GetHRForLastWin32Error());
 
            // This function behaves differently if both sectionName and keyName are null
            if (sectionName != null && keyName != null)
            {
                if (length == ret.Length - 1)
                {
                    // Double the buffer size and call again
                    ret = new char[ret.Length * 2];
                }
                else
                {
                    // Return simple string
                    return new string(ret, 0, length);
                }
            }
            else
            {
                if (length == ret.Length - 2)
                {
                    // Double the buffer size and call again
                    ret = new char[ret.Length * 2];
                }
                else
                {
                    // Return multistring
                    return new string(ret, 0, length - 1);
                }
            }
        }
    }
 
    public static string[] SectionNames(string fileName)
    {
        return GetPrivateProfileString(fileName, null, null).Split('\0');
    }
 
    public static string[] KeyNames(string fileName, string sectionName)
    {
        return GetPrivateProfileString(fileName, sectionName, null).Split('\0');
    }
 
    public static string Value(string fileName, string sectionName, string keyName)
    {
        return GetPrivateProfileString(fileName, sectionName, keyName);
    }
}
