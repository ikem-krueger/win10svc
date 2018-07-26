using System;
using System.IO;
using System.IO.Compression;
using System.ServiceProcess;
using System.Diagnostics;

namespace ConsoleApplication
{
    public static class IniFileHelper
    {
        public static int capacity = 512;


        [DllImport("kernel32", CharSet = CharSet.Unicode)]
        private static extern int GetPrivateProfileString(string section, string key, string defaultValue, StringBuilder value, int size, string filePath);

        [DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
        static extern int GetPrivateProfileString(string section, string key, string defaultValue, [In, Out] char[] value, int size, string filePath);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
        private static extern int GetPrivateProfileSection(string section, IntPtr keyValue, int size, string filePath);

        [DllImport("kernel32", CharSet = CharSet.Unicode, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool WritePrivateProfileString(string section, string key, string value, string filePath);

        public static bool WriteValue(string section, string key, string value, string filePath)
        {
            bool result = WritePrivateProfileString(section, key, value, filePath);
            return result;
        }

        public static bool DeleteSection(string section, string filepath)
        {
            bool result = WritePrivateProfileString(section, null, null, filepath);
            return result;
        }

        public static bool DeleteKey(string section, string key, string filepath)
        {
            bool result = WritePrivateProfileString(section, key, null, filepath);
            return result;
        }

        public static string ReadValue(string section, string key, string filePath, string defaultValue = "")
        {
            var value = new StringBuilder(capacity);
            GetPrivateProfileString(section, key, defaultValue, value, value.Capacity, filePath);
            return value.ToString();
        }

        public static string[] ReadSections(string filePath)
        {
            // first line will not recognize if ini file is saved in UTF-8 with BOM
            while (true)
            {
                char[] chars = new char[capacity];
                int size = GetPrivateProfileString(null, null, "", chars, capacity, filePath);

                if (size == 0)
                {
                    return null;
                }

                if (size < capacity - 2)
                {
                    string result = new String(chars, 0, size);
                    string[] sections = result.Split(new char[] { '\0' }, StringSplitOptions.RemoveEmptyEntries);
                    return sections;
                }

                capacity = capacity * 2;
            }
        }

        public static string[] ReadKeys(string section, string filePath)
        {
            // first line will not recognize if ini file is saved in UTF-8 with BOM
            while (true)
            {
                char[] chars = new char[capacity];
                int size = GetPrivateProfileString(section, null, "", chars, capacity, filePath);

                if (size == 0)
                {
                    return null;
                }

                if (size < capacity - 2)
                {
                    string result = new String(chars, 0, size);
                    string[] keys = result.Split(new char[] { '\0' }, StringSplitOptions.RemoveEmptyEntries);
                    return keys;
                }

                capacity = capacity * 2;
            }
        }

        public static string[] ReadKeyValuePairs(string section, string filePath)
        {
            while (true)
            {
                IntPtr returnedString = Marshal.AllocCoTaskMem(capacity * sizeof(char));
                int size = GetPrivateProfileSection(section, returnedString, capacity, filePath);

                if (size == 0)
                {
                    Marshal.FreeCoTaskMem(returnedString);
                    return null;
                }

                if (size < capacity - 2)
                {
                    string result = Marshal.PtrToStringAuto(returnedString, size - 1);
                    Marshal.FreeCoTaskMem(returnedString);
                    string[] keyValuePairs = result.Split('\0');
                    return keyValuePairs;
                }

                Marshal.FreeCoTaskMem(returnedString);
                capacity = capacity * 2;
            }
        }
    }

    static class NativeMethods
    {
        [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true, BestFitMapping = false, ThrowOnUnmappableChar = true)]
        internal static extern IntPtr LoadLibrary(string lpLibFileName);

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true, BestFitMapping = false, ThrowOnUnmappableChar = true)]
        internal static extern int LoadString(IntPtr hInstance, uint wID, StringBuilder lpBuffer, int nBufferMax);

