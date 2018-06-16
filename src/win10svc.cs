using System;
using System.IO;
using System.IO.Compression;
using System.ServiceProcess;
using System.Diagnostics;

namespace ConsoleApplication
{
    class RegistryFileReader
    {
        string GetServiceName(string registryFile)
        {
            // [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc]
            return ""
        }
        
        string GetDisplayName(string registryFile)
        {
            // "DisplayName"="@%systemroot%\\system32\\XboxNetApiSvc.dll,-100"
            return "";
        }

        string GetDescription(string registryFile)
        {
            // "Description"="@%systemroot%\\system32\\XboxNetApiSvc.dll,-101"
            return "";
        }

        string GetStartType(string registryFile)
        {
            /* 
            http://daijia11.blogspot.com/2010/08/how-to-change-service-start-type-in.html
            
            0x0 Boot
            0x1 System
            0x2 Automatic
            0x3 Manual
            0x4 Disabled
            */
            
            // "Start"=dword:00000003
            return "";
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
                
                serviceName = reg.GetServiceName();
                
                ServiceController service = new ServiceController(serviceName);
                
                Console.Write("Stop service '{0}'... ", serviceName);
                
                service.Stop();
                
                if service.Status == ServiceControllerStatus.Stopped:
                    Console.WriteLine("Success.");
                else:
                    Console.WriteLine("Fail!");
                
                Console.Write("Reset service '{0}'... ", serviceName);
                
                regImportProcess = Process.Start("reg.exe import " + regFile);
                
                if regImportProcess.ExitCode == 0:
                    Console.WriteLine("Success.");
                else:
                    Console.WriteLine("Fail!");
                
                string startType = reg.GetStartType();
                
                if startType == 2: // Automatic
                    Console.Write("Start service {0}... ", serviceName);
                    
                    service.Start();
                    
                    if service.Status == ServiceControllerStatus.Running:
                        Console.WriteLine("Success.");
                    else:
                        Console.WriteLine("Fail!");
                else:
                    Console.WriteLine("Skip service {0}...", serviceName);
            }
        }
    }
}