        [DllImport("kernel32.dll")]
        public static extern int FreeLibrary(IntPtr hLibModule);
    }

    static string GetStringResource(IntPtr handle, uint resourceId)
    {
        StringBuilder buffer = new StringBuilder(8192);     //Buffer for output from LoadString()

        int length = NativeMethods.LoadString(handle, resourceId, buffer, buffer.Capacity);

        return buffer.ToString(0, length);      //Return the part of the buffer that was used.
    }

    class RegistryFileReader
    {
        public RegistryFileReader(string filePath)
        {
            string this.FilePath = filePath;
            string this.Section = this.GetSection();
            
            string this.ServiceName = this.GetServiceName();
            string this.DisplayName = this.GetDisplayName();
            string this.Description = this.GetDescription();
            string this.StartType = this.GetStartType();
        }

        string GetSection()
        {
            string Section = IniFileHelper.ReadSections(this.FilePath)[0];
        
            return Section;
        }

        string GetServiceName()
        {
            string serviceName = Path.GetFileName(Section);
        
            return serviceName;
        }
        
        string GetDisplayName()
        {
            string displayName = IniFileHelper.ReadValue(string Section, string "DisplayName", string FilePath);

            string path, resourceId = description.Split(",");

            string expandedPath = Environment.ExpandEnvironmentVariables(path);
            string absoluteResourceId = Math.Abs(resourceId);
            
            return GetStringResource((expandedPath, absoluteResourceId);
        }

        string GetDescription()
        {
            string description = IniFileHelper.ReadValue(string Section, string "Description", string FilePath);
            
            string path, resourceId = description.Split(",");

            string expandedPath = Environment.ExpandEnvironmentVariables(path);
            string absoluteResourceId = Math.Abs(resourceId);
            
            return GetStringResource((expandedPath, absoluteResourceId);
        }

        string GetStartType()
        {
            /* 
            http://daijia11.blogspot.com/2010/08/how-to-change-service-start-type-in.html
            
            0x0 Boot
            0x1 System
            0x2 Automatic
            0x3 Manual
            0x4 Disabled
            */
            
            string startType = IniFileHelper.ReadValue(string Section, string "Start", string FilePath);
            
            startType = Convert.ToInt32(startType.Split(":")[1]);
            
            return startType;
        }

    class Win10Svc()
    {
        static void Main(string[] args)
        {
            string zipFile = "services.zip";
            string tempPath = Path.GetTempPath();
            string extractPath = tempPath + @"win10srv\";
            
            Console.WriteLine("Extract {0}...", zipFile);
            ZipFile.ExtractToDirectory(zipFile, extractPath);
            
            string[] regFiles = DirectoryPath.GetFiles(extractPath, "*.reg");
            
            foreach(string regFile in regFiles)
            {
                RegistryFileReader reg = new RegistryFileReader(regFile);
                
                ServiceController service = new ServiceController(reg.ServiceName);
                
                Console.Write("Stopping service '{0}'... ", reg.ServiceName);
                
                service.Stop();
                
                if service.Status == ServiceControllerStatus.Stopped:
                    Console.WriteLine("Success.");
                else:
                    Console.WriteLine("Fail!");
                
                Console.Write("Resetting service '{0}'... ", reg.ServiceName);
                
                regImportProcess = Process.Start("reg.exe import " + regFile);
                
                if regImportProcess.ExitCode == 0:
                    Console.WriteLine("Success.");
                else:
                    Console.WriteLine("Fail!");
                
                if reg.StartType == 2: // Automatic
                    Console.Write("Starting service {0}... ", reg.ServiceName);
                    
                    service.Start();
                    
                    if service.Status == ServiceControllerStatus.Running:
                        Console.WriteLine("Success.");
                    else:
                        Console.WriteLine("Fail!");
                else:
                    Console.WriteLine("Skipping service {0}...", reg.ServiceName);
            }
        }
    }
}
